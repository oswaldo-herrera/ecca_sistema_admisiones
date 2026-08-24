-- ============================================================
-- BUSCAR GRUPO ACADÉMICO DE ALUMNOS QUE APARECEN SIN GRUPO
-- EN LAS LISTAS DEPORTIVAS
-- Ejecuta esto en Supabase para ver a qué grupo pertenecen
-- ============================================================

SELECT
  i.folio,
  i.nombre,
  COALESCE(g.nombre, '— Sin grupo académico —') AS grupo_academico
FROM inscripciones i
LEFT JOIN grupos g ON g.id = i.grupo_id AND g.tipo != 'deporte'
WHERE NOT COALESCE(i.exalumno, false)
AND (
  -- ── FÚTBOL FEMENIL sin grupo ──────────────────────────
  i.nombre ILIKE '%Dulce%Castillo%Galloso%'          OR
  i.nombre ILIKE '%Donna%Rocha%López%'               OR i.nombre ILIKE '%Donna%Rocha%Lopez%' OR
  i.nombre ILIKE '%Samantha%Vargas%Vargas%'          OR
  i.nombre ILIKE '%Mayeli%Godínez%'                  OR i.nombre ILIKE '%Mayeli%Godinez%'    OR
  i.nombre ILIKE '%Karol%Ixchel%Hernández%'          OR i.nombre ILIKE '%Karol%Ixchel%Hernandez%' OR
  i.nombre ILIKE '%Natali%Ferro%Maldonado%'          OR
  i.nombre ILIKE '%Kimberly%Olvera%Reyes%'           OR
  i.nombre ILIKE '%Amadora%Castañeda%'               OR i.nombre ILIKE '%Amadora%Castaneda%' OR
  i.nombre ILIKE '%Karla%Paulina%Bustos%'            OR
  i.nombre ILIKE '%Nayeli%Cervantes%Cardona%'        OR
  i.nombre ILIKE '%Karol%Sandoval%Orozco%'           OR
  -- ── PORRA sin grupo ──────────────────────────────────
  i.nombre ILIKE '%Itzel%López%Orozco%'              OR i.nombre ILIKE '%Itzel%Lopez%Orozco%' OR
  i.nombre ILIKE '%Aldee%Javier%Cabrera%'            OR
  i.nombre ILIKE '%Fernanda%Lemus%García%'           OR i.nombre ILIKE '%Fernanda%Lemus%Garcia%' OR
  i.nombre ILIKE '%Renata%Hernández%Torres%'         OR i.nombre ILIKE '%Renata%Hernandez%Torres%' OR
  -- ── VOLEIBOL con grupo incompleto (A / B / C / D) ───
  i.nombre ILIKE '%Karla%Jazmín%Posada%'             OR i.nombre ILIKE '%Karla%Jazmin%Posada%' OR
  i.nombre ILIKE '%Guillermo%Alejandro%García%Tapia%' OR i.nombre ILIKE '%Guillermo%Alejandro%Garcia%Tapia%' OR
  i.nombre ILIKE '%Zoé%Delgado%Zúñiga%'             OR i.nombre ILIKE '%Zoe%Delgado%Zuniga%' OR
  i.nombre ILIKE '%Luis%Oviedo%Ramírez%'             OR i.nombre ILIKE '%Luis%Oviedo%Ramirez%' OR
  i.nombre ILIKE '%Kevin%Yosef%Contreras%'           OR i.nombre ILIKE '%Kevin%Yosef%Eresquin%'
)
ORDER BY grupo_academico, i.nombre;
