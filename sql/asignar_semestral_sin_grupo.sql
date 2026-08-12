-- ============================================================
--  ECCA — Asignar alumnos semestrales sin grupo
--  al grupo "Semestral · 2026-2027"
--  Idempotente: solo afecta a quienes tienen grupo_id NULL
-- ============================================================
DO $$
DECLARE
  v_grp BIGINT;
  v_cnt INTEGER;
BEGIN
  -- Buscar el grupo destino
  SELECT id INTO v_grp
    FROM grupos
   WHERE nombre = 'Semestral'
     AND ciclo  = '2026-2027'
   LIMIT 1;

  IF v_grp IS NULL THEN
    RAISE EXCEPTION 'No se encontró el grupo "Semestral · 2026-2027". Verifica el nombre exacto.';
  END IF;

  -- Asignar solo los que no tienen grupo Y son semestrales
  UPDATE inscripciones
     SET grupo_id = v_grp
   WHERE grupo_id IS NULL
     AND modalidad ILIKE '%semestral%'
     AND (exalumno IS NULL OR exalumno = FALSE);

  GET DIAGNOSTICS v_cnt = ROW_COUNT;
  RAISE NOTICE 'Grupo id: % — % alumnos asignados', v_grp, v_cnt;
END $$;
