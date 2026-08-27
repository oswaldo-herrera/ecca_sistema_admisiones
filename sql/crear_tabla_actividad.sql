-- ============================================================
-- ECCA — Tabla de Bitacora / Actividad del sistema
-- Ejecutar UNA VEZ en Supabase SQL Editor
-- ============================================================

CREATE TABLE IF NOT EXISTS actividad (
  id          BIGSERIAL PRIMARY KEY,
  user_id     UUID REFERENCES auth.users(id) ON DELETE SET NULL,
  user_nombre TEXT,
  accion      TEXT NOT NULL,
  modulo      TEXT NOT NULL,
  referencia  TEXT,
  detalle     TEXT,
  created_at  TIMESTAMPTZ DEFAULT NOW()
);

-- Indice para consultas por fecha
CREATE INDEX IF NOT EXISTS idx_actividad_created ON actividad (created_at DESC);
CREATE INDEX IF NOT EXISTS idx_actividad_user   ON actividad (user_id);

-- RLS
ALTER TABLE actividad ENABLE ROW LEVEL SECURITY;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies WHERE tablename='actividad' AND policyname='ecca_actividad_all'
  ) THEN
    CREATE POLICY ecca_actividad_all ON actividad FOR ALL USING (true) WITH CHECK (true);
  END IF;
END$$;

-- Verificar
SELECT 'Tabla actividad creada OK' AS resultado;
