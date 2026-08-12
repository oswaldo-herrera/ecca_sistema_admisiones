-- ============================================================
--  ECCA — Columna exalumno (booleano) en inscripciones
--  Ejecutar UNA sola vez en Supabase SQL Editor
-- ============================================================

-- 1. Agregar columna booleana
ALTER TABLE inscripciones
  ADD COLUMN IF NOT EXISTS exalumno BOOLEAN NOT NULL DEFAULT FALSE;

-- 2. Eliminar columna etiqueta si ya la habías creado antes
ALTER TABLE inscripciones
  DROP COLUMN IF EXISTS etiqueta;
