-- ================================================
--  ECCA — Actualización: email en perfiles + permisos admin
--  Ejecutar en el SQL Editor de Supabase
-- ================================================

-- 1) Agregar columna email a perfiles ---------------
alter table perfiles add column if not exists email text;

-- 2) Actualizar trigger para capturar email ---------
create or replace function public.handle_new_user()
returns trigger language plpgsql security definer as $$
begin
  insert into public.perfiles (id, nombre, rol, email)
  values (
    new.id,
    new.raw_user_meta_data->>'nombre',
    coalesce(new.raw_user_meta_data->>'rol', 'asesor'),
    new.email
  )
  on conflict (id) do update set
    email  = excluded.email,
    nombre = coalesce(excluded.nombre, perfiles.nombre),
    rol    = coalesce(excluded.rol,    perfiles.rol);
  return new;
end;
$$;

-- 3) Permitir que cualquier usuario autenticado actualice perfiles
--    (necesario para que el admin cambie roles de otros usuarios)
drop policy if exists perfiles_write on perfiles;
create policy perfiles_write on perfiles
  for all using (auth.uid() is not null) with check (auth.uid() is not null);

-- 4) Campo activo para desactivar sin eliminar ------
alter table perfiles add column if not exists activo boolean not null default true;

-- 5) Sincronizar emails de usuarios existentes ------
update perfiles p
set email = u.email
from auth.users u
where p.id = u.id and (p.email is null or p.email = '');
