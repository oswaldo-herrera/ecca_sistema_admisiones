-- ============================================================
--  ECCA — Agregar columna "etiqueta" a inscripciones
--  Valores posibles: NULL (activo), 'exalumno'
-- ============================================================
ALTER TABLE inscripciones
  ADD COLUMN IF NOT EXISTS etiqueta TEXT DEFAULT NULL;
