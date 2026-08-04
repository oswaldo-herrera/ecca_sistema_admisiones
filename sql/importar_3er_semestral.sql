-- ============================================================
--  ECCA — Importar grupos semestrales 3° A y 3° B
--  Periodo: Enero-Julio 2026
--  Folios:  SEM3A-001…028  /  SEM3B-001…028
--  Idempotente: ejecutar varias veces no duplica datos
-- ============================================================
DO $$
DECLARE
  v_3a BIGINT;
  v_3b BIGINT;
BEGIN

  /* ── Grupo 3° A ──────────────────────────────────────────── */
  SELECT id INTO v_3a
    FROM grupos
   WHERE nombre = '3° A' AND ciclo = 'Enero-Julio 2026'
   LIMIT 1;
  IF v_3a IS NULL THEN
    INSERT INTO grupos (nombre, modalidad, ciclo)
    VALUES ('3° A', 'Semestral', 'Enero-Julio 2026')
    RETURNING id INTO v_3a;
  END IF;

  /* ── Grupo 3° B ──────────────────────────────────────────── */
  SELECT id INTO v_3b
    FROM grupos
   WHERE nombre = '3° B' AND ciclo = 'Enero-Julio 2026'
   LIMIT 1;
  IF v_3b IS NULL THEN
    INSERT INTO grupos (nombre, modalidad, ciclo)
    VALUES ('3° B', 'Semestral', 'Enero-Julio 2026')
    RETURNING id INTO v_3b;
  END IF;

  /* ── Alumnos 3° A — 28 alumnos ───────────────────────────── */
  INSERT INTO inscripciones (folio, nombre, grupo_id) VALUES
    ('SEM3A-001', 'Andrade González Armando Josué',         v_3a),
    ('SEM3A-002', 'Antimo Pérez Lía Vanessa',               v_3a),
    ('SEM3A-003', 'Benítez Estudillo Ricardo de Jesús',     v_3a),
    ('SEM3A-004', 'Cano Fuentes Zucel Ismerai',             v_3a),
    ('SEM3A-005', 'Castillo Galloso Dulce Adeliz',          v_3a),
    ('SEM3A-006', 'Castro Hernández Kendra Geraldine',      v_3a),
    ('SEM3A-007', 'Cerda Rivas Ángel de Jesús',             v_3a),
    ('SEM3A-008', 'Cordero Hernández Mia Nicole',           v_3a),
    ('SEM3A-009', 'Espinoza García Natalie Alexia',         v_3a),
    ('SEM3A-010', 'Franco López Juan José de Jesús',        v_3a),
    ('SEM3A-011', 'García Tapia Guillermo Alejandro',       v_3a),
    ('SEM3A-012', 'Gómez Muñoz Pedro de Jesús',             v_3a),
    ('SEM3A-013', 'Guerra Hernández Jairo Yael',            v_3a),
    ('SEM3A-014', 'Gutiérrez Bernal Karen Daniela',         v_3a),
    ('SEM3A-015', 'Hernández Flores Adrián Joshua',         v_3a),
    ('SEM3A-016', 'Hernández León Óscar Santiago',          v_3a),
    ('SEM3A-017', 'Horta Rodríguez Allison',                v_3a),
    ('SEM3A-018', 'Lerma García Fernanda Guadalupe',        v_3a),
    ('SEM3A-019', 'Ojeda de Anda Máximo Emiliano',          v_3a),
    ('SEM3A-020', 'Parra Cortés Guillermo Javier',          v_3a),
    ('SEM3A-021', 'Ramírez Ramírez César Enrique',          v_3a),
    ('SEM3A-022', 'Rangel Cervera Luis Fernando',           v_3a),
    ('SEM3A-023', 'Roque Reyes Francisco Gabriel',          v_3a),
    ('SEM3A-024', 'Sánchez Ríos Axel Alejandro',            v_3a),
    ('SEM3A-025', 'Segoviano Mata Leah Odette',             v_3a),
    ('SEM3A-026', 'Soto Ramírez José de Jesús',             v_3a),
    ('SEM3A-027', 'Urrutia Carranco Juan José',             v_3a),
    ('SEM3A-028', 'Velázquez Ortiz Jonathan',               v_3a)
  ON CONFLICT (folio) DO UPDATE SET grupo_id = EXCLUDED.grupo_id;

  /* ── Alumnos 3° B — 28 alumnos ───────────────────────────── */
  INSERT INTO inscripciones (folio, nombre, grupo_id) VALUES
    ('SEM3B-001', 'Aguilera Villegas Casten de Jesús',      v_3b),
    ('SEM3B-002', 'Antimo Pérez Santiago Mauricio',         v_3b),
    ('SEM3B-003', 'Cárdenas Sandoval José Alejandro',       v_3b),
    ('SEM3B-004', 'Delgado Zúñiga Ronaldo Zaid',            v_3b),
    ('SEM3B-005', 'Durán Ramírez Jorge Have',               v_3b),
    ('SEM3B-006', 'García Placencia Karla Fernanda',        v_3b),
    ('SEM3B-007', 'González Ávila Daniel Jhovani',          v_3b),
    ('SEM3B-008', 'Guerrero Salinas Karol Noemí',           v_3b),
    ('SEM3B-009', 'Hernández Torres Renata',                v_3b),
    ('SEM3B-010', 'Juárez Córdova Aidee Marian Lizbeth',    v_3b),
    ('SEM3B-011', 'López Orozco Itzel Jacqueline',          v_3b),
    ('SEM3B-012', 'López Ramírez Jadde Jetzamany',          v_3b),
    ('SEM3B-013', 'Martínez Olmos José de Jesús',           v_3b),
    ('SEM3B-014', 'Martínez Ramírez Ricardo Fabricio',      v_3b),
    ('SEM3B-015', 'Morales Moreno Joseth Efraín',           v_3b),
    ('SEM3B-016', 'Moreno Moreno Perla Ximena',             v_3b),
    ('SEM3B-017', 'Navarro López Alexis Caleb',             v_3b),
    ('SEM3B-018', 'Ornelas García Ángel Kaled',             v_3b),
    ('SEM3B-019', 'Pérez Manríquez Paul Alexander',         v_3b),
    ('SEM3B-020', 'Ramírez Aguirre Laura Glenda Miroslava', v_3b),
    ('SEM3B-021', 'Ramírez Vargas Lexie Isabela',           v_3b),
    ('SEM3B-022', 'Rocha Escobedo Rene',                    v_3b),
    ('SEM3B-023', 'Romero Calvo Héctor Abraham',            v_3b),
    ('SEM3B-024', 'Rosas Guzmán Cesar Andree',              v_3b),
    ('SEM3B-025', 'Serrano Mata Román Alejandro',           v_3b),
    ('SEM3B-026', 'Torres Ramírez Gustavo Yael',            v_3b),
    ('SEM3B-027', 'Valadez García Roberto Emmanuel',        v_3b),
    ('SEM3B-028', 'Valtierra Buso Cesar Axel',              v_3b)
  ON CONFLICT (folio) DO UPDATE SET grupo_id = EXCLUDED.grupo_id;

  RAISE NOTICE 'Grupo 3° A → id: %, 28 alumnos insertados', v_3a;
  RAISE NOTICE 'Grupo 3° B → id: %, 28 alumnos insertados', v_3b;
END $$;
