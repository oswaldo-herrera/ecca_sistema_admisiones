-- ============================================================
-- DIAGNÓSTICO: Ver alumnos sin grupo deportivo asignado
-- Corre esto primero para ver qué nombres están en la BD
-- ============================================================

-- 1. Alumnos SIN deporte asignado (activos)
SELECT folio, nombre
FROM inscripciones
WHERE NOT COALESCE(exalumno, false)
  AND grupo_deporte_id IS NULL
ORDER BY nombre
LIMIT 200;

-- ============================================================
-- 2. Buscar un alumno específico por apellido (prueba de coincidencia)
--    Cambia 'Medina' por el apellido que quieras buscar
-- ============================================================
-- SELECT folio, nombre FROM inscripciones
-- WHERE unaccent(lower(nombre)) ILIKE unaccent(lower('%Medina%'))
-- LIMIT 10;

-- ============================================================
-- 3. Ver cuántos quedaron asignados por deporte
-- ============================================================
-- SELECT g.nombre AS deporte, COUNT(i.folio) AS alumnos
-- FROM grupos g
-- LEFT JOIN inscripciones i ON i.grupo_deporte_id = g.id
-- WHERE g.tipo = 'deporte'
-- GROUP BY g.nombre ORDER BY g.nombre;
