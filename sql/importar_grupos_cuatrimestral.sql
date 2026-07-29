-- ================================================
--  ECCA — Importar grupos cuatrimastrales 2026
--  6 grupos: 6A SAB, 6A CT1, 5A CT1,
--            3A SAB, 3A CT1, 3A CT2
--  Ejecutar en el SQL Editor de Supabase
-- ================================================

DO $$
DECLARE
  v_6asab bigint;
  v_6act1 bigint;
  v_5act1 bigint;
  v_3asab bigint;
  v_3act1 bigint;
  v_3act2 bigint;
BEGIN

  -- ── Crear grupos si no existen ──────────────────────────────────

  SELECT id INTO v_6asab FROM grupos WHERE nombre = '6A SAB' LIMIT 1;
  IF v_6asab IS NULL THEN
    INSERT INTO grupos (nombre, modalidad, ciclo)
    VALUES ('6A SAB', 'Cuatrimestral', 'Enero-Abril 2026')
    RETURNING id INTO v_6asab;
    RAISE NOTICE 'Grupo 6A SAB creado (id=%)', v_6asab;
  END IF;

  SELECT id INTO v_6act1 FROM grupos WHERE nombre = '6A CT1' LIMIT 1;
  IF v_6act1 IS NULL THEN
    INSERT INTO grupos (nombre, modalidad, ciclo)
    VALUES ('6A CT1', 'Cuatrimestral', 'Mayo-Agosto 2026')
    RETURNING id INTO v_6act1;
    RAISE NOTICE 'Grupo 6A CT1 creado (id=%)', v_6act1;
  END IF;

  SELECT id INTO v_5act1 FROM grupos WHERE nombre = '5A CT1' LIMIT 1;
  IF v_5act1 IS NULL THEN
    INSERT INTO grupos (nombre, modalidad, ciclo)
    VALUES ('5A CT1', 'Cuatrimestral', 'Mayo-Agosto 2026')
    RETURNING id INTO v_5act1;
    RAISE NOTICE 'Grupo 5A CT1 creado (id=%)', v_5act1;
  END IF;

  SELECT id INTO v_3asab FROM grupos WHERE nombre = '3A SAB' LIMIT 1;
  IF v_3asab IS NULL THEN
    INSERT INTO grupos (nombre, modalidad, ciclo)
    VALUES ('3A SAB', 'Cuatrimestral', 'Mayo-Agosto 2026')
    RETURNING id INTO v_3asab;
    RAISE NOTICE 'Grupo 3A SAB creado (id=%)', v_3asab;
  END IF;

  SELECT id INTO v_3act1 FROM grupos WHERE nombre = '3A CT1' LIMIT 1;
  IF v_3act1 IS NULL THEN
    INSERT INTO grupos (nombre, modalidad, ciclo)
    VALUES ('3A CT1', 'Cuatrimestral', 'Mayo-Agosto 2026')
    RETURNING id INTO v_3act1;
    RAISE NOTICE 'Grupo 3A CT1 creado (id=%)', v_3act1;
  END IF;

  SELECT id INTO v_3act2 FROM grupos WHERE nombre = '3A CT2' LIMIT 1;
  IF v_3act2 IS NULL THEN
    INSERT INTO grupos (nombre, modalidad, ciclo)
    VALUES ('3A CT2', 'Cuatrimestral', 'Mayo-Agosto 2026')
    RETURNING id INTO v_3act2;
    RAISE NOTICE 'Grupo 3A CT2 creado (id=%)', v_3act2;
  END IF;

  -- ══════════════════════════════════════════════════════════════════
  -- 6A SAB — Sabatino — Enero-Abril 2026 — 21 alumnos
  -- (falta el No. 3 en la lista original)
  -- ══════════════════════════════════════════════════════════════════
  INSERT INTO inscripciones (folio, nombre, modalidad, grupo_id) VALUES
    ('6ASAB-001', 'Becerra Acevedo Estefany Berenice',       'Cuatrimestral', v_6asab),
    ('6ASAB-002', 'Cervantes Ibarra Alejandro',               'Cuatrimestral', v_6asab),
    ('6ASAB-004', 'Delgado Mendez Rafael',                    'Cuatrimestral', v_6asab),
    ('6ASAB-005', 'Estrada Vallejo Valeria Estefania',        'Cuatrimestral', v_6asab),
    ('6ASAB-006', 'Flores Hernandez Angel Adan',              'Cuatrimestral', v_6asab),
    ('6ASAB-007', 'Guevara Castro Ivan Osvaldo',              'Cuatrimestral', v_6asab),
    ('6ASAB-008', 'Hernandez Ortiz Andryk Emiliano',          'Cuatrimestral', v_6asab),
    ('6ASAB-009', 'Martinez Rodriguez Oswaldo Emmanuel',      'Cuatrimestral', v_6asab),
    ('6ASAB-010', 'Medina Gutierrez Maria Lidia',             'Cuatrimestral', v_6asab),
    ('6ASAB-011', 'Mendez Licea Miguel Angel',                'Cuatrimestral', v_6asab),
    ('6ASAB-012', 'Murguia Garcia Samantha Paola',            'Cuatrimestral', v_6asab),
    ('6ASAB-013', 'Nachez Mendoza Daniela Guadalupe',         'Cuatrimestral', v_6asab),
    ('6ASAB-014', 'Ornelas Sanchez Omar Eduardo',             'Cuatrimestral', v_6asab),
    ('6ASAB-015', 'Paredes Torres Angel Gabriel',             'Cuatrimestral', v_6asab),
    ('6ASAB-016', 'Ponce Noriega Valeria Del Carmen',         'Cuatrimestral', v_6asab),
    ('6ASAB-017', 'Reyes Zavala Andrea',                      'Cuatrimestral', v_6asab),
    ('6ASAB-018', 'Rivera Cano Luis Angel',                   'Cuatrimestral', v_6asab),
    ('6ASAB-019', 'Rodriguez Neri Victoria Soledad',          'Cuatrimestral', v_6asab),
    ('6ASAB-020', 'Rojas Cortes Sabine Jaqueline',            'Cuatrimestral', v_6asab),
    ('6ASAB-021', 'Torres Rodriguez Angel Rafael De Jesus',   'Cuatrimestral', v_6asab),
    ('6ASAB-022', 'Vera Jaramillo Kimberly Ximena',           'Cuatrimestral', v_6asab)
  ON CONFLICT (folio) DO UPDATE SET grupo_id = EXCLUDED.grupo_id;

  -- ══════════════════════════════════════════════════════════════════
  -- 6A CT1 — Turno 1 — Mayo-Agosto 2026 — 31 alumnos
  -- (falta el No. 26 en la lista original)
  -- ══════════════════════════════════════════════════════════════════
  INSERT INTO inscripciones (folio, nombre, modalidad, grupo_id) VALUES
    ('6ACT1-001', 'Anaya Pacheco Santiago Gael',                  'Cuatrimestral', v_6act1),
    ('6ACT1-002', 'Castillo Lira Tizoc',                          'Cuatrimestral', v_6act1),
    ('6ACT1-003', 'Chavez Ramirez Pamela Nicol',                  'Cuatrimestral', v_6act1),
    ('6ACT1-004', 'Espinoza Crespo Oscar Eduardo',                'Cuatrimestral', v_6act1),
    ('6ACT1-005', 'Espinoza Gutierrez Marcos Vladimir',           'Cuatrimestral', v_6act1),
    ('6ACT1-006', 'Estrada Perez Cristopher Erick',               'Cuatrimestral', v_6act1),
    ('6ACT1-007', 'Gomez Ornelas Yannis Camila',                  'Cuatrimestral', v_6act1),
    ('6ACT1-008', 'Gonzalez Flores Dorian Emilio',                'Cuatrimestral', v_6act1),
    ('6ACT1-009', 'Govea Guerrero Yoseline',                      'Cuatrimestral', v_6act1),
    ('6ACT1-010', 'Herrera Lopez Alexa Pamela',                   'Cuatrimestral', v_6act1),
    ('6ACT1-011', 'Jimenez Hernandez Edwin Jaret',                'Cuatrimestral', v_6act1),
    ('6ACT1-012', 'Lira Gonzalez Daylen Romina',                  'Cuatrimestral', v_6act1),
    ('6ACT1-013', 'Lira Zapien Maya Quetzalli',                   'Cuatrimestral', v_6act1),
    ('6ACT1-014', 'Lopez Vallejo Selene Marisol',                 'Cuatrimestral', v_6act1),
    ('6ACT1-015', 'Lozano Maldonado Leilani Jaqueline Guadalupe', 'Cuatrimestral', v_6act1),
    ('6ACT1-016', 'Martinez Gonzalez Bryan Jesus Antonio',        'Cuatrimestral', v_6act1),
    ('6ACT1-017', 'Martinez Tetuan Erick Emmanuel',               'Cuatrimestral', v_6act1),
    ('6ACT1-018', 'Martinez Vazquez Carolina Luisa Fernanda',     'Cuatrimestral', v_6act1),
    ('6ACT1-019', 'Montemayor Placencia Daniela Guadalupe',       'Cuatrimestral', v_6act1),
    ('6ACT1-020', 'Munoz Soto Luis',                              'Cuatrimestral', v_6act1),
    ('6ACT1-021', 'Murillo Ruiz Erick Fernando',                  'Cuatrimestral', v_6act1),
    ('6ACT1-022', 'Nuñez Hernandez Cristopher Enrique',           'Cuatrimestral', v_6act1),
    ('6ACT1-023', 'Orozco Varela Baruc Emmanuel',                 'Cuatrimestral', v_6act1),
    ('6ACT1-024', 'Palacios Cabrera Danna Fernanda',              'Cuatrimestral', v_6act1),
    ('6ACT1-025', 'Palacios Cedeño Jonathan Misael',              'Cuatrimestral', v_6act1),
    ('6ACT1-027', 'Perez Valadez Pablo Adrian',                   'Cuatrimestral', v_6act1),
    ('6ACT1-028', 'Rangel Luna Jaciel Orlando',                   'Cuatrimestral', v_6act1),
    ('6ACT1-029', 'Salas Garcia Dana Marlene',                    'Cuatrimestral', v_6act1),
    ('6ACT1-030', 'Servin Rodriguez Yair Emmanuel',               'Cuatrimestral', v_6act1),
    ('6ACT1-031', 'Valadez Mota Maximo Alejandro',                'Cuatrimestral', v_6act1),
    ('6ACT1-032', 'Varela Gutierrez Juan Emiliano',               'Cuatrimestral', v_6act1)
  ON CONFLICT (folio) DO UPDATE SET grupo_id = EXCLUDED.grupo_id;

  -- ══════════════════════════════════════════════════════════════════
  -- 5A CT1 — Turno 1 — Mayo-Agosto 2026 — 17 alumnos
  -- ══════════════════════════════════════════════════════════════════
  INSERT INTO inscripciones (folio, nombre, modalidad, grupo_id) VALUES
    ('5ACT1-001', 'Alcaraz Torres Axel Alejandro',         'Cuatrimestral', v_5act1),
    ('5ACT1-002', 'Alvarado Juarez America Solange',       'Cuatrimestral', v_5act1),
    ('5ACT1-003', 'Aranda Castro Diego Elias',             'Cuatrimestral', v_5act1),
    ('5ACT1-004', 'Barrios Castro Jose Fabian',            'Cuatrimestral', v_5act1),
    ('5ACT1-005', 'Chagolla Morales Jorge Daniel',         'Cuatrimestral', v_5act1),
    ('5ACT1-006', 'Cleto Guerrero Dulce Scarlett',         'Cuatrimestral', v_5act1),
    ('5ACT1-007', 'Contreras Flores Penelope Mariacruz',   'Cuatrimestral', v_5act1),
    ('5ACT1-008', 'Gaona Ornelas Arlett Valeria',          'Cuatrimestral', v_5act1),
    ('5ACT1-009', 'Garcia Gutierrez Miguel Angel',         'Cuatrimestral', v_5act1),
    ('5ACT1-010', 'Hernandez Carrillo Carlos Manuel',      'Cuatrimestral', v_5act1),
    ('5ACT1-011', 'Juarez Ruiz Luis Angel',                'Cuatrimestral', v_5act1),
    ('5ACT1-012', 'Medina Martinez Allison Alejandra',     'Cuatrimestral', v_5act1),
    ('5ACT1-013', 'Negrete Lopez Juan Leonell',            'Cuatrimestral', v_5act1),
    ('5ACT1-014', 'Ramirez Rendon Dulce Estefania',        'Cuatrimestral', v_5act1),
    ('5ACT1-015', 'Sarmiento Lerma Yaritsi Ariday',        'Cuatrimestral', v_5act1),
    ('5ACT1-016', 'Tavera Galvan Ismael',                  'Cuatrimestral', v_5act1),
    ('5ACT1-017', 'Vazquez Guevara Javier Alexander',      'Cuatrimestral', v_5act1)
  ON CONFLICT (folio) DO UPDATE SET grupo_id = EXCLUDED.grupo_id;

  -- ══════════════════════════════════════════════════════════════════
  -- 3A SAB — Sabatino — Mayo-Agosto 2026 — 23 alumnos
  -- ══════════════════════════════════════════════════════════════════
  INSERT INTO inscripciones (folio, nombre, modalidad, grupo_id) VALUES
    ('3ASAB-001', 'Almeida Lopez Alan Michel',              'Cuatrimestral', v_3asab),
    ('3ASAB-002', 'Barrios Anguiano Ana Graciela',          'Cuatrimestral', v_3asab),
    ('3ASAB-003', 'Cedeño Valdez Christian Uziel',          'Cuatrimestral', v_3asab),
    ('3ASAB-004', 'Chavez Navarro Marcela Estefany',        'Cuatrimestral', v_3asab),
    ('3ASAB-005', 'De Luna Macias Juan Carlos',             'Cuatrimestral', v_3asab),
    ('3ASAB-006', 'Gonzalez Maciel Jose Emiliano',          'Cuatrimestral', v_3asab),
    ('3ASAB-007', 'Gutierrez Sandoval Maximiliano',         'Cuatrimestral', v_3asab),
    ('3ASAB-008', 'Hernandez Lozornio Axel Jasiel',         'Cuatrimestral', v_3asab),
    ('3ASAB-009', 'Loza Barron Luis Angel Roberto',         'Cuatrimestral', v_3asab),
    ('3ASAB-010', 'Luna Dominguez Santiago Gabriel',        'Cuatrimestral', v_3asab),
    ('3ASAB-011', 'Marquez Maya Karla Estefania',           'Cuatrimestral', v_3asab),
    ('3ASAB-012', 'Mendoza Rodriguez Brandon Isaac',        'Cuatrimestral', v_3asab),
    ('3ASAB-013', 'Mireles Duron Christofer',               'Cuatrimestral', v_3asab),
    ('3ASAB-014', 'Moreno Barron Norma Fabiola',            'Cuatrimestral', v_3asab),
    ('3ASAB-015', 'Moreno Hernandez Veronica Monserrat',    'Cuatrimestral', v_3asab),
    ('3ASAB-016', 'Ontiveros Marquez Emilio',               'Cuatrimestral', v_3asab),
    ('3ASAB-017', 'Ontiveros Marquez Patricio',             'Cuatrimestral', v_3asab),
    ('3ASAB-018', 'Perez Chavez Laura Paulina',             'Cuatrimestral', v_3asab),
    ('3ASAB-019', 'Reyes Gutierrez Helver Moises',          'Cuatrimestral', v_3asab),
    ('3ASAB-020', 'Sanchez Romo Angel Samuel',              'Cuatrimestral', v_3asab),
    ('3ASAB-021', 'Servin Huerta Edgar Geovvani',           'Cuatrimestral', v_3asab),
    ('3ASAB-022', 'Valencia Ramirez Valeria Gabriela',      'Cuatrimestral', v_3asab),
    ('3ASAB-023', 'Vallejo Navarro Juan Manuel',            'Cuatrimestral', v_3asab)
  ON CONFLICT (folio) DO UPDATE SET grupo_id = EXCLUDED.grupo_id;

  -- ══════════════════════════════════════════════════════════════════
  -- 3A CT1 — Turno 1 — Mayo-Agosto 2026 — 33 alumnos
  -- (faltan los Nos. 13, 16, 19, 24, 31, 35 en la lista original)
  -- ══════════════════════════════════════════════════════════════════
  INSERT INTO inscripciones (folio, nombre, modalidad, grupo_id) VALUES
    ('3ACT1-001', 'Alfaro Juarez Jennifer Astrid',          'Cuatrimestral', v_3act1),
    ('3ACT1-002', 'Alvarado Ramirez Jasiel Emiliano',       'Cuatrimestral', v_3act1),
    ('3ACT1-003', 'Alvarado Zavala Maria Jose',             'Cuatrimestral', v_3act1),
    ('3ACT1-004', 'Benitez Torres Jayr Alath',              'Cuatrimestral', v_3act1),
    ('3ACT1-005', 'Bueno Villalobos Hannah Zayde',          'Cuatrimestral', v_3act1),
    ('3ACT1-006', 'Carrillo Valadez Angel Adolfo',          'Cuatrimestral', v_3act1),
    ('3ACT1-007', 'Cuellar Ramirez Christopher',            'Cuatrimestral', v_3act1),
    ('3ACT1-008', 'Godinez Belman Carlos Jaziel',           'Cuatrimestral', v_3act1),
    ('3ACT1-009', 'Guadian Rodriguez Ari Maximiliano',      'Cuatrimestral', v_3act1),
    ('3ACT1-010', 'Guerrero Diaz Cristiano Ashrael',        'Cuatrimestral', v_3act1),
    ('3ACT1-011', 'Gutierrez Maciel Daniel Jaret',          'Cuatrimestral', v_3act1),
    ('3ACT1-012', 'Hernandez Amaro Gustavo Tadeo',          'Cuatrimestral', v_3act1),
    ('3ACT1-014', 'Hernandez Ramirez Karla Pamela',         'Cuatrimestral', v_3act1),
    ('3ACT1-015', 'Herrera Rojas Estefani Lorenza',         'Cuatrimestral', v_3act1),
    ('3ACT1-017', 'Marquez Roa Hector Adrian',              'Cuatrimestral', v_3act1),
    ('3ACT1-018', 'Martinez Garcia Allison Stephania',      'Cuatrimestral', v_3act1),
    ('3ACT1-020', 'Moreno Gutierrez Sofia Guadalupe',       'Cuatrimestral', v_3act1),
    ('3ACT1-021', 'Muñoz Infante Diego',                    'Cuatrimestral', v_3act1),
    ('3ACT1-022', 'Ojeda Torres Sofia Del Carmen',          'Cuatrimestral', v_3act1),
    ('3ACT1-023', 'Padilla Muñoz Brandon Jose Luis',        'Cuatrimestral', v_3act1),
    ('3ACT1-025', 'Penagos Pesqueira Andre Patricio',       'Cuatrimestral', v_3act1),
    ('3ACT1-026', 'Ramirez Mendoza Juan Osvaldo',           'Cuatrimestral', v_3act1),
    ('3ACT1-027', 'Ramirez Silva Dominic Yered',            'Cuatrimestral', v_3act1),
    ('3ACT1-028', 'Ramirez Zaragoza Luis Angel',            'Cuatrimestral', v_3act1),
    ('3ACT1-029', 'Ramos Rios Daffne Yulie Adilene',        'Cuatrimestral', v_3act1),
    ('3ACT1-030', 'Reyes Servin Alan Santiago',             'Cuatrimestral', v_3act1),
    ('3ACT1-032', 'Sanchez Hidalgo Gabriela',               'Cuatrimestral', v_3act1),
    ('3ACT1-033', 'Sandoval Gonzalez Axel Gabriel',         'Cuatrimestral', v_3act1),
    ('3ACT1-034', 'Segoviano Ibarra Kimberli Yosdana',      'Cuatrimestral', v_3act1),
    ('3ACT1-036', 'Serrano Camargo Jorge Giovanni',         'Cuatrimestral', v_3act1),
    ('3ACT1-037', 'Torres Navarro Yandel Noe',              'Cuatrimestral', v_3act1),
    ('3ACT1-038', 'Valdivia Ibarra Dylan Jacobo',           'Cuatrimestral', v_3act1),
    ('3ACT1-039', 'Vega Gonzalez Luis Antonio',             'Cuatrimestral', v_3act1)
  ON CONFLICT (folio) DO UPDATE SET grupo_id = EXCLUDED.grupo_id;

  -- ══════════════════════════════════════════════════════════════════
  -- 3A CT2 — Turno 2 — Mayo-Agosto 2026 — 18 alumnos
  -- ══════════════════════════════════════════════════════════════════
  INSERT INTO inscripciones (folio, nombre, modalidad, grupo_id) VALUES
    ('3ACT2-001', 'Alvarez Camarillo Cristhofer Paolo',     'Cuatrimestral', v_3act2),
    ('3ACT2-002', 'Alvarado Valadez Allison Melisa',        'Cuatrimestral', v_3act2),
    ('3ACT2-003', 'Ayala Vazquez Jose Ivan',                'Cuatrimestral', v_3act2),
    ('3ACT2-004', 'Beltran Garnica Libby Iriel',            'Cuatrimestral', v_3act2),
    ('3ACT2-005', 'Chagoya Castro Camila Zoe',              'Cuatrimestral', v_3act2),
    ('3ACT2-006', 'Cruz Macias Ximena Estefania',           'Cuatrimestral', v_3act2),
    ('3ACT2-007', 'Frausto Alonso Camila Guadalupe',        'Cuatrimestral', v_3act2),
    ('3ACT2-008', 'Hernandez Garnica Dante Matteo',         'Cuatrimestral', v_3act2),
    ('3ACT2-009', 'Lopez Zavala Ulises',                    'Cuatrimestral', v_3act2),
    ('3ACT2-010', 'Mares Ortega Osmar Yael',                'Cuatrimestral', v_3act2),
    ('3ACT2-011', 'Ramirez Cruz Sarai Victoria',            'Cuatrimestral', v_3act2),
    ('3ACT2-012', 'Reyes Torres Driana Irlanda',            'Cuatrimestral', v_3act2),
    ('3ACT2-013', 'Reyes Torres Dulce Maria',               'Cuatrimestral', v_3act2),
    ('3ACT2-014', 'Rodriguez Estrada Brisa Sofia',          'Cuatrimestral', v_3act2),
    ('3ACT2-015', 'Torres Rodriguez Jaquelin Esmeralda',    'Cuatrimestral', v_3act2),
    ('3ACT2-016', 'Vargas Naves Uriel Roberto',             'Cuatrimestral', v_3act2),
    ('3ACT2-017', 'Vela Guardian Fernando Daniel',          'Cuatrimestral', v_3act2),
    ('3ACT2-018', 'Vela Guardian Zaira Zoely',              'Cuatrimestral', v_3act2)
  ON CONFLICT (folio) DO UPDATE SET grupo_id = EXCLUDED.grupo_id;

  RAISE NOTICE '✓ Importación completada: 6 grupos, 143 alumnos (21+31+17+23+33+18)';

END;
$$;
