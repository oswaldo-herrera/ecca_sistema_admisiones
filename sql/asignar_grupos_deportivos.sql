-- ============================================================
-- ASIGNACIÓN DE ALUMNOS A GRUPOS DEPORTIVOS
-- ECCA Preparatoria de León
-- Fuente: Transcripción de listas por categoría deportiva
-- ============================================================
--
-- REGLA: cada alumno queda en UN solo deporte.
-- El orden de ejecución define la prioridad:
--   1. Fútbol Varonil  →  sin restricción (asigna siempre)
--   2. Fútbol Femenil  →  sin restricción (sobreescribe si ya tenía)
--   3. Básquetbol      →  solo si aún sin deporte (no duplicar)
--   4. Natación        →  solo si aún sin deporte
--   5. Porra           →  solo si aún sin deporte
--
-- ALUMNOS CON NOMBRE INCOMPLETO — asignar manualmente en deportes.html:
--   • Aarón (?)             — Fútbol Varonil  1-A
--   • Samuel Isaac          — Fútbol Varonil  1-A
--   • Emilio Salvador (?)   — Fútbol Varonil  1-B
--   • Axel N... Ruiz (?)    — Fútbol Varonil  5-A
-- ============================================================

-- ─── 1. FÚTBOL VARONIL ──────────────────────────────────────
UPDATE inscripciones
SET grupo_deporte_id = (
  SELECT id FROM grupos WHERE nombre = 'Fútbol Varonil' AND tipo = 'deporte' LIMIT 1
)
WHERE NOT COALESCE(exalumno, false)
AND (
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Sergio%Medina%Vazquez%'))           OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Alexis%Enriquez%Orozco%'))          OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Luis%Fernando%Solorzano%'))         OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Angel%Jesus%Rios%Rios%'))           OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Valadez%Garcia%Roberto%'))          OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Roberto%Emmanuel%Valadez%'))        OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Valdivia%Boso%'))                   OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Cesar%Axel%Valdivia%'))             OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Axel%Alejandro%Sanchez%Rios%'))     OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Luis%Fernando%Rangel%Cervera%'))    OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Jose%Soto%Ramirez%'))               OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Cardenas%Sandoval%'))               OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Oswaldo%Edilberto%Montalvo%'))      OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Roberto%Ortiz%'))                   OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Francisco%Javier%Velazquez%Gonzalez%')) OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Roberto%Yael%Briseno%'))            OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Briseno%Ornelas%'))                 OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Benitez%Estudillo%'))               OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%David%Gonzalez%Avila%'))            OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Ricardo%Fabricio%Martinez%'))       OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Guillermo%Javier%Lara%'))           OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Martinez%Olmos%'))                  OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Angel%Kaleb%Ornelas%'))             OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Angel%Mauricio%Ochoa%Dominguez%'))  OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Miguel%Alejandro%Alonso%Rocha%'))   OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Iker%Adrian%Delgado%'))             OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Brayan%Juan%Pablo%Sanchez%'))       OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Angel%Santiago%Guerra%Serrato%'))   OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Victor%Ibarra%'))                   OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Leonardo%Mercado%'))                OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Saul%Juarez%'))                     OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Cristian%Emmanuel%Barrientos%'))    OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Jose%Joel%Rodriguez%Molina%'))      OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Luis%Emiliano%Garnica%'))           OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Edwin%Oliva%Castillo%'))            OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Adan%Alexander%Frias%'))            OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Gael%Emmanuel%Hernandez%'))         OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Paul%Galvan%Ruiz%'))                OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Gael%Ariel%Flores%Quintero%'))      OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Erik%Said%Valdovinos%'))            OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Alexis%Maxim%Chavez%'))             OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Juan%Oswaldo%Munoz%Montes%'))       OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Angel%Ivan%Ayala%Flores%'))         OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Forlan%Collazo%'))                  OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Ivan%Emiliano%Ayala%Almanza%'))     OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Joseph%Efrain%Morales%'))           OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Samuel%Abraham%Rodriguez%'))        OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Leonardo%Aceves%'))                 OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Juan%Pablo%Gomez%Vargas%'))         OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Luis%Antonio%Perez%'))              OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Cesar%Enrique%Ramirez%'))           OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Santiago%Animo%Perez%'))            OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Juan%Oswaldo%Hernandez%Morales%'))  OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Dario%David%Rea%Gomez%'))           OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Mateo%Hinojosa%Camarillo%'))        OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Juan%Carlos%Garcia%Sotelo%'))       OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Oscar%Santiago%Jimenez%Leon%'))     OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Pedro%Jesus%Gomez%Munoz%'))         OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Francisco%Javier%Perez%'))          OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Cesar%Andre%Ros%Guzman%'))          OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Ramon%Alejandro%Serrano%Mata%'))    OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Cecil%Octavio%Mena%'))              OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Zoel%Enrique%Martinez%Salazar%'))   OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Christian%Emmanuel%Macias%'))       OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Ricardo%Camacho%Anda%'))            OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Ivan%Emiliano%Ruiz%Almanza%'))      OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Cesar%Avalos%Ramirez%'))            OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Kevin%Yosef%Efrain%'))              OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Aguilera%Villegas%'))
);

-- ─── 2. FÚTBOL FEMENIL ──────────────────────────────────────
UPDATE inscripciones
SET grupo_deporte_id = (
  SELECT id FROM grupos WHERE nombre = 'Fútbol Femenil' AND tipo = 'deporte' LIMIT 1
)
WHERE NOT COALESCE(exalumno, false)
AND (
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Maria%Jose%Moreno%Suarez%'))        OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Zoe%Rico%Valadez%'))                OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Grecia%Yareli%Hernandez%'))         OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Sandra%Ximena%Alvarado%'))          OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Danna%Azucena%Munoz%Lopez%'))       OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Karen%Daniela%Gutierrez%Bernal%'))  OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Leah%Odette%Segoviano%'))           OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Vanesa%Guadalupe%Martinez%Rogero%')) OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Catzury%Yamile%Garcia%'))           OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Izel%Lopez%Orozco%'))               OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Itzel%Lopez%Orozco%'))              OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Pamela%Natalia%Moya%'))             OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Moya%Rubio%Pamela%'))               OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Perla%Ramirez%Reyna%'))             OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Jacqueline%Ira%Rocha%'))            OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Zilia%Estefanie%Ruiz%Portillo%'))   OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Guadalupe%Jade%Tovar%'))            OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Dafne%Xiomara%Hernandez%'))         OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Dulce%Alitz%Castillo%'))            OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Donna%Alejandra%Rocha%Lopez%'))     OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Samantha%Jazmin%Vargas%'))          OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Mayeli%Guadalupe%Godinez%'))        OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Karol%Ixchel%Hernandez%'))          OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Natali%Guadalupe%Ferro%'))          OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Kimberly%Guadalupe%Olvera%'))       OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Angela%Renata%Moreno%Herrera%'))    OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Amadora%Castaneda%'))               OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Diana%Karina%Romo%Tovar%'))         OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Lesly%Karina%Ruiz%Cruz%'))          OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Karol%Sandoval%Orozco%'))           OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Karla%Fernanda%Garcia%Plascencia%'))
);

-- ─── 3. BÁSQUETBOL (solo si aún sin deporte) ────────────────
UPDATE inscripciones
SET grupo_deporte_id = (
  SELECT id FROM grupos WHERE nombre ILIKE '%asquet%' AND tipo = 'deporte' LIMIT 1
)
WHERE NOT COALESCE(exalumno, false)
AND grupo_deporte_id IS NULL
AND (
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Angel%Maximo%Ramirez%Saldana%'))   OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Esau%Garrido%'))                   OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Zaid%Delgado%Zuniga%'))            OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Axel%Emiliano%Ruiz%Plascencia%'))  OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Mauricio%Animo%Perez%'))           OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Dorian%Ramirez%'))
  -- Ángel Kaleb Ornelas → ya asignado a Fútbol Varonil, se omite aquí
  -- Christian Emmanuel Macías Silva → ya asignado a Fútbol Varonil, se omite aquí
);

-- ─── 4. NATACIÓN (solo si aún sin deporte) ──────────────────
UPDATE inscripciones
SET grupo_deporte_id = (
  SELECT id FROM grupos WHERE nombre ILIKE '%nataci%' AND tipo = 'deporte' LIMIT 1
)
WHERE NOT COALESCE(exalumno, false)
AND grupo_deporte_id IS NULL
AND (
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Alma%Monserrat%'))                 OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Cesar%Ramirez%Ramirez%'))
  -- Ángela Renata Moreno → Fútbol Femenil
  -- Karen Daniela Gutiérrez Bernal → Fútbol Femenil
);

-- ─── 5. PORRA (solo si aún sin deporte) ─────────────────────
UPDATE inscripciones
SET grupo_deporte_id = (
  SELECT id FROM grupos WHERE nombre ILIKE '%porra%' AND tipo = 'deporte' LIMIT 1
)
WHERE NOT COALESCE(exalumno, false)
AND grupo_deporte_id IS NULL
AND (
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Aldee%Javier%Cabrera%'))           OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Fernanda%Guadalupe%Lemus%'))       OR
  unaccent(lower(nombre)) ILIKE unaccent(lower('%Renata%Hernandez%Torres%'))
  -- Diana Karina Romo Tovar → Fútbol Femenil
  -- Lesly Karina Ruiz Cruz  → Fútbol Femenil
  -- Izel/Itzel López Orozco → Fútbol Femenil
);

-- ============================================================
-- VERIFICACIÓN — cuántos alumnos quedaron en cada deporte:
-- ============================================================
SELECT
  g.nombre  AS deporte,
  COUNT(i.folio) AS alumnos
FROM grupos g
LEFT JOIN inscripciones i ON i.grupo_deporte_id = g.id
WHERE g.tipo = 'deporte'
GROUP BY g.nombre
ORDER BY g.nombre;
