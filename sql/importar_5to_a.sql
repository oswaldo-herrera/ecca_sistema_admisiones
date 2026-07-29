-- ================================================
--  ECCA — Importar alumnos 5TO A
--  Periodo: Agosto-Diciembre 2026
--  Ejecutar en el SQL Editor de Supabase
-- ================================================

DO $$
DECLARE
  v_grupo_id bigint;
BEGIN

  -- 1) Buscar el grupo "5TO A" o crearlo si no existe
  SELECT id INTO v_grupo_id FROM grupos WHERE nombre = '5TO A' LIMIT 1;

  IF v_grupo_id IS NULL THEN
    INSERT INTO grupos (nombre, modalidad, ciclo)
    VALUES ('5TO A', 'Semestral', 'Agosto-Diciembre 2026')
    RETURNING id INTO v_grupo_id;
    RAISE NOTICE 'Grupo "5TO A" creado con id %', v_grupo_id;
  ELSE
    RAISE NOTICE 'Grupo "5TO A" ya existe con id %', v_grupo_id;
  END IF;

  -- 2) Insertar los 37 alumnos (usa matrícula oficial como folio)
  --    ON CONFLICT DO UPDATE solo actualiza el grupo_id si el alumno ya existía
  INSERT INTO inscripciones (folio, nombre, modalidad, grupo_id)
  VALUES
    ('SEM/3A/24001', 'Alferez Hernández Evelyn Natalia',      'Semestral', v_grupo_id),
    ('SEM/3A/24002', 'Alvarado Gutiérrez Sandra Ximena',      'Semestral', v_grupo_id),
    ('SEM/3A/24003', 'Angeles Orozco Joshua Alexander',        'Semestral', v_grupo_id),
    ('SEM/3A/24004', 'Briseño Ornelas Roberto Yael',           'Semestral', v_grupo_id),
    ('SEM/3A/24005', 'Carrillo Nila Bryan Ulises',             'Semestral', v_grupo_id),
    ('SEM/3A/24006', 'Caudillo Hernández Ariadna Getsemani',   'Semestral', v_grupo_id),
    ('SEM/3A/24007', 'Cervantes Cardona Nayelli',              'Semestral', v_grupo_id),
    ('SEM/3A/24008', 'Cruz Portillo Lilia Estefanía',          'Semestral', v_grupo_id),
    ('SEM/3A/24010', 'Desiderio Barajas Lorena Jazmín',        'Semestral', v_grupo_id),
    ('SEM/3A/24012', 'Enriquez Orozco Alexis',                 'Semestral', v_grupo_id),
    ('SEM/3A/24013', 'Fiscal Regalado Manuel Alejandro',       'Semestral', v_grupo_id),
    ('SEM/3A/24014', 'Galan Blanco Ivette Guadalupe',          'Semestral', v_grupo_id),
    ('SEM/3A/24015', 'García Martínez Kimberly Jaxil',         'Semestral', v_grupo_id),
    ('SEM/3A/24016', 'García Rangel Renata',                   'Semestral', v_grupo_id),
    ('SEM/3A/24017', 'Gervacio Soto Miriam',                   'Semestral', v_grupo_id),
    ('SEM/3A/24020', 'Gutierrez Serratos Angel Santiago',      'Semestral', v_grupo_id),
    ('SEM/3A/24024', 'Herrera Elizondo Angel Alejandro',       'Semestral', v_grupo_id),
    ('SEM/3A/24025', 'Hierro Chacón Angela Alitza',            'Semestral', v_grupo_id),
    ('SEM/3A/24026', 'Lira Juárez Jaqueline Monserrat',        'Semestral', v_grupo_id),
    ('SEM/3A/24027', 'López Martínez Brenda Sofia',            'Semestral', v_grupo_id),
    ('SEM/3A/24031', 'Medina Vázquez Sergio Manuel',           'Semestral', v_grupo_id),
    ('SEM/3A/24032', 'Moya Rubio Pamela Natalia',              'Semestral', v_grupo_id),
    ('SEM/3A/24033', 'Murillo Quintero Hugo',                  'Semestral', v_grupo_id),
    ('SEM/3A/24034', 'Nachez Rivera Mayte',                    'Semestral', v_grupo_id),
    ('SEM/3A/24035', 'Nares Pérez Axel',                       'Semestral', v_grupo_id),
    ('SEM/3A/24036', 'Negrete Cortes Juan Luis',               'Semestral', v_grupo_id),
    ('SEM/3A/24037', 'Orozco Varela Karol Sonduri',            'Semestral', v_grupo_id),
    ('SEM/3A/24038', 'Ortiz Rangel Frida Sofia',               'Semestral', v_grupo_id),
    ('SEM/3A/24039', 'Ortiz Yepez José Roberto',               'Semestral', v_grupo_id),
    ('SEM/3A/24040', 'Perez Guerrero Sonia Arleth Yessenia',   'Semestral', v_grupo_id),
    ('SEM/3A/24041', 'Ramírez Reyna Perla Guadalupe',          'Semestral', v_grupo_id),
    ('SEM/3A/24042', 'Rocha Solis Jaqueline Irazu',            'Semestral', v_grupo_id),
    ('SEM/3A/24043', 'Sánchez Hidalgo Brayan Juan Pablo',      'Semestral', v_grupo_id),
    ('SEM/3A/24044', 'Santos Cuevas Cynthia Karolina',         'Semestral', v_grupo_id),
    ('SEM/3A/24045', 'Urtaza Ortega Camila',                   'Semestral', v_grupo_id),
    ('SEM/3A/24046', 'Vazquez Alvarez Josue Esau',             'Semestral', v_grupo_id),
    ('SEM/3A/24047', 'Velazquez Gonzalez Francisco Javier',    'Semestral', v_grupo_id)
  ON CONFLICT (folio) DO UPDATE SET
    grupo_id = EXCLUDED.grupo_id;

  RAISE NOTICE '37 alumnos insertados/actualizados en grupo 5TO A (id=%)', v_grupo_id;

END;
$$;
