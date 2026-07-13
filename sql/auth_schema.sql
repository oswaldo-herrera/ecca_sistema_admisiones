-- ================================================
--  ECCA — Módulo de Autenticación y Roles
--  Ejecutar una sola vez en el SQL Editor de Supabase
--  IMPORTANTE: Primero crea al menos un usuario en
--  Supabase → Authentication → Users → Add User
-- ================================================

-- 1) Tabla de perfiles de usuario -------------------
create table if not exists perfiles (
  id         uuid primary key references auth.users(id) on delete cascade,
  rol        text not null default 'asesor',
  -- Roles: admin | director | asesor | profesor | control_escolar | ventas
  nombre     text,
  created_at timestamptz not null default now()
);

alter table perfiles enable row level security;

drop policy if exists perfiles_read  on perfiles;
create policy perfiles_read  on perfiles
  for select using (auth.uid() is not null);

drop policy if exists perfiles_write on perfiles;
create policy perfiles_write on perfiles
  for update using (auth.uid() = id) with check (auth.uid() = id);

-- 2) Trigger: crea perfil automáticamente al registrar usuario ----
create or replace function public.handle_new_user()
returns trigger language plpgsql security definer as $$
begin
  insert into public.perfiles (id, nombre, rol)
  values (
    new.id,
    new.raw_user_meta_data->>'nombre',
    coalesce(new.raw_user_meta_data->>'rol', 'asesor')
  );
  return new;
end;
$$;

drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure public.handle_new_user();

-- 3) Endurecer RLS — todas las tablas requieren sesión activa ------

-- inscripciones
drop policy if exists inscripciones_all on inscripciones;
create policy inscripciones_all on inscripciones
  for all using (auth.uid() is not null) with check (auth.uid() is not null);

-- grupos
drop policy if exists grupos_all on grupos;
create policy grupos_all on grupos
  for all using (auth.uid() is not null) with check (auth.uid() is not null);

-- cargos
drop policy if exists cargos_all on cargos;
create policy cargos_all on cargos
  for all using (auth.uid() is not null) with check (auth.uid() is not null);

-- pagos
drop policy if exists pagos_all on pagos;
create policy pagos_all on pagos
  for all using (auth.uid() is not null) with check (auth.uid() is not null);

-- 4) Insertar perfiles para usuarios que ya existen (si los hay) ---
insert into perfiles (id, rol, nombre)
select id, 'admin', email
from auth.users
where id not in (select id from perfiles);
