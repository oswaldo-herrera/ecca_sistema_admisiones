-- ============================================================
-- ECCA — Catalogo de Materias
-- Semestral (1 al 6) y Cuatrimestral (1 al 6, 3 areas)
-- Ejecutar en Supabase SQL Editor (una sola vez)
-- ============================================================
-- Para reinsertar desde cero descomenta esta linea primero:
-- TRUNCATE TABLE materias RESTART IDENTITY CASCADE;

INSERT INTO materias (nombre, grado, descripcion) VALUES

-- ══════════════════════════════════════════════════════════════
-- MODALIDAD SEMESTRAL
-- ══════════════════════════════════════════════════════════════

-- ── 1° Semestral ──────────────────────────────────────────────
('ESPANOL I',                             '1° Semestral', 'Semestral'),
('MATEMATICAS I',                         '1° Semestral', 'Semestral'),
('METODOLOGIA DE LAS CIENCIAS I',         '1° Semestral', 'Semestral'),
('BIOLOGIA I',                            '1° Semestral', 'Semestral'),
('CIENCIAS SOCIALES I',                   '1° Semestral', 'Semestral'),
('HISTORIA UNIVERSAL CONTEMPORANEA',      '1° Semestral', 'Semestral'),
('MECANOGRAFIA I',                        '1° Semestral', 'Semestral'),
('COMPLEMENTOS DE ARITMETICA I',          '1° Semestral', 'Semestral'),
('ESTRUCTURA EMPRESARIAL MEXICANA I',     '1° Semestral', 'Semestral'),
('SUPERACION PERSONAL',                   '1° Semestral', 'Semestral'),
('DEPORTES',                              '1° Semestral', 'Semestral'),

-- ── 2° Semestral ──────────────────────────────────────────────
('ESPANOL II',                            '2° Semestral', 'Semestral'),
('MATEMATICAS II',                        '2° Semestral', 'Semestral'),
('METODOLOGIA DE LAS CIENCIAS II',        '2° Semestral', 'Semestral'),
('BIOLOGIA II',                           '2° Semestral', 'Semestral'),
('CIENCIAS SOCIALES II',                  '2° Semestral', 'Semestral'),
('HISTORIA DE MEXICO I',                  '2° Semestral', 'Semestral'),
('MECANOGRAFIA II',                       '2° Semestral', 'Semestral'),
('COMPUTACION',                           '2° Semestral', 'Semestral'),
('COMPLEMENTOS DE ARITMETICA II',         '2° Semestral', 'Semestral'),
('ESTRUCTURA EMPRESARIAL MEXICANA II',    '2° Semestral', 'Semestral'),
('ARCHIVO Y DOCUMENTACION',               '2° Semestral', 'Semestral'),
('INGLES',                                '2° Semestral', 'Semestral'),
('DEPORTES',                              '2° Semestral', 'Semestral'),

-- ── 3° Semestral ──────────────────────────────────────────────
('TALLER DE LECTURA Y REDACCION I',       '3° Semestral', 'Semestral'),
('MATEMATICAS III',                       '3° Semestral', 'Semestral'),
('LENGUAJE EXTRANJERO (INGLES I)',         '3° Semestral', 'Semestral'),
('QUIMICA I',                             '3° Semestral', 'Semestral'),
('FISICA I',                              '3° Semestral', 'Semestral'),
('HISTORIA DE MEXICO II',                 '3° Semestral', 'Semestral'),
('INTRODUCCION A LA FILOSOFIA I',         '3° Semestral', 'Semestral'),
('PSICOLOGIA',                            '3° Semestral', 'Semestral'),
('MECANOGRAFIA III',                      '3° Semestral', 'Semestral'),
('INTRODUCCION A LA CONTABILIDAD',        '3° Semestral', 'Semestral'),
('DEPORTES',                              '3° Semestral', 'Semestral'),

-- ── 4° Semestral ──────────────────────────────────────────────
('TALLER DE LECTURA Y REDACCION II',      '4° Semestral', 'Semestral'),
('MATEMATICAS IV',                        '4° Semestral', 'Semestral'),
('LENGUAJE EXTRANJERO (INGLES II)',        '4° Semestral', 'Semestral'),
('QUIMICA II',                            '4° Semestral', 'Semestral'),
('FISICA II',                             '4° Semestral', 'Semestral'),
('HISTORIA DE MEXICO III',                '4° Semestral', 'Semestral'),
('INTRODUCCION A LA FILOSOFIA II',        '4° Semestral', 'Semestral'),
('RELACIONES HUMANAS',                    '4° Semestral', 'Semestral'),
('INTRODUCCION A LA CONTABILIDAD II',     '4° Semestral', 'Semestral'),
('HOJA DE CALCULO COMPUTACIONAL',         '4° Semestral', 'Semestral'),
('MANEJO DE CUOTAS IMSS',                 '4° Semestral', 'Semestral'),
('DEPORTES',                              '4° Semestral', 'Semestral'),

-- ── 5° Semestral ──────────────────────────────────────────────
('ADMINISTRACION I',                      '5° Semestral', 'Semestral'),
('MATEMATICAS FINANCIERAS I',             '5° Semestral', 'Semestral'),
('LENGUAJE EXTRANJERO (INGLES III)',       '5° Semestral', 'Semestral'),
('NOCIONES GENERALES DE DERECHO I',       '5° Semestral', 'Semestral'),
('MERCADOTECNIA I',                       '5° Semestral', 'Semestral'),
('ECONOMIA I',                            '5° Semestral', 'Semestral'),
('CONTABILIDAD BASICA I',                 '5° Semestral', 'Semestral'),
('COMPUTACION ESTADISTICA I',             '5° Semestral', 'Semestral'),
('MATEMATICAS TEMAS COMPLEMENTARIOS I',   '5° Semestral', 'Semestral'),
('CONTABILIDAD DE COSTOS I',              '5° Semestral', 'Semestral'),
('FISCAL I',                              '5° Semestral', 'Semestral'),
('DEPORTES',                              '5° Semestral', 'Semestral'),

-- ── 6° Semestral ──────────────────────────────────────────────
('ADMINISTRACION II',                     '6° Semestral', 'Semestral'),
('MATEMATICAS FINANCIERAS II',            '6° Semestral', 'Semestral'),
('LENGUAJE EXTRANJERO (INGLES IV)',        '6° Semestral', 'Semestral'),
('NOCIONES GENERALES DE DERECHO II',      '6° Semestral', 'Semestral'),
('MERCADOTECNIA II',                      '6° Semestral', 'Semestral'),
('ECONOMIA II',                           '6° Semestral', 'Semestral'),
('CONTABILIDAD BASICA II',                '6° Semestral', 'Semestral'),
('COMPUTACION ESTADISTICA II',            '6° Semestral', 'Semestral'),
('MATEMATICAS TEMAS COMPLEMENTARIOS II',  '6° Semestral', 'Semestral'),
('INTERPRETACION DE ESTADOS FINANCIEROS', '6° Semestral', 'Semestral'),
('ARTES',                                 '6° Semestral', 'Semestral'),
('DEPORTES',                              '6° Semestral', 'Semestral'),

-- ══════════════════════════════════════════════════════════════
-- MODALIDAD CUATRIMESTRAL — Comun (1° al 4°)
-- ══════════════════════════════════════════════════════════════

-- ── 1° Cuatrimestral ──────────────────────────────────────────
('ALGEBRA I',                             '1° Cuatrimestral', 'Cuatrimestral'),
('QUIMICA I',                             '1° Cuatrimestral', 'Cuatrimestral'),
('METODOS DE INVESTIGACION I',            '1° Cuatrimestral', 'Cuatrimestral'),
('INTRODUCCION A LAS CIENCIAS SOCIALES',  '1° Cuatrimestral', 'Cuatrimestral'),
('TALLER DE LECTURA Y REDACCION I',       '1° Cuatrimestral', 'Cuatrimestral'),
('INGLES I',                              '1° Cuatrimestral', 'Cuatrimestral'),
('ACTIVIDADES ARTISTICAS I',              '1° Cuatrimestral', 'Cuatrimestral'),
('SUPERACION PERSONAL',                   '1° Cuatrimestral', 'Cuatrimestral'),
('DEPORTES',                              '1° Cuatrimestral', 'Cuatrimestral'),

-- ── 2° Cuatrimestral ──────────────────────────────────────────
('ALGEBRA II',                            '2° Cuatrimestral', 'Cuatrimestral'),
('QUIMICA II',                            '2° Cuatrimestral', 'Cuatrimestral'),
('METODOS DE INVESTIGACION II',           '2° Cuatrimestral', 'Cuatrimestral'),
('HISTORIA DE MEXICO I',                  '2° Cuatrimestral', 'Cuatrimestral'),
('TALLER DE LECTURA Y REDACCION II',      '2° Cuatrimestral', 'Cuatrimestral'),
('INGLES II',                             '2° Cuatrimestral', 'Cuatrimestral'),
('ACTIVIDADES ARTISTICAS II',             '2° Cuatrimestral', 'Cuatrimestral'),
('SUPERACION PERSONAL',                   '2° Cuatrimestral', 'Cuatrimestral'),
('DEPORTES',                              '2° Cuatrimestral', 'Cuatrimestral'),

-- ── 3° Cuatrimestral ──────────────────────────────────────────
('TRIGONOMETRIA',                         '3° Cuatrimestral', 'Cuatrimestral'),
('FISICA I',                              '3° Cuatrimestral', 'Cuatrimestral'),
('ETICA Y VALORES',                       '3° Cuatrimestral', 'Cuatrimestral'),
('HISTORIA DE MEXICO II',                 '3° Cuatrimestral', 'Cuatrimestral'),
('LITERATURA',                            '3° Cuatrimestral', 'Cuatrimestral'),
('INGLES III',                            '3° Cuatrimestral', 'Cuatrimestral'),
('ORIENTACION VOCACIONAL I',              '3° Cuatrimestral', 'Cuatrimestral'),
('DEPORTES',                              '3° Cuatrimestral', 'Cuatrimestral'),

-- ── 4° Cuatrimestral ──────────────────────────────────────────
('GEOMETRIA ANALITICA',                   '4° Cuatrimestral', 'Cuatrimestral'),
('FISICA II',                             '4° Cuatrimestral', 'Cuatrimestral'),
('FILOSOFIA',                             '4° Cuatrimestral', 'Cuatrimestral'),
('ESTRUCTURAS SOCIOECONOMICAS DE MEXICO', '4° Cuatrimestral', 'Cuatrimestral'),
('BIOLOGIA',                              '4° Cuatrimestral', 'Cuatrimestral'),
('INGLES IV',                             '4° Cuatrimestral', 'Cuatrimestral'),
('ORIENTACION VOCACIONAL II',             '4° Cuatrimestral', 'Cuatrimestral'),
('DEPORTES',                              '4° Cuatrimestral', 'Cuatrimestral'),

-- ══════════════════════════════════════════════════════════════
-- MODALIDAD CUATRIMESTRAL — Area: Humanidades (5° y 6°)
-- ══════════════════════════════════════════════════════════════

-- ── 5° Cuatrimestral — Humanidades ────────────────────────────
('SOCIOLOGIA I',                          '5° Cuatrimestral', 'Cuatrimestral - Humanidades'),
('TEMAS SELECTOS DE PSICOLOGIA I',        '5° Cuatrimestral', 'Cuatrimestral - Humanidades'),
('TEMAS SELECTOS DE DERECHO I',           '5° Cuatrimestral', 'Cuatrimestral - Humanidades'),
('HISTORIA UNIVERSAL',                    '5° Cuatrimestral', 'Cuatrimestral - Humanidades'),
('LITERATURA UNIVERSAL',                  '5° Cuatrimestral', 'Cuatrimestral - Humanidades'),
('INGLES V',                              '5° Cuatrimestral', 'Cuatrimestral - Humanidades'),
('INFORMATICA I',                         '5° Cuatrimestral', 'Cuatrimestral - Humanidades'),
('DEPORTES',                              '5° Cuatrimestral', 'Cuatrimestral - Humanidades'),

-- ── 6° Cuatrimestral — Humanidades ────────────────────────────
('SOCIOLOGIA II',                         '6° Cuatrimestral', 'Cuatrimestral - Humanidades'),
('TEMAS SELECTOS DE PSICOLOGIA II',       '6° Cuatrimestral', 'Cuatrimestral - Humanidades'),
('TEMAS SELECTOS DE DERECHO II',          '6° Cuatrimestral', 'Cuatrimestral - Humanidades'),
('HISTORIA DEL ARTE',                     '6° Cuatrimestral', 'Cuatrimestral - Humanidades'),
('LITERATURA MEXICANA',                   '6° Cuatrimestral', 'Cuatrimestral - Humanidades'),
('INGLES VI',                             '6° Cuatrimestral', 'Cuatrimestral - Humanidades'),
('INFORMATICA II',                        '6° Cuatrimestral', 'Cuatrimestral - Humanidades'),
('DEPORTES',                              '6° Cuatrimestral', 'Cuatrimestral - Humanidades'),

-- ══════════════════════════════════════════════════════════════
-- MODALIDAD CUATRIMESTRAL — Area: Economico Administrativo (5° y 6°)
-- ══════════════════════════════════════════════════════════════

-- ── 5° Cuatrimestral — Economico Administrativo ───────────────
('MATEMATICAS FINANCIERAS',               '5° Cuatrimestral', 'Cuatrimestral - Economico Administrativo'),
('ADMINISTRACION I',                      '5° Cuatrimestral', 'Cuatrimestral - Economico Administrativo'),
('CONTABILIDAD I',                        '5° Cuatrimestral', 'Cuatrimestral - Economico Administrativo'),
('ECONOMIA I',                            '5° Cuatrimestral', 'Cuatrimestral - Economico Administrativo'),
('PROBLEMAS SOCIALES, POLITICOS Y ECONOMICOS DE MEXICO I',  '5° Cuatrimestral', 'Cuatrimestral - Economico Administrativo'),
('INGLES V',                              '5° Cuatrimestral', 'Cuatrimestral - Economico Administrativo'),
('INFORMATICA I',                         '5° Cuatrimestral', 'Cuatrimestral - Economico Administrativo'),
('DEPORTES',                              '5° Cuatrimestral', 'Cuatrimestral - Economico Administrativo'),

-- ── 6° Cuatrimestral — Economico Administrativo ───────────────
('PROBABILIDAD Y ESTADISTICA',            '6° Cuatrimestral', 'Cuatrimestral - Economico Administrativo'),
('ADMINISTRACION II',                     '6° Cuatrimestral', 'Cuatrimestral - Economico Administrativo'),
('CONTABILIDAD II',                       '6° Cuatrimestral', 'Cuatrimestral - Economico Administrativo'),
('ECONOMIA II',                           '6° Cuatrimestral', 'Cuatrimestral - Economico Administrativo'),
('PROBLEMAS SOCIALES, POLITICOS Y ECONOMICOS DE MEXICO II', '6° Cuatrimestral', 'Cuatrimestral - Economico Administrativo'),
('INGLES VI',                             '6° Cuatrimestral', 'Cuatrimestral - Economico Administrativo'),
('INFORMATICA II',                        '6° Cuatrimestral', 'Cuatrimestral - Economico Administrativo'),
('DEPORTES',                              '6° Cuatrimestral', 'Cuatrimestral - Economico Administrativo'),

-- ══════════════════════════════════════════════════════════════
-- MODALIDAD CUATRIMESTRAL — Area: Fisico Matematico (5° y 6°)
-- ══════════════════════════════════════════════════════════════

-- ── 5° Cuatrimestral — Fisico Matematico ──────────────────────
('CALCULO DIFERENCIAL',                   '5° Cuatrimestral', 'Cuatrimestral - Fisico Matematico'),
('TEMAS SELECTOS DE FISICA I',            '5° Cuatrimestral', 'Cuatrimestral - Fisico Matematico'),
('DIBUJO TECNICO',                        '5° Cuatrimestral', 'Cuatrimestral - Fisico Matematico'),
('ESTADISTICA I',                         '5° Cuatrimestral', 'Cuatrimestral - Fisico Matematico'),
('MECANICA',                              '5° Cuatrimestral', 'Cuatrimestral - Fisico Matematico'),
('INGLES V',                              '5° Cuatrimestral', 'Cuatrimestral - Fisico Matematico'),
('INFORMATICA I',                         '5° Cuatrimestral', 'Cuatrimestral - Fisico Matematico'),
('DEPORTES',                              '5° Cuatrimestral', 'Cuatrimestral - Fisico Matematico'),

-- ── 6° Cuatrimestral — Fisico Matematico ──────────────────────
('CALCULO INTEGRAL',                      '6° Cuatrimestral', 'Cuatrimestral - Fisico Matematico'),
('TEMAS SELECTOS DE FISICA II',           '6° Cuatrimestral', 'Cuatrimestral - Fisico Matematico'),
('DISENO GRAFICO',                        '6° Cuatrimestral', 'Cuatrimestral - Fisico Matematico'),
('ESTADISTICA II',                        '6° Cuatrimestral', 'Cuatrimestral - Fisico Matematico'),
('CALOR Y ELECTRICIDAD',                  '6° Cuatrimestral', 'Cuatrimestral - Fisico Matematico'),
('INGLES VI',                             '6° Cuatrimestral', 'Cuatrimestral - Fisico Matematico'),
('INFORMATICA II',                        '6° Cuatrimestral', 'Cuatrimestral - Fisico Matematico'),
('DEPORTES',                              '6° Cuatrimestral', 'Cuatrimestral - Fisico Matematico');

-- ── Verificacion ──────────────────────────────────────────────
SELECT
  descripcion,
  grado,
  COUNT(*) AS materias
FROM materias
GROUP BY descripcion, grado
ORDER BY descripcion, grado;
