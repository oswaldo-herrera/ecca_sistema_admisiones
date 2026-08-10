-- ============================================================
--  ECCA — Agregar columna "referido_por" a inscripciones
--  Campo opcional para registrar quién refirió al alumno
--  (para seguimiento de comisiones)
-- ============================================================
ALTER TABLE inscripciones
  ADD COLUMN IF NOT EXISTS referido_por TEXT DEFAULT NULL;
