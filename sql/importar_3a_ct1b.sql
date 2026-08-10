-- ============================================================
--  ECCA — Importar grupo 3A CT1 (3° Cuatrimestre T1, sección B)
--  Modalidad: Cuatrimestral · Mayo-Agosto 2026
--  21 alumnos  ·  Folios: 3CT1-001…021
--  Idempotente: ejecutar varias veces no duplica datos
-- ============================================================
DO $$
DECLARE
  v_grp BIGINT;
BEGIN

  /* ── Grupo ─────────────────────────────────────────────────── */
  SELECT id INTO v_grp
    FROM grupos
   WHERE nombre = '3A CT1' AND ciclo = 'Mayo-Agosto 2026'
   LIMIT 1;
  IF v_grp IS NULL THEN
    INSERT INTO grupos (nombre, modalidad, ciclo)
    VALUES ('3A CT1', 'Cuatrimestral', 'Mayo-Agosto 2026')
    RETURNING id INTO v_grp;
  END IF;

  /* ── Alumnos — 21 ──────────────────────────────────────────── */
  INSERT INTO inscripciones (folio, nombre, grupo_id) VALUES
    ('3CT1-001', 'Alvarado Juárez América Solange',       v_grp),
    ('3CT1-002', 'Aranda Castro Diego Elías',             v_grp),
    ('3CT1-003', 'Castro Echeveste Josué Abraham',        v_grp),
    ('3CT1-004', 'Chagolla Morales Jorge Daniel',         v_grp),
    ('3CT1-005', 'Contreras Álvarez Octavio Darío',       v_grp),
    ('3CT1-006', 'Contreras Flores Penélope Mariacruz',   v_grp),
    ('3CT1-007', 'García Gutiérrez Miguel Ángel',         v_grp),
    ('3CT1-008', 'Guevara Muñoz Diego Abraham',           v_grp),
    ('3CT1-009', 'Hernández Carrillo Carlos Manuel',      v_grp),
    ('3CT1-010', 'Hernández Olmedo Edgar Macdial',        v_grp),
    ('3CT1-011', 'Jasso Martínez Jessica Guadalupe',      v_grp),
    ('3CT1-012', 'Juárez Licea Carolina',                 v_grp),
    ('3CT1-013', 'Juárez Ruiz Luis Ángel',                v_grp),
    ('3CT1-014', 'López Zavala Ulises',                   v_grp),
    ('3CT1-015', 'Medina Martínez Allison Alejandra',     v_grp),
    ('3CT1-016', 'Negrete López Juan Leonell',            v_grp),
    ('3CT1-017', 'Ornelas Valdivia Alexis Ronaldo',       v_grp),
    ('3CT1-018', 'Rocha García José Elías',               v_grp),
    ('3CT1-019', 'Rocha García Karol Josué',              v_grp),
    ('3CT1-020', 'Sarmiento Lerma Yaritsi Ariday',        v_grp),
    ('3CT1-021', 'Tavera Galván Ismael',                  v_grp)
  ON CONFLICT (folio) DO UPDATE SET grupo_id = EXCLUDED.grupo_id;

  RAISE NOTICE 'Grupo 3A CT1 → id: %, 21 alumnos insertados', v_grp;
END $$;
