-- =============================================
--  TABLA: calificaciones
--  Ejecutar en Supabase SQL Editor
-- =============================================

CREATE TABLE IF NOT EXISTS calificaciones (
  id            BIGSERIAL PRIMARY KEY,
  folio         TEXT        NOT NULL REFERENCES inscripciones(folio) ON DELETE CASCADE,
  grupo_id      INT         REFERENCES grupos(id)   ON DELETE SET NULL,
  materia_id    INT         REFERENCES materias(id)  ON DELETE SET NULL,
  maestro_id    INT         REFERENCES maestros(id)  ON DELETE SET NULL,
  periodo       TEXT        NOT NULL,
  calificacion  NUMERIC(5,2) CHECK (calificacion IS NULL OR (calificacion >= 0 AND calificacion <= 10)),
  observaciones TEXT,
  created_at    TIMESTAMPTZ DEFAULT NOW(),
  updated_at    TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE (folio, materia_id, periodo)
);

CREATE INDEX IF NOT EXISTS idx_calif_folio    ON calificaciones (folio);
CREATE INDEX IF NOT EXISTS idx_calif_grupo    ON calificaciones (grupo_id);
CREATE INDEX IF NOT EXISTS idx_calif_materia  ON calificaciones (materia_id);
CREATE INDEX IF NOT EXISTS idx_calif_periodo  ON calificaciones (periodo);

ALTER TABLE calificaciones ENABLE ROW LEVEL SECURITY;

CREATE POLICY ecca_calificaciones_all ON calificaciones
  FOR ALL USING (true) WITH CHECK (true);

-- Verificar
SELECT COUNT(*) AS total FROM calificaciones;
