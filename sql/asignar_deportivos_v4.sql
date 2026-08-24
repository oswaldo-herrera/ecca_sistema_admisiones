-- ============================================================
-- ASIGNACIÓN GRUPOS DEPORTIVOS — v4 (DEFINITIVO)
-- BD guarda: "Apellido1 Apellido2 Nombre(s)"
-- Todos los patrones siguen ese orden
-- ============================================================

-- PASO 0: Crear Tocho Varonil si no existe
INSERT INTO grupos (nombre, tipo, deporte)
SELECT 'Tocho Varonil', 'deporte', 'Tocho'
WHERE NOT EXISTS (
  SELECT 1 FROM grupos WHERE nombre = 'Tocho Varonil' AND tipo = 'deporte'
);

-- PASO 1: Limpiar TODAS las asignaciones deportivas
UPDATE inscripciones
SET grupo_deporte_id = NULL
WHERE grupo_deporte_id IN (SELECT id FROM grupos WHERE tipo = 'deporte');

-- ============================================================
-- 1. FÚTBOL FEMENIL — Sin IS NULL (máxima prioridad)
-- ============================================================
UPDATE inscripciones
SET grupo_deporte_id = (
  SELECT id FROM grupos WHERE nombre = 'Fútbol Femenil' AND tipo = 'deporte' LIMIT 1
)
WHERE NOT COALESCE(exalumno, false)
AND (
  unaccent(lower(nombre)) ILIKE '%castillo%galloso%'           OR  -- Dulce Castillo Galloso
  unaccent(lower(nombre)) ILIKE '%rocha%lopez%donna%'          OR  -- Donna Rocha López
  unaccent(lower(nombre)) ILIKE '%vargas%vargas%samantha%'     OR  -- Samantha Vargas Vargas
  unaccent(lower(nombre)) ILIKE '%godinez%mayeli%'             OR  -- Mayeli Godínez
  unaccent(lower(nombre)) ILIKE '%hernandez%muniz%karol%'      OR  -- Karol Ixchel Hernández Muñiz
  unaccent(lower(nombre)) ILIKE '%ferro%maldonado%'            OR  -- Natali Ferro Maldonado
  unaccent(lower(nombre)) ILIKE '%olvera%reyes%'               OR  -- Kimberly Olvera Reyes
  unaccent(lower(nombre)) ILIKE '%moreno%herrera%angela%'      OR  -- Ángela Renata Moreno Herrera
  unaccent(lower(nombre)) ILIKE '%moya%rubio%'                 OR  -- Pamela Natalia Moya Rubio
  unaccent(lower(nombre)) ILIKE '%castaneda%amadora%'          OR  -- Amadora Castañeda
  unaccent(lower(nombre)) ILIKE '%bustos%karla%'               OR  -- Karla Paulina Bustos
  unaccent(lower(nombre)) ILIKE '%cervantes%cardona%'          OR  -- Nayeli Cervantes Cardona
  unaccent(lower(nombre)) ILIKE '%guerrero%salinas%'           OR  -- Karol Noemí Guerrero Salinas
  unaccent(lower(nombre)) ILIKE '%lopez%ramirez%judith%'       OR  -- Judith Jatzamany López Ramírez
  unaccent(lower(nombre)) ILIKE '%espejel%mia%'                OR  -- Mia Naomi Espejel
  unaccent(lower(nombre)) ILIKE '%romo%tovar%'                 OR  -- Diana Karina Romo Tovar
  unaccent(lower(nombre)) ILIKE '%ruiz%cruz%lesly%'            OR  -- Lesly Karina Ruiz Cruz
  unaccent(lower(nombre)) ILIKE '%sandoval%orozco%karol%'      OR  -- Karol Sandoval Orozco
  unaccent(lower(nombre)) ILIKE '%garcia%plascencia%karla%'       -- Karla Fernanda García Plascencia
);

-- ============================================================
-- 2. FÚTBOL VARONIL — IS NULL (no sobreescribe Femenil)
-- ============================================================
UPDATE inscripciones
SET grupo_deporte_id = (
  SELECT id FROM grupos WHERE nombre = 'Fútbol Varonil' AND tipo = 'deporte' LIMIT 1
)
WHERE NOT COALESCE(exalumno, false)
AND grupo_deporte_id IS NULL
AND (
  unaccent(lower(nombre)) ILIKE '%medina%vazquez%sergio%'       OR  -- Sergio Medina Vázquez
  unaccent(lower(nombre)) ILIKE '%enriquez%orozco%alexis%'      OR  -- Alexis Enríquez Orozco
  unaccent(lower(nombre)) ILIKE '%solorzano%salazar%'           OR  -- Luis Fernando Solórzano Salazar
  unaccent(lower(nombre)) ILIKE '%rios%rios%angel%'             OR  -- Ángel Jesús Ríos Ríos
  unaccent(lower(nombre)) ILIKE '%valadez%garcia%roberto%'      OR  -- Roberto Valadez García ✓
  unaccent(lower(nombre)) ILIKE '%valdivia%boso%'               OR  -- César Axel Valdivia Boso ✓
  unaccent(lower(nombre)) ILIKE '%sanchez%rios%axel%'           OR  -- Axel Alejandro Sánchez Ríos
  unaccent(lower(nombre)) ILIKE '%rangel%cervera%'              OR  -- Luis Fernando Rangel Cervera
  unaccent(lower(nombre)) ILIKE '%soto%ramirez%jose%'           OR  -- José de Jesús Soto Ramírez
  unaccent(lower(nombre)) ILIKE '%cardenas%sandoval%'           OR  -- Cárdenas Sandoval José ✓
  unaccent(lower(nombre)) ILIKE '%montalvo%oswaldo%'            OR  -- Oswaldo Edilberto Montalvo
  unaccent(lower(nombre)) ILIKE '%ortiz%yeezer%'                OR  -- Roberto Ortiz Yeezer
  unaccent(lower(nombre)) ILIKE '%velazquez%gonzalez%francisco%' OR  -- Francisco Velázquez González
  unaccent(lower(nombre)) ILIKE '%briseno%ornelas%'             OR  -- Roberto Briseño Ornelas ✓
  unaccent(lower(nombre)) ILIKE '%aguilera%villegas%'           OR  -- Aguilera Villegas Casten ✓
  unaccent(lower(nombre)) ILIKE '%benitez%estudillo%'           OR  -- Benítez Estudillo Ricardo ✓
  unaccent(lower(nombre)) ILIKE '%martinez%ramirez%ricardo%'    OR  -- Ricardo Fabricio Martínez Ramírez
  unaccent(lower(nombre)) ILIKE '%lara%cortez%'                 OR  -- Guillermo Javier Lara Cortez
  unaccent(lower(nombre)) ILIKE '%martinez%olmos%'              OR  -- Martínez Olmos ✓
  unaccent(lower(nombre)) ILIKE '%ochoa%dominguez%angel%'       OR  -- Ángel Ochoa Domínguez
  unaccent(lower(nombre)) ILIKE '%alonso%rocha%'                OR  -- Miguel Alejandro Alonso Rocha
  unaccent(lower(nombre)) ILIKE '%delgado%iker%'                OR  -- Iker Adrián Delgado
  unaccent(lower(nombre)) ILIKE '%sanchez%hidalgo%'             OR  -- Brayan Sánchez Hidalgo
  unaccent(lower(nombre)) ILIKE '%guerra%serrato%'              OR  -- Ángel Santiago Guerra Serrato
  unaccent(lower(nombre)) ILIKE '%juarez%saul%'                 OR  -- Saúl Juárez
  unaccent(lower(nombre)) ILIKE '%barrientos%cristian%'         OR  -- Cristian Barrientos
  unaccent(lower(nombre)) ILIKE '%rodriguez%molina%jose%'       OR  -- José Joel Rodríguez Molina
  unaccent(lower(nombre)) ILIKE '%garnica%hernandez%'           OR  -- Luis Emiliano Garnica Hernández
  unaccent(lower(nombre)) ILIKE '%oliva%castillo%edwin%'        OR  -- Edwin Oliva Castillo
  unaccent(lower(nombre)) ILIKE '%frias%valadez%'               OR  -- Adán Alexander Frías Valadez
  unaccent(lower(nombre)) ILIKE '%hernandez%gael%'              OR  -- Gael Emmanuel Hernández
  unaccent(lower(nombre)) ILIKE '%galvan%ruiz%paul%'            OR  -- Paul Galván Ruiz
  unaccent(lower(nombre)) ILIKE '%flores%quintero%'             OR  -- Gael Ariel Flores Quintero
  unaccent(lower(nombre)) ILIKE '%valdovinos%erik%'             OR  -- Erik Said Valdovinos
  unaccent(lower(nombre)) ILIKE '%chavez%lopez%alexis%'         OR  -- Alexis Maxim Chávez López
  unaccent(lower(nombre)) ILIKE '%munoz%montes%'                OR  -- Juan Oswaldo Muñoz Montes
  unaccent(lower(nombre)) ILIKE '%ayala%flores%angel%'          OR  -- Ángel Iván Ayala Flores
  unaccent(lower(nombre)) ILIKE '%collazo%luna%'                OR  -- Forlán Collazo Luna
  unaccent(lower(nombre)) ILIKE '%ayala%almanza%ivan%'          OR  -- Iván Emiliano Ayala Almanza
  unaccent(lower(nombre)) ILIKE '%morales%orozco%joseph%'       OR  -- Joseph Efraín Morales Orozco
  unaccent(lower(nombre)) ILIKE '%gomez%vargas%juan%'           OR  -- Juan Pablo Gómez Vargas
  unaccent(lower(nombre)) ILIKE '%ramirez%cesar%enrique%'       OR  -- César Enrique Ramírez
  unaccent(lower(nombre)) ILIKE '%hernandez%morales%juan%'      OR  -- Juan Oswaldo Hernández Morales
  unaccent(lower(nombre)) ILIKE '%rea%gomez%'                   OR  -- Darío David Rea Gómez
  unaccent(lower(nombre)) ILIKE '%hinojosa%camarillo%'          OR  -- Mateo Hinojosa Camarillo
  unaccent(lower(nombre)) ILIKE '%garcia%sotelo%'               OR  -- Juan Carlos García Sotelo
  unaccent(lower(nombre)) ILIKE '%jimenez%leon%'                OR  -- Óscar Jiménez León
  unaccent(lower(nombre)) ILIKE '%gomez%munoz%pedro%'           OR  -- Pedro de Jesús Gómez Muñoz
  -- Mujeres del FÚTBOL general (no en Femenil específico)
  unaccent(lower(nombre)) ILIKE '%moreno%suarez%maria%'         OR  -- María José Moreno Suárez
  unaccent(lower(nombre)) ILIKE '%rico%valadez%'                OR  -- Zoé Rico Valadez
  unaccent(lower(nombre)) ILIKE '%hernandez%arroche%'           OR  -- Grecia Hernández Arroche
  unaccent(lower(nombre)) ILIKE '%alvarado%gutierrez%'          OR  -- Sandra Alvarado Gutiérrez
  unaccent(lower(nombre)) ILIKE '%munoz%lopez%danna%'           OR  -- Danna Muñoz López
  unaccent(lower(nombre)) ILIKE '%gutierrez%bernal%'            OR  -- Karen Gutiérrez Bernal
  unaccent(lower(nombre)) ILIKE '%segoviano%mata%'              OR  -- Leah Segoviano Mata
  unaccent(lower(nombre)) ILIKE '%martinez%rogero%'             OR  -- Vanesa Martínez Rogero
  unaccent(lower(nombre)) ILIKE '%garcia%campos%catzury%'       OR  -- Catzury García Campos
  unaccent(lower(nombre)) ILIKE '%lopez%orozco%izel%'           OR  -- Izel López Orozco
  unaccent(lower(nombre)) ILIKE '%ramirez%reyna%'               OR  -- Perla Ramírez Reyna
  unaccent(lower(nombre)) ILIKE '%perez%francisco%javier%'      OR  -- Francisco Javier Pérez
  unaccent(lower(nombre)) ILIKE '%ros%guzman%'                  OR  -- César André Ros Guzmán
  unaccent(lower(nombre)) ILIKE '%serrano%mata%'                OR  -- Ramón Serrano Mata
  unaccent(lower(nombre)) ILIKE '%mena%martinez%'               OR  -- Cecil Mena Martínez
  unaccent(lower(nombre)) ILIKE '%martinez%salazar%zoel%'       OR  -- Zoel Martínez Salazar
  unaccent(lower(nombre)) ILIKE '%macias%silva%'                OR  -- Christian Macías Silva
  unaccent(lower(nombre)) ILIKE '%camacho%anda%'                OR  -- Ricardo Camacho de Anda
  unaccent(lower(nombre)) ILIKE '%ruiz%portillo%'               OR  -- Zilia Ruiz Portillo
  unaccent(lower(nombre)) ILIKE '%tovar%tolentino%'             OR  -- Guadalupe Tovar Tolentino
  unaccent(lower(nombre)) ILIKE '%hernandez%plascencia%'        OR  -- Dafne Hernández Plascencia
  unaccent(lower(nombre)) ILIKE '%ruiz%almanza%ivan%'              -- Iván Ruiz Almanza
);

-- ============================================================
-- 3. TOCHO VARONIL
-- ============================================================
UPDATE inscripciones
SET grupo_deporte_id = (
  SELECT id FROM grupos WHERE nombre = 'Tocho Varonil' AND tipo = 'deporte' LIMIT 1
)
WHERE NOT COALESCE(exalumno, false)
AND grupo_deporte_id IS NULL
AND (
  unaccent(lower(nombre)) ILIKE '%aceves%nazareth%'              OR  -- Leonardo Aceves Nazareth
  unaccent(lower(nombre)) ILIKE '%ornelas%garcia%angel%'         OR  -- Ángel Kaleb Ornelas García
  unaccent(lower(nombre)) ILIKE '%intimo%santiago%'                  -- Íntimo Santiago
);

-- ============================================================
-- 4. BÁSQUETBOL
-- ============================================================
UPDATE inscripciones
SET grupo_deporte_id = (
  SELECT id FROM grupos WHERE nombre ILIKE '%asquet%' AND tipo = 'deporte' LIMIT 1
)
WHERE NOT COALESCE(exalumno, false)
AND grupo_deporte_id IS NULL
AND (
  unaccent(lower(nombre)) ILIKE '%ramirez%saldana%'              OR  -- Ángel Máximo Ramírez Saldaña
  unaccent(lower(nombre)) ILIKE '%garrido%esau%'                 OR  -- Esaú Garrido
  unaccent(lower(nombre)) ILIKE '%delgado%zuniga%zaid%'          OR  -- Zaid Delgado Zúñiga
  unaccent(lower(nombre)) ILIKE '%macias%silva%'                 OR  -- Christian Macías Silva
  unaccent(lower(nombre)) ILIKE '%ruiz%plascencia%'              OR  -- Axel Emiliano Ruiz Plascencia
  unaccent(lower(nombre)) ILIKE '%animo%perez%'                  OR  -- Mauricio Ánimo Pérez
  unaccent(lower(nombre)) ILIKE '%ramirez%dorian%'               OR  -- Dorian Ramírez
  unaccent(lower(nombre)) ILIKE '%ornelas%garcia%angel%'             -- Ángel Kaleb Ornelas García
);

-- ============================================================
-- 5. NATACIÓN
-- ============================================================
UPDATE inscripciones
SET grupo_deporte_id = (
  SELECT id FROM grupos WHERE nombre ILIKE '%nataci%' AND tipo = 'deporte' LIMIT 1
)
WHERE NOT COALESCE(exalumno, false)
AND grupo_deporte_id IS NULL
AND (
  unaccent(lower(nombre)) ILIKE '%ramirez%ramirez%cesar%'        OR  -- César Ramírez Ramírez
  unaccent(lower(nombre)) ILIKE '%alma%monserrat%'               OR  -- Alma Monserrat
  unaccent(lower(nombre)) ILIKE '%moreno%herrera%angela%'        OR  -- Ángela Renata (si no quedó en Femenil)
  unaccent(lower(nombre)) ILIKE '%gutierrez%bernal%'                 -- Karen Gutiérrez (si no quedó en Varonil)
);

-- ============================================================
-- 6. PORRA
-- ============================================================
UPDATE inscripciones
SET grupo_deporte_id = (
  SELECT id FROM grupos WHERE nombre ILIKE '%porra%' AND tipo = 'deporte' LIMIT 1
)
WHERE NOT COALESCE(exalumno, false)
AND grupo_deporte_id IS NULL
AND (
  unaccent(lower(nombre)) ILIKE '%cabrera%aldee%'                OR  -- Aldee Javier Cabrera
  unaccent(lower(nombre)) ILIKE '%lemus%garcia%fernanda%'        OR  -- Fernanda Lemus García
  unaccent(lower(nombre)) ILIKE '%hernandez%torres%renata%'      OR  -- Renata Hernández Torres
  unaccent(lower(nombre)) ILIKE '%romo%tovar%'                   OR  -- Diana Karina Romo Tovar (si no en Femenil)
  unaccent(lower(nombre)) ILIKE '%ruiz%cruz%lesly%'              OR  -- Lesly Karina Ruiz Cruz (si no en Femenil)
  unaccent(lower(nombre)) ILIKE '%lopez%orozco%itzel%'               -- Itzel López Orozco
);

-- ============================================================
-- 7. VOLEIBOL
-- ============================================================
UPDATE inscripciones
SET grupo_deporte_id = (
  SELECT id FROM grupos WHERE nombre ILIKE '%oleibol%' AND tipo = 'deporte' LIMIT 1
)
WHERE NOT COALESCE(exalumno, false)
AND grupo_deporte_id IS NULL
AND (
  -- Ya en Femenil (IS NULL previene sobreescritura, pero se listan por referencia)
  unaccent(lower(nombre)) ILIKE '%castillo%galloso%'             OR
  unaccent(lower(nombre)) ILIKE '%rocha%lopez%donna%'            OR
  unaccent(lower(nombre)) ILIKE '%vargas%vargas%samantha%'       OR
  unaccent(lower(nombre)) ILIKE '%godinez%mayeli%'               OR
  unaccent(lower(nombre)) ILIKE '%hernandez%muniz%karol%'        OR
  unaccent(lower(nombre)) ILIKE '%ferro%maldonado%'              OR
  unaccent(lower(nombre)) ILIKE '%olvera%reyes%'                 OR
  unaccent(lower(nombre)) ILIKE '%moya%rubio%'                   OR
  unaccent(lower(nombre)) ILIKE '%castaneda%amadora%'            OR
  unaccent(lower(nombre)) ILIKE '%bustos%karla%'                 OR
  unaccent(lower(nombre)) ILIKE '%cervantes%cardona%'            OR
  unaccent(lower(nombre)) ILIKE '%guerrero%salinas%'             OR
  unaccent(lower(nombre)) ILIKE '%lopez%ramirez%judith%'         OR
  unaccent(lower(nombre)) ILIKE '%espejel%mia%'                  OR
  unaccent(lower(nombre)) ILIKE '%romo%tovar%'                   OR
  unaccent(lower(nombre)) ILIKE '%ruiz%cruz%lesly%'              OR
  unaccent(lower(nombre)) ILIKE '%garcia%plascencia%karla%'      OR
  -- Exclusivos de Voleibol (esos SÍ quedarán asignados aquí)
  unaccent(lower(nombre)) ILIKE '%avalos%ramirez%cesar%'         OR  -- César Ávalos Ramírez
  unaccent(lower(nombre)) ILIKE '%posada%borja%'                 OR  -- Karla Jazmín Posada Borja
  unaccent(lower(nombre)) ILIKE '%garcia%tapia%'                 OR  -- Guillermo García Tapia
  unaccent(lower(nombre)) ILIKE '%delgado%zuniga%zoe%'           OR  -- Zoé Delgado Zúñiga
  unaccent(lower(nombre)) ILIKE '%oviedo%ramirez%'               OR  -- Luis Oviedo Ramírez
  unaccent(lower(nombre)) ILIKE '%contreras%kevin%'              OR  -- Kevin Yosef Contreras
  unaccent(lower(nombre)) ILIKE '%eresquin%kevin%'                   -- Kevin Yosef Eresquín
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
