-- ================================================
--  ECCA — Módulo de Pagos (cargos + pagos con saldo)
--  Ejecutar una sola vez en el SQL Editor de Supabase
-- ================================================

-- 1) Montos configurables por grupo -------------------------------------
alter table grupos
  add column if not exists monto_inscripcion numeric,
  add column if not exists monto_colegiatura  numeric,
  add column if not exists num_colegiaturas   int;

-- 2) Cargos — lo que cada alumno debe ------------------------------------
create table if not exists cargos (
  id                bigserial primary key,
  folio             text not null references inscripciones(folio) on delete cascade,
  grupo_id          bigint references grupos(id) on delete set null,
  concepto          text not null,
  descripcion       text,
  monto             numeric not null,
  fecha_vencimiento date,
  created_at        timestamptz not null default now()
);
create index if not exists cargos_folio_idx on cargos(folio);

-- 3) Pagos — dinero recibido ----------------------------------------------
create table if not exists pagos (
  id              bigserial primary key,
  folio           text not null references inscripciones(folio) on delete cascade,
  cargo_id        bigint references cargos(id) on delete set null,
  concepto        text not null,
  monto           numeric not null,
  fecha_pago      date not null default current_date,
  forma_pago      text,
  recibio         text,
  comprobante_url text,
  metodo          text not null default 'manual',   -- manual | mercadopago | stripe | conekta (futuro)
  referencia      text,                              -- id de transacción externa (futuro)
  estado          text not null default 'confirmado',
  created_at      timestamptz not null default now()
);
create index if not exists pagos_folio_idx on pagos(folio);
create index if not exists pagos_cargo_idx on pagos(cargo_id);

-- 4) RLS — mismas políticas permisivas que ya usan inscripciones/grupos --
alter table cargos enable row level security;
alter table pagos  enable row level security;

drop policy if exists cargos_all on cargos;
create policy cargos_all on cargos for all using (true) with check (true);

drop policy if exists pagos_all on pagos;
create policy pagos_all on pagos for all using (true) with check (true);

-- 5) Storage — bucket público para comprobantes de pago ------------------
insert into storage.buckets (id, name, public)
values ('comprobantes', 'comprobantes', true)
on conflict (id) do nothing;

drop policy if exists "comprobantes_public_read" on storage.objects;
create policy "comprobantes_public_read" on storage.objects
  for select using (bucket_id = 'comprobantes');

drop policy if exists "comprobantes_public_write" on storage.objects;
create policy "comprobantes_public_write" on storage.objects
  for insert with check (bucket_id = 'comprobantes');

drop policy if exists "comprobantes_public_update" on storage.objects;
create policy "comprobantes_public_update" on storage.objects
  for update using (bucket_id = 'comprobantes');

-- 6) Migrar el único pago existente (inscripciones.concepto/monto/...) ---
insert into pagos (folio, concepto, monto, fecha_pago, forma_pago, recibio, metodo, estado)
select folio, concepto, monto, fecha_pago, fpago, recibio, 'manual', 'confirmado'
from inscripciones
where monto is not null
  and folio not in (select folio from pagos);
