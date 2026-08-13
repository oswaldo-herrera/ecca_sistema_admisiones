-- ============================================================
--  ECCA — Módulo de Grupos Deportivos
--  Ejecutar UNA sola vez
-- ============================================================

-- 1. Agregar columnas a grupos
ALTER TABLE grupos
  ADD COLUMN IF NOT EXISTS tipo    TEXT DEFAULT 'academico',
  ADD COLUMN IF NOT EXISTS deporte TEXT DEFAULT NULL;

-- 2. Marcar grupos existentes como académicos
UPDATE grupos SET tipo = 'academico' WHERE tipo IS NULL;

-- 3. Columna en inscripciones para grupo deportivo (independiente de grupo_id)
ALTER TABLE inscripciones
  ADD COLUMN IF NOT EXISTS grupo_deporte_id BIGINT REFERENCES grupos(id) ON DELETE SET NULL;

-- 4. Crear los 10 grupos deportivos base
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM grupos WHERE tipo = 'deporte' LIMIT 1) THEN
    INSERT INTO grupos (nombre, tipo, deporte) VALUES
      ('Fútbol',     'deporte', 'Fútbol'),
      ('Voleibol',   'deporte', 'Voleibol'),
      ('Basquetbol', 'deporte', 'Basquetbol'),
      ('Tocho',      'deporte', 'Tocho'),
      ('Porra',      'deporte', 'Porra'),
      ('Baile',      'deporte', 'Baile'),
      ('Box',        'deporte', 'Box'),
      ('Natación',   'deporte', 'Natación'),
      ('Guitarra',   'deporte', 'Guitarra'),
      ('Ajedrez',    'deporte', 'Ajedrez');
    RAISE NOTICE '10 grupos deportivos creados correctamente.';
  ELSE
    RAISE NOTICE 'Los grupos deportivos ya existen, no se duplicaron.';
  END IF;
END $$;

-- Verificar:
SELECT id, nombre, tipo, deporte FROM grupos WHERE tipo = 'deporte' ORDER BY nombre;
