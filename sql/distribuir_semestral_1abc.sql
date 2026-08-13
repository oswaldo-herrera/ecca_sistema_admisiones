-- ============================================================
--  ECCA — Distribuir 77 alumnos del grupo "Semestral 2026-2027"
--  en partes iguales a 1A SEM, 1B SEM y 1C SEM
--  Resultado esperado: 26 · 26 · 25
--  Orden: alfabético por nombre (round-robin)
-- ============================================================
DO $$
DECLARE
  v_src BIGINT;
  v_1a  BIGINT;
  v_1b  BIGINT;
  v_1c  BIGINT;
BEGIN
  SELECT id INTO v_src FROM grupos WHERE nombre = 'Semestral'  AND ciclo = '2026-2027' LIMIT 1;
  SELECT id INTO v_1a  FROM grupos WHERE nombre = '1A SEM'     AND ciclo = '2026-2027' LIMIT 1;
  SELECT id INTO v_1b  FROM grupos WHERE nombre = '1B SEM'     AND ciclo = '2026-2027' LIMIT 1;
  SELECT id INTO v_1c  FROM grupos WHERE nombre = '1C SEM'     AND ciclo = '2026-2027' LIMIT 1;

  IF v_src IS NULL THEN RAISE EXCEPTION 'No se encontró el grupo "Semestral · 2026-2027"'; END IF;
  IF v_1a  IS NULL THEN RAISE EXCEPTION 'No se encontró el grupo "1A SEM · 2026-2027"';   END IF;
  IF v_1b  IS NULL THEN RAISE EXCEPTION 'No se encontró el grupo "1B SEM · 2026-2027"';   END IF;
  IF v_1c  IS NULL THEN RAISE EXCEPTION 'No se encontró el grupo "1C SEM · 2026-2027"';   END IF;

  -- Distribuir round-robin ordenado alfabéticamente
  -- rn % 3 = 0 → 1A SEM (26), 1 → 1B SEM (26), 2 → 1C SEM (25)
  UPDATE inscripciones
     SET grupo_id = CASE
           WHEN (sub.rn % 3) = 0 THEN v_1a
           WHEN (sub.rn % 3) = 1 THEN v_1b
           ELSE                       v_1c
         END
    FROM (
      SELECT folio,
             (ROW_NUMBER() OVER (ORDER BY nombre) - 1) AS rn
        FROM inscripciones
       WHERE grupo_id = v_src
    ) sub
   WHERE inscripciones.folio = sub.folio;

  RAISE NOTICE '77 alumnos distribuidos → 1A SEM: 26, 1B SEM: 26, 1C SEM: 25';
  RAISE NOTICE 'Grupo origen (id=%) queda con 0 alumnos.', v_src;
END $$;

-- Verificar resultado:
SELECT g.nombre, COUNT(i.folio) AS alumnos
  FROM grupos g
  LEFT JOIN inscripciones i ON i.grupo_id = g.id
 WHERE g.nombre IN ('Semestral','1A SEM','1B SEM','1C SEM')
   AND g.ciclo = '2026-2027'
 GROUP BY g.nombre
 ORDER BY g.nombre;
