-- ============================================================
-- ECCA — Crear tablas para módulo de Horarios
-- Ejecutar UNA VEZ en Supabase SQL Editor
-- ============================================================

-- 1. Maestros
CREATE TABLE IF NOT EXISTS maestros (
  id          BIGSERIAL PRIMARY KEY,
  nombre      TEXT NOT NULL,
  correo      TEXT,
  telefono    TEXT,
  especialidad TEXT,
  activo      BOOLEAN DEFAULT true,
  created_at  TIMESTAMPTZ DEFAULT NOW()
);

-- 2. Materias
CREATE TABLE IF NOT EXISTS materias (
  id          BIGSERIAL PRIMARY KEY,
  nombre      TEXT NOT NULL,
  clave       TEXT,
  grado       TEXT,
  descripcion TEXT,
  created_at  TIMESTAMPTZ DEFAULT NOW()
);

-- 3. Horarios
CREATE TABLE IF NOT EXISTS horarios (
  id          BIGSERIAL PRIMARY KEY,
  maestro_id  BIGINT REFERENCES maestros(id) ON DELETE SET NULL,
  materia_id  BIGINT REFERENCES materias(id) ON DELETE SET NULL,
  grupo_id    BIGINT REFERENCES grupos(id)   ON DELETE SET NULL,
  dia         SMALLINT NOT NULL CHECK (dia BETWEEN 1 AND 6), -- 1=Lun … 6=Sáb
  hora_inicio TEXT NOT NULL, -- "07:00"
  hora_fin    TEXT NOT NULL, -- "09:00"
  aula        TEXT,
  created_at  TIMESTAMPTZ DEFAULT NOW()
);

-- 4. Habilitar RLS
ALTER TABLE maestros ENABLE ROW LEVEL SECURITY;
ALTER TABLE materias ENABLE ROW LEVEL SECURITY;
ALTER TABLE horarios ENABLE ROW LEVEL SECURITY;

-- 5. Políticas de acceso (anon + authenticated)
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE tablename='maestros' AND policyname='ecca_maestros_all') THEN
    CREATE POLICY ecca_maestros_all ON maestros FOR ALL USING (true) WITH CHECK (true);
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE tablename='materias' AND policyname='ecca_materias_all') THEN
    CREATE POLICY ecca_materias_all ON materias FOR ALL USING (true) WITH CHECK (true);
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE tablename='horarios' AND policyname='ecca_horarios_all') THEN
    CREATE POLICY ecca_horarios_all ON horarios FOR ALL USING (true) WITH CHECK (true);
  END IF;
END$$;

-- Verificar
SELECT table_name FROM information_schema.tables
WHERE table_schema = 'public'
  AND table_name IN ('maestros','materias','horarios')
ORDER BY table_name;
