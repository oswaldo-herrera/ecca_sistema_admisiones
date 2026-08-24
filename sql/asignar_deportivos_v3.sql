-- ============================================================
-- ASIGNACIÓN COMPLETA DE GRUPOS DEPORTIVOS — v3 (CORREGIDO)
-- Usa unaccent+lower en ambos lados para máxima compatibilidad
-- ============================================================

-- PASO 0: Crear grupo Tocho Varonil si no existe
INSERT INTO grupos (nombre, tipo, deporte)
SELECT 'Tocho Varonil', 'deporte', 'Tocho'
WHERE NOT EXISTS (
  SELECT 1 FROM grupos WHERE nombre = 'Tocho Varonil' AND tipo = 'deporte'
);

-- PASO 1: Limpiar TODAS las asignaciones deportivas previas
UPDATE inscripciones
SET grupo_deporte_id = NULL
WHERE grupo_deporte_id IN (SELECT id FROM grupos WHERE tipo = 'deporte');

-- ============================================================
-- 1. FÚTBOL FEMENIL — lista específica de 19 alumnas
-- ============================================================
UPDATE inscripciones
SET grupo_deporte_id = (
  SELECT id FROM grupos WHERE nombre = 'Fútbol Femenil' AND tipo = 'deporte' LIMIT 1
)
WHERE NOT COALESCE(exalumno, false)
AND (
  unaccent(lower(nombre)) ILIKE '%dulce%castillo%galloso%'          OR
  unaccent(lower(nombre)) ILIKE '%donna%rocha%lopez%'               OR
  unaccent(lower(nombre)) ILIKE '%samantha%vargas%vargas%'          OR
  unaccent(lower(nombre)) ILIKE '%mayeli%godinez%'                  OR
  unaccent(lower(nombre)) ILIKE '%karol%ixchel%hernandez%'          OR
  unaccent(lower(nombre)) ILIKE '%natali%ferro%maldonado%'          OR
  unaccent(lower(nombre)) ILIKE '%kimberly%olvera%reyes%'           OR
  unaccent(lower(nombre)) ILIKE '%angela%renata%moreno%herrera%'    OR
  unaccent(lower(nombre)) ILIKE '%moya%rubio%pamela%'               OR
  unaccent(lower(nombre)) ILIKE '%pamela%natalia%moya%'             OR
  unaccent(lower(nombre)) ILIKE '%amadora%castaneda%'               OR
  unaccent(lower(nombre)) ILIKE '%karla%paulina%bustos%'            OR
  unaccent(lower(nombre)) ILIKE '%nayeli%cervantes%cardona%'        OR
  unaccent(lower(nombre)) ILIKE '%karol%noemi%guerrero%salinas%'    OR
  unaccent(lower(nombre)) ILIKE '%judith%jatzamany%lopez%'          OR
  unaccent(lower(nombre)) ILIKE '%mia%naomi%espejel%'               OR
  unaccent(lower(nombre)) ILIKE '%diana%karina%romo%tovar%'         OR
  unaccent(lower(nombre)) ILIKE '%lesly%karina%ruiz%cruz%'          OR
  unaccent(lower(nombre)) ILIKE '%karol%sandoval%orozco%'           OR
  unaccent(lower(nombre)) ILIKE '%karla%fernanda%garcia%plascencia%'
);

-- ============================================================
-- 2. FÚTBOL VARONIL — lista FÚTBOL completa (IS NULL: no sobreescribe Femenil)
-- ============================================================
UPDATE inscripciones
SET grupo_deporte_id = (
  SELECT id FROM grupos WHERE nombre = 'Fútbol Varonil' AND tipo = 'deporte' LIMIT 1
)
WHERE NOT COALESCE(exalumno, false)
AND grupo_deporte_id IS NULL
AND (
  unaccent(lower(nombre)) ILIKE '%sergio%medina%vazquez%'           OR
  unaccent(lower(nombre)) ILIKE '%alexis%enriquez%orozco%'          OR
  unaccent(lower(nombre)) ILIKE '%luis%fernando%solorzano%salazar%' OR
  unaccent(lower(nombre)) ILIKE '%angel%jesus%rios%rios%'           OR
  unaccent(lower(nombre)) ILIKE '%valadez%garcia%roberto%'          OR
  unaccent(lower(nombre)) ILIKE '%roberto%valadez%garcia%'          OR
  unaccent(lower(nombre)) ILIKE '%valdivia%boso%'                   OR
  unaccent(lower(nombre)) ILIKE '%axel%alejandro%sanchez%rios%'     OR
  unaccent(lower(nombre)) ILIKE '%luis%fernando%rangel%cervera%'    OR
  unaccent(lower(nombre)) ILIKE '%jose%de%jesus%soto%ramirez%'      OR
  unaccent(lower(nombre)) ILIKE '%cardenas%sandoval%'               OR
  unaccent(lower(nombre)) ILIKE '%oswaldo%edilberto%montalvo%'      OR
  unaccent(lower(nombre)) ILIKE '%roberto%ortiz%yeezer%'            OR
  unaccent(lower(nombre)) ILIKE '%francisco%javier%velazquez%gonzalez%' OR
  unaccent(lower(nombre)) ILIKE '%briseno%ornelas%'                 OR
  unaccent(lower(nombre)) ILIKE '%aguilera%villegas%'               OR
  unaccent(lower(nombre)) ILIKE '%benitez%estudillo%'               OR
  unaccent(lower(nombre)) ILIKE '%ricardo%fabricio%martinez%ramirez%' OR
  unaccent(lower(nombre)) ILIKE '%guillermo%javier%lara%cortez%'    OR
  unaccent(lower(nombre)) ILIKE '%martinez%olmos%'                  OR
  unaccent(lower(nombre)) ILIKE '%angel%mauricio%ochoa%dominguez%'  OR
  unaccent(lower(nombre)) ILIKE '%miguel%alejandro%alonso%rocha%'   OR
  unaccent(lower(nombre)) ILIKE '%iker%adrian%delgado%'             OR
  unaccent(lower(nombre)) ILIKE '%brayan%juan%pablo%sanchez%hidalgo%' OR
  unaccent(lower(nombre)) ILIKE '%angel%santiago%guerra%serrato%'   OR
  unaccent(lower(nombre)) ILIKE '%saul%juarez%'                     OR
  unaccent(lower(nombre)) ILIKE '%cristian%emmanuel%barrientos%'    OR
  unaccent(lower(nombre)) ILIKE '%jose%joel%rodriguez%molina%'      OR
  unaccent(lower(nombre)) ILIKE '%luis%emiliano%garnica%hernandez%' OR
  unaccent(lower(nombre)) ILIKE '%edwin%oliva%castillo%monroy%'     OR
  unaccent(lower(nombre)) ILIKE '%adan%alexander%frias%valadez%'    OR
  unaccent(lower(nombre)) ILIKE '%gael%emmanuel%hernandez%'         OR
  unaccent(lower(nombre)) ILIKE '%paul%galvan%ruiz%'                OR
  unaccent(lower(nombre)) ILIKE '%gael%ariel%flores%quintero%'      OR
  unaccent(lower(nombre)) ILIKE '%erik%said%valdovinos%'            OR
  unaccent(lower(nombre)) ILIKE '%alexis%maxim%chavez%lopez%'       OR
  unaccent(lower(nombre)) ILIKE '%juan%oswaldo%munoz%montes%'       OR
  unaccent(lower(nombre)) ILIKE '%angel%ivan%ayala%flores%'         OR
  unaccent(lower(nombre)) ILIKE '%forlan%collazo%luna%'             OR
  unaccent(lower(nombre)) ILIKE '%ivan%emiliano%ayala%almanza%'     OR
  unaccent(lower(nombre)) ILIKE '%joseph%efrain%morales%orozco%'    OR
  unaccent(lower(nombre)) ILIKE '%juan%pablo%gomez%vargas%'         OR
  unaccent(lower(nombre)) ILIKE '%cesar%enrique%ramirez%'           OR
  unaccent(lower(nombre)) ILIKE '%juan%oswaldo%hernandez%morales%'  OR
  unaccent(lower(nombre)) ILIKE '%dario%david%rea%gomez%'           OR
  unaccent(lower(nombre)) ILIKE '%mateo%hinojosa%camarillo%'        OR
  unaccent(lower(nombre)) ILIKE '%juan%carlos%garcia%sotelo%'       OR
  unaccent(lower(nombre)) ILIKE '%oscar%santiago%jimenez%leon%'     OR
  unaccent(lower(nombre)) ILIKE '%pedro%de%jesus%gomez%munoz%'      OR
  -- mujeres del FÚTBOL general no incluidas en FÚTBOL FEMENIL
  unaccent(lower(nombre)) ILIKE '%maria%jose%moreno%suarez%'        OR
  unaccent(lower(nombre)) ILIKE '%zoe%rico%valadez%'                OR
  unaccent(lower(nombre)) ILIKE '%grecia%yareli%hernandez%arroche%' OR
  unaccent(lower(nombre)) ILIKE '%sandra%ximena%alvarado%gutierrez%' OR
  unaccent(lower(nombre)) ILIKE '%danna%azucena%munoz%lopez%'       OR
  unaccent(lower(nombre)) ILIKE '%karen%daniela%gutierrez%bernal%'  OR
  unaccent(lower(nombre)) ILIKE '%leah%odette%segoviano%mata%'      OR
  unaccent(lower(nombre)) ILIKE '%vanesa%guadalupe%martinez%rogero%' OR
  unaccent(lower(nombre)) ILIKE '%catzury%yamile%garcia%campos%'    OR
  unaccent(lower(nombre)) ILIKE '%izel%lopez%orozco%'               OR
  unaccent(lower(nombre)) ILIKE '%perla%ramirez%reyna%'             OR
  unaccent(lower(nombre)) ILIKE '%francisco%javier%perez%'          OR
  unaccent(lower(nombre)) ILIKE '%cesar%andre%ros%guzman%'          OR
  unaccent(lower(nombre)) ILIKE '%ramon%alejandro%serrano%mata%'    OR
  unaccent(lower(nombre)) ILIKE '%cecil%octavio%mena%martinez%'     OR
  unaccent(lower(nombre)) ILIKE '%zoel%enrique%martinez%salazar%'   OR
  unaccent(lower(nombre)) ILIKE '%christian%emmanuel%macias%silva%' OR
  unaccent(lower(nombre)) ILIKE '%ricardo%camacho%de%anda%'         OR
  unaccent(lower(nombre)) ILIKE '%zilia%estefanie%ruiz%portillo%'   OR
  unaccent(lower(nombre)) ILIKE '%guadalupe%jade%tovar%tolentino%'  OR
  unaccent(lower(nombre)) ILIKE '%dafne%xiomara%hernandez%plascencia%' OR
  unaccent(lower(nombre)) ILIKE '%ivan%emiliano%ruiz%almanza%'
);

-- ============================================================
-- 3. TOCHO VARONIL — 5 alumnos
-- ============================================================
UPDATE inscripciones
SET grupo_deporte_id = (
  SELECT id FROM grupos WHERE nombre = 'Tocho Varonil' AND tipo = 'deporte' LIMIT 1
)
WHERE NOT COALESCE(exalumno, false)
AND grupo_deporte_id IS NULL
AND (
  unaccent(lower(nombre)) ILIKE '%leonardo%aceves%nazareth%'        OR
  unaccent(lower(nombre)) ILIKE '%angel%kaleb%ornelas%garcia%'      OR
  unaccent(lower(nombre)) ILIKE '%luis%fernando%rangel%cervera%'    OR
  unaccent(lower(nombre)) ILIKE '%intimo%santiago%'
  -- José de Jesús Soto Ramírez ya en Fútbol Varonil
);

-- ============================================================
-- 4. BÁSQUETBOL — 8 alumnos (solo si sin deporte)
-- ============================================================
UPDATE inscripciones
SET grupo_deporte_id = (
  SELECT id FROM grupos WHERE nombre ILIKE '%asquet%' AND tipo = 'deporte' LIMIT 1
)
WHERE NOT COALESCE(exalumno, false)
AND grupo_deporte_id IS NULL
AND (
  unaccent(lower(nombre)) ILIKE '%angel%maximo%ramirez%saldana%'    OR
  unaccent(lower(nombre)) ILIKE '%esau%garrido%'                    OR
  unaccent(lower(nombre)) ILIKE '%zaid%delgado%zuniga%'             OR
  unaccent(lower(nombre)) ILIKE '%christian%emmanuel%macias%silva%' OR
  unaccent(lower(nombre)) ILIKE '%axel%emiliano%ruiz%plascencia%'   OR
  unaccent(lower(nombre)) ILIKE '%mauricio%animo%perez%'            OR
  unaccent(lower(nombre)) ILIKE '%dorian%ramirez%'                  OR
  unaccent(lower(nombre)) ILIKE '%angel%kaleb%ornelas%garcia%'
);

-- ============================================================
-- 5. NATACIÓN — 4 alumnos (solo si sin deporte)
-- ============================================================
UPDATE inscripciones
SET grupo_deporte_id = (
  SELECT id FROM grupos WHERE nombre ILIKE '%nataci%' AND tipo = 'deporte' LIMIT 1
)
WHERE NOT COALESCE(exalumno, false)
AND grupo_deporte_id IS NULL
AND (
  unaccent(lower(nombre)) ILIKE '%angela%renata%moreno%herrera%'    OR
  unaccent(lower(nombre)) ILIKE '%cesar%ramirez%ramirez%'           OR
  unaccent(lower(nombre)) ILIKE '%alma%monserrat%'                  OR
  unaccent(lower(nombre)) ILIKE '%karen%daniela%gutierrez%bernal%'
);

-- ============================================================
-- 6. PORRA — 6 alumnos (solo si sin deporte)
-- ============================================================
UPDATE inscripciones
SET grupo_deporte_id = (
  SELECT id FROM grupos WHERE nombre ILIKE '%porra%' AND tipo = 'deporte' LIMIT 1
)
WHERE NOT COALESCE(exalumno, false)
AND grupo_deporte_id IS NULL
AND (
  unaccent(lower(nombre)) ILIKE '%itzel%lopez%orozco%'              OR
  unaccent(lower(nombre)) ILIKE '%aldee%javier%cabrera%'            OR
  unaccent(lower(nombre)) ILIKE '%fernanda%guadalupe%lemus%garcia%' OR
  unaccent(lower(nombre)) ILIKE '%renata%hernandez%torres%'         OR
  unaccent(lower(nombre)) ILIKE '%diana%karina%romo%tovar%'         OR
  unaccent(lower(nombre)) ILIKE '%lesly%karina%ruiz%cruz%'
);

-- ============================================================
-- 7. VOLEIBOL — 25 alumnos (solo si sin deporte)
-- ============================================================
UPDATE inscripciones
SET grupo_deporte_id = (
  SELECT id FROM grupos WHERE nombre ILIKE '%oleibol%' AND tipo = 'deporte' LIMIT 1
)
WHERE NOT COALESCE(exalumno, false)
AND grupo_deporte_id IS NULL
AND (
  unaccent(lower(nombre)) ILIKE '%dulce%castillo%galloso%'          OR
  unaccent(lower(nombre)) ILIKE '%donna%rocha%lopez%'               OR
  unaccent(lower(nombre)) ILIKE '%samantha%vargas%vargas%'          OR
  unaccent(lower(nombre)) ILIKE '%mayeli%godinez%cierra%'           OR
  unaccent(lower(nombre)) ILIKE '%karol%ixchel%hernandez%muniz%'    OR
  unaccent(lower(nombre)) ILIKE '%natali%ferro%maldonado%'          OR
  unaccent(lower(nombre)) ILIKE '%kimberly%olvera%reyes%'           OR
  unaccent(lower(nombre)) ILIKE '%cesar%avalos%ramirez%'            OR
  unaccent(lower(nombre)) ILIKE '%angela%renata%moreno%herrera%'    OR
  unaccent(lower(nombre)) ILIKE '%moya%rubio%pamela%'               OR
  unaccent(lower(nombre)) ILIKE '%pamela%natalia%moya%'             OR
  unaccent(lower(nombre)) ILIKE '%amadora%castaneda%'               OR
  unaccent(lower(nombre)) ILIKE '%karla%jazmin%posada%borja%'       OR
  unaccent(lower(nombre)) ILIKE '%karla%paulina%bustos%diaz%'       OR
  unaccent(lower(nombre)) ILIKE '%nayeli%cervantes%cardona%'        OR
  unaccent(lower(nombre)) ILIKE '%karol%noemi%guerrero%salinas%'    OR
  unaccent(lower(nombre)) ILIKE '%judith%jatzamany%lopez%ramirez%'  OR
  unaccent(lower(nombre)) ILIKE '%guillermo%alejandro%garcia%tapia%' OR
  unaccent(lower(nombre)) ILIKE '%zoe%delgado%zuniga%'              OR
  unaccent(lower(nombre)) ILIKE '%luis%oviedo%ramirez%moreno%'      OR
  unaccent(lower(nombre)) ILIKE '%mia%naomi%espejel%dominguez%'     OR
  unaccent(lower(nombre)) ILIKE '%diana%karina%romo%tovar%'         OR
  unaccent(lower(nombre)) ILIKE '%lesly%karina%ruiz%cruz%'          OR
  unaccent(lower(nombre)) ILIKE '%kevin%yosef%contreras%'           OR
  unaccent(lower(nombre)) ILIKE '%kevin%yosef%eresquin%'            OR
  unaccent(lower(nombre)) ILIKE '%karla%fernanda%garcia%plascencia%'
);

-- ============================================================
-- VERIFICACIÓN FINAL
-- ============================================================
SELECT g.nombre AS deporte, COUNT(i.folio) AS alumnos
FROM grupos g
LEFT JOIN inscripciones i ON i.grupo_deporte_id = g.id
WHERE g.tipo = 'deporte'
GROUP BY g.nombre
ORDER BY g.nombre;
