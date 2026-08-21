-- ============================================================
--  ECCA — Renombrar Fútbol → Fútbol Varonil y crear Fútbol Femenil
-- ============================================================

-- 1. Renombrar el grupo existente
UPDATE grupos
SET nombre = 'Fútbol Varonil'
WHERE nombre = 'Fútbol' AND tipo = 'deporte';

-- 2. Crear el grupo Fútbol Femenil
INSERT INTO grupos (nombre, tipo, deporte)
VALUES ('Fútbol Femenil', 'deporte', 'Fútbol')
ON CONFLICT DO NOTHING;

-- Verificar:
SELECT id, nombre, tipo, deporte FROM grupos WHERE deporte = 'Fútbol' ORDER BY nombre;
