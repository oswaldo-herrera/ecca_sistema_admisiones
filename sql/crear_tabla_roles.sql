-- =============================================
--  TABLA: roles_personalizados + migración perfiles
--  Ejecutar en Supabase SQL Editor
-- =============================================

CREATE TABLE IF NOT EXISTS roles_personalizados (
  id         BIGSERIAL PRIMARY KEY,
  nombre     TEXT NOT NULL,
  color      TEXT DEFAULT '#1e3a5f',
  permisos   JSONB NOT NULL DEFAULT '[]'::jsonb,
  es_admin   BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Agregar columna rol_id a perfiles (si no existe)
ALTER TABLE perfiles ADD COLUMN IF NOT EXISTS rol_id INT REFERENCES roles_personalizados(id) ON DELETE SET NULL;

-- RLS
ALTER TABLE roles_personalizados ENABLE ROW LEVEL SECURITY;
CREATE POLICY ecca_roles_all ON roles_personalizados FOR ALL USING (true) WITH CHECK (true);

-- =============================================
--  Roles predeterminados (instalación nueva)
--  Permisos de acción incluidos:
--    grupos-gestionar / grupos-editar / grupos-eliminar
--    deportes-gestionar / deportes-editar / deportes-eliminar
-- =============================================
INSERT INTO roles_personalizados (nombre, color, es_admin, permisos) VALUES
('Administrador',   '#dc2626', true,
  '["inicio","nueva-inscripcion","base-datos","grupos","deportes","horarios","calificaciones","documentos","pagos","recibo","credencial","bitacora","usuarios","grupos-gestionar","grupos-editar","grupos-eliminar","deportes-gestionar","deportes-editar","deportes-eliminar"]'::jsonb),
('Director',        '#1e40af', false,
  '["inicio","nueva-inscripcion","base-datos","grupos","deportes","horarios","calificaciones","documentos","pagos","recibo","credencial","grupos-gestionar","deportes-gestionar"]'::jsonb),
('Control Escolar', '#0f766e', false,
  '["inicio","base-datos","grupos","documentos","calificaciones","credencial","grupos-gestionar","grupos-editar","grupos-eliminar","deportes-gestionar","deportes-editar","deportes-eliminar"]'::jsonb),
('Asesor',          '#d97706', false,
  '["inicio","nueva-inscripcion","base-datos","documentos","pagos","recibo","credencial"]'::jsonb),
('Profesor',        '#7c3aed', false,
  '["inicio","calificaciones","horarios"]'::jsonb)
ON CONFLICT DO NOTHING;

-- =============================================
--  Si la tabla YA EXISTE con los roles base,
--  ejecuta estas líneas para agregar los nuevos
--  permisos de acción a los roles existentes.
-- =============================================

-- Administrador: todos los permisos de acción
UPDATE roles_personalizados SET permisos = permisos
  || '["grupos-gestionar","grupos-editar","grupos-eliminar","deportes-gestionar","deportes-editar","deportes-eliminar"]'::jsonb
WHERE nombre = 'Administrador'
  AND NOT (permisos ? 'grupos-gestionar');

-- Director: solo gestionar (sin editar/eliminar)
UPDATE roles_personalizados SET permisos = permisos
  || '["grupos-gestionar","deportes-gestionar"]'::jsonb
WHERE nombre = 'Director'
  AND NOT (permisos ? 'grupos-gestionar');

-- Control Escolar: gestionar, editar y eliminar en ambos módulos
UPDATE roles_personalizados SET permisos = permisos
  || '["grupos-gestionar","grupos-editar","grupos-eliminar","deportes-gestionar","deportes-editar","deportes-eliminar"]'::jsonb
WHERE nombre = 'Control Escolar'
  AND NOT (permisos ? 'grupos-gestionar');

-- Verificar
SELECT id, nombre, es_admin, jsonb_array_length(permisos) AS num_permisos,
       permisos FROM roles_personalizados ORDER BY id;
