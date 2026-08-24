-- ============================================================
-- ASIGNACIÓN DE GRUPOS DEPORTIVOS — versión 2 (patrones simples)
-- Usa solo 1-2 palabras clave por alumno para mayor flexibilidad
-- ============================================================
-- PASO 1: Limpiar asignaciones previas del script anterior
UPDATE inscripciones SET grupo_deporte_id = NULL
WHERE grupo_deporte_id IN (
  SELECT id FROM grupos WHERE tipo = 'deporte'
);

-- ─── FÚTBOL VARONIL ──────────────────────────────────────────
UPDATE inscripciones
SET grupo_deporte_id = (
  SELECT id FROM grupos WHERE nombre = 'Fútbol Varonil' AND tipo = 'deporte' LIMIT 1
)
WHERE NOT COALESCE(exalumno, false)
AND (
  nombre ILIKE '%Medina%Vázquez%'          OR nombre ILIKE '%Medina%Vazquez%'         OR
  nombre ILIKE '%Enríquez%Orozco%'         OR nombre ILIKE '%Enriquez%Orozco%'        OR
  nombre ILIKE '%Solórzano%Salazar%'       OR nombre ILIKE '%Solorzano%Salazar%'      OR
  nombre ILIKE '%Ángel%Ríos%Ríos%'        OR nombre ILIKE '%Angel%Rios%Rios%'        OR
  nombre ILIKE '%Valadez%García%Roberto%'  OR nombre ILIKE '%Valadez%Garcia%Roberto%' OR
  nombre ILIKE '%Roberto%Valadez%García%'  OR nombre ILIKE '%Roberto%Valadez%Garcia%' OR
  nombre ILIKE '%Valdivia%Boso%'                                                       OR
  nombre ILIKE '%Sánchez%Ríos%'           OR nombre ILIKE '%Sanchez%Rios%'           OR
  nombre ILIKE '%Rangel%Cervera%'                                                      OR
  nombre ILIKE '%Soto%Ramírez%'           OR nombre ILIKE '%Soto%Ramirez%'           OR
  nombre ILIKE '%Cárdenas%Sandoval%'      OR nombre ILIKE '%Cardenas%Sandoval%'      OR
  nombre ILIKE '%Montalvo%Ortega%'                                                     OR
  nombre ILIKE '%Roberto%Ortiz%'                                                       OR
  nombre ILIKE '%Velázquez%González%'     OR nombre ILIKE '%Velazquez%Gonzalez%'     OR
  nombre ILIKE '%Briseño%Ornelas%'        OR nombre ILIKE '%Briseno%Ornelas%'        OR
  nombre ILIKE '%Benítez%Estudillo%'      OR nombre ILIKE '%Benitez%Estudillo%'      OR
  nombre ILIKE '%González%Ávila%'         OR nombre ILIKE '%Gonzalez%Avila%'         OR
  nombre ILIKE '%Martínez%Ramírez%Ricardo%' OR nombre ILIKE '%Martinez%Ramirez%Ricardo%' OR
  nombre ILIKE '%Guillermo%Lara%'                                                      OR
  nombre ILIKE '%Martínez%Olmos%'         OR nombre ILIKE '%Martinez%Olmos%'         OR
  nombre ILIKE '%Kaleb%Ornelas%'                                                       OR
  nombre ILIKE '%Ochoa%Domínguez%'        OR nombre ILIKE '%Ochoa%Dominguez%'        OR
  nombre ILIKE '%Alonso%Rocha%'                                                        OR
  nombre ILIKE '%Iker%Delgado%'                                                        OR
  nombre ILIKE '%Brayan%Sánchez%'         OR nombre ILIKE '%Brayan%Sanchez%'         OR
  nombre ILIKE '%Guerra%Serrato%'                                                      OR
  nombre ILIKE '%Víctor%Ibarra%'          OR nombre ILIKE '%Victor%Ibarra%'          OR
  nombre ILIKE '%Leonardo%Mercado%'                                                    OR
  nombre ILIKE '%Saúl%Juárez%'            OR nombre ILIKE '%Saul%Juarez%'            OR
  nombre ILIKE '%Barrientos%Cristian%'    OR nombre ILIKE '%Cristian%Barrientos%'    OR
  nombre ILIKE '%Rodríguez%Molina%Joel%'  OR nombre ILIKE '%Rodriguez%Molina%Joel%'  OR
  nombre ILIKE '%Garnica%Hernández%'      OR nombre ILIKE '%Garnica%Hernandez%'      OR
  nombre ILIKE '%Oliva%Castillo%'                                                      OR
  nombre ILIKE '%Frías%Valadez%'          OR nombre ILIKE '%Frias%Valadez%'          OR
  nombre ILIKE '%Gael%Emmanuel%Hernández%' OR nombre ILIKE '%Gael%Emmanuel%Hernandez%' OR
  nombre ILIKE '%Paul%Galván%'            OR nombre ILIKE '%Paul%Galvan%'            OR
  nombre ILIKE '%Flores%Quintero%'                                                     OR
  nombre ILIKE '%Erik%Valdovinos%'                                                     OR
  nombre ILIKE '%Chávez%López%Alexis%'    OR nombre ILIKE '%Chavez%Lopez%Alexis%'    OR
  nombre ILIKE '%Muñoz%Montes%'           OR nombre ILIKE '%Munoz%Montes%'           OR
  nombre ILIKE '%Ángel%Iván%Ayala%'       OR nombre ILIKE '%Angel%Ivan%Ayala%'       OR
  nombre ILIKE '%Forlán%Collazo%'         OR nombre ILIKE '%Forlan%Collazo%'         OR
  nombre ILIKE '%Iván%Ayala%Almanza%'     OR nombre ILIKE '%Ivan%Ayala%Almanza%'     OR
  nombre ILIKE '%Joseph%Morales%'                                                      OR
  nombre ILIKE '%Samuel%Abraham%Rodríguez%' OR nombre ILIKE '%Samuel%Abraham%Rodriguez%' OR
  nombre ILIKE '%Leonardo%Aceves%'                                                     OR
  nombre ILIKE '%Gómez%Vargas%Juan%'      OR nombre ILIKE '%Gomez%Vargas%Juan%'      OR
  nombre ILIKE '%Luis%Antonio%Pérez%'     OR nombre ILIKE '%Luis%Antonio%Perez%'     OR
  nombre ILIKE '%César%Enrique%Ramírez%'  OR nombre ILIKE '%Cesar%Enrique%Ramirez%'  OR
  nombre ILIKE '%Santiago%Animo%'                                                      OR
  nombre ILIKE '%Hernández%Morales%Juan%Oswaldo%' OR nombre ILIKE '%Hernandez%Morales%Juan%Oswaldo%' OR
  nombre ILIKE '%Rea%Gómez%'              OR nombre ILIKE '%Rea%Gomez%'              OR
  nombre ILIKE '%Hinojosa%Camarillo%'                                                  OR
  nombre ILIKE '%García%Sotelo%'          OR nombre ILIKE '%Garcia%Sotelo%'          OR
  nombre ILIKE '%Jiménez%León%'           OR nombre ILIKE '%Jimenez%Leon%'           OR
  nombre ILIKE '%Pedro%Gómez%Muñoz%'      OR nombre ILIKE '%Pedro%Gomez%Munoz%'      OR
  nombre ILIKE '%Francisco%Javier%Pérez%' OR nombre ILIKE '%Francisco%Javier%Perez%' OR
  nombre ILIKE '%Ros%Guzmán%'             OR nombre ILIKE '%Ros%Guzman%'             OR
  nombre ILIKE '%Serrano%Mata%'                                                        OR
  nombre ILIKE '%Cecil%Mena%'                                                          OR
  nombre ILIKE '%Zoel%Martínez%'          OR nombre ILIKE '%Zoel%Martinez%'          OR
  nombre ILIKE '%Macías%Silva%'           OR nombre ILIKE '%Macias%Silva%'           OR
  nombre ILIKE '%Camacho%Anda%'                                                        OR
  nombre ILIKE '%Iván%Ruiz%Almanza%'      OR nombre ILIKE '%Ivan%Ruiz%Almanza%'      OR
  nombre ILIKE '%Ávalos%Ramírez%'         OR nombre ILIKE '%Avalos%Ramirez%'         OR
  nombre ILIKE '%Kevin%Yosef%'                                                         OR
  nombre ILIKE '%Aguilera%Villegas%'
);

-- ─── FÚTBOL FEMENIL ──────────────────────────────────────────
UPDATE inscripciones
SET grupo_deporte_id = (
  SELECT id FROM grupos WHERE nombre = 'Fútbol Femenil' AND tipo = 'deporte' LIMIT 1
)
WHERE NOT COALESCE(exalumno, false)
AND (
  nombre ILIKE '%Moreno%Suárez%'           OR nombre ILIKE '%Moreno%Suarez%'          OR
  nombre ILIKE '%Zoé%Rico%'               OR nombre ILIKE '%Zoe%Rico%'               OR
  nombre ILIKE '%Grecia%Hernández%'        OR nombre ILIKE '%Grecia%Hernandez%'       OR
  nombre ILIKE '%Sandra%Alvarado%'                                                     OR
  nombre ILIKE '%Danna%Muñoz%'             OR nombre ILIKE '%Danna%Munoz%'            OR
  nombre ILIKE '%Karen%Gutiérrez%Bernal%'  OR nombre ILIKE '%Karen%Gutierrez%Bernal%' OR
  nombre ILIKE '%Segoviano%Mata%'                                                      OR
  nombre ILIKE '%Vanesa%Martínez%Rogero%'  OR nombre ILIKE '%Vanesa%Martinez%Rogero%' OR
  nombre ILIKE '%Catzury%'                                                             OR
  nombre ILIKE '%Izel%López%'             OR nombre ILIKE '%Izel%Lopez%'             OR
  nombre ILIKE '%Itzel%López%'            OR nombre ILIKE '%Itzel%Lopez%'            OR
  nombre ILIKE '%Pamela%Natalia%Moya%'                                                 OR
  nombre ILIKE '%Moya%Rubio%Pamela%'                                                   OR
  nombre ILIKE '%Perla%Ramírez%Reyna%'    OR nombre ILIKE '%Perla%Ramirez%Reyna%'    OR
  nombre ILIKE '%Jacqueline%Rocha%'                                                    OR
  nombre ILIKE '%Zilia%Ruiz%Portillo%'                                                 OR
  nombre ILIKE '%Guadalupe%Jade%Tovar%'                                                OR
  nombre ILIKE '%Dafne%Hernández%'         OR nombre ILIKE '%Dafne%Hernandez%'        OR
  nombre ILIKE '%Dulce%Alitz%'                                                         OR
  nombre ILIKE '%Donna%Rocha%'                                                         OR
  nombre ILIKE '%Samantha%Vargas%'                                                     OR
  nombre ILIKE '%Mayeli%Godínez%'          OR nombre ILIKE '%Mayeli%Godinez%'         OR
  nombre ILIKE '%Karol%Ixchel%'                                                        OR
  nombre ILIKE '%Natali%Ferro%'                                                        OR
  nombre ILIKE '%Kimberly%Olvera%'                                                     OR
  nombre ILIKE '%Ángela%Renata%'           OR nombre ILIKE '%Angela%Renata%'          OR
  nombre ILIKE '%Amadora%Castañeda%'       OR nombre ILIKE '%Amadora%Castaneda%'      OR
  nombre ILIKE '%Diana%Romo%Tovar%'                                                    OR
  nombre ILIKE '%Lesly%Ruiz%Cruz%'                                                     OR
  nombre ILIKE '%Karol%Sandoval%Orozco%'                                               OR
  nombre ILIKE '%Karla%García%Plascencia%' OR nombre ILIKE '%Karla%Garcia%Plascencia%'
);

-- ─── BÁSQUETBOL (solo si sin deporte) ────────────────────────
UPDATE inscripciones
SET grupo_deporte_id = (
  SELECT id FROM grupos WHERE nombre ILIKE '%asquet%' AND tipo = 'deporte' LIMIT 1
)
WHERE NOT COALESCE(exalumno, false)
AND grupo_deporte_id IS NULL
AND (
  nombre ILIKE '%Ángel%Máximo%Ramírez%'   OR nombre ILIKE '%Angel%Maximo%Ramirez%'   OR
  nombre ILIKE '%Esau%Garrido%'                                                        OR
  nombre ILIKE '%Zaid%Delgado%'                                                        OR
  nombre ILIKE '%Axel%Emiliano%Ruiz%Plascencia%'                                      OR
  nombre ILIKE '%Mauricio%Animo%'                                                      OR
  nombre ILIKE '%Dorian%Ramírez%'          OR nombre ILIKE '%Dorian%Ramirez%'
);

-- ─── NATACIÓN (solo si sin deporte) ──────────────────────────
UPDATE inscripciones
SET grupo_deporte_id = (
  SELECT id FROM grupos WHERE nombre ILIKE '%nataci%' AND tipo = 'deporte' LIMIT 1
)
WHERE NOT COALESCE(exalumno, false)
AND grupo_deporte_id IS NULL
AND (
  nombre ILIKE '%Alma%Monserrat%'          OR
  nombre ILIKE '%César%Ramírez%Ramírez%'   OR nombre ILIKE '%Cesar%Ramirez%Ramirez%'
);

-- ─── PORRA (solo si sin deporte) ─────────────────────────────
UPDATE inscripciones
SET grupo_deporte_id = (
  SELECT id FROM grupos WHERE nombre ILIKE '%porra%' AND tipo = 'deporte' LIMIT 1
)
WHERE NOT COALESCE(exalumno, false)
AND grupo_deporte_id IS NULL
AND (
  nombre ILIKE '%Aldee%Javier%'                                                        OR
  nombre ILIKE '%Lemus%García%'            OR nombre ILIKE '%Lemus%Garcia%'           OR
  nombre ILIKE '%Renata%Hernández%Torres%' OR nombre ILIKE '%Renata%Hernandez%Torres%'
);

-- ─── VERIFICACIÓN ────────────────────────────────────────────
SELECT g.nombre AS deporte, COUNT(i.folio) AS alumnos
FROM grupos g
LEFT JOIN inscripciones i ON i.grupo_deporte_id = g.id
WHERE g.tipo = 'deporte'
GROUP BY g.nombre
ORDER BY g.nombre;
