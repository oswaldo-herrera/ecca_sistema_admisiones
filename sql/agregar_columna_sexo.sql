-- ============================================================
--  ECCA — Agregar columna sexo a inscripciones
--  Valores: 'H' (Hombre) o 'M' (Mujer) o NULL (no especificado)
--  Ejecutar UNA sola vez
-- ============================================================
ALTER TABLE inscripciones
  ADD COLUMN IF NOT EXISTS sexo TEXT DEFAULT NULL;

-- Verificar:
SELECT sexo, COUNT(*) AS total FROM inscripciones GROUP BY sexo ORDER BY sexo;
