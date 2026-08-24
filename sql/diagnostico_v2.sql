-- ============================================================
-- DIAGNÓSTICO v2 — Corre CADA BLOQUE por separado en Supabase
-- ============================================================

-- ── BLOQUE A: ¿Funciona unaccent? ────────────────────────────
-- Corre solo esto primero:
SELECT unaccent('Vázquez') AS prueba_unaccent;


-- ── BLOQUE B: Nombres reales en Fútbol Varonil ahora ─────────
SELECT i.folio, i.nombre
FROM inscripciones i
JOIN grupos g ON g.id = i.grupo_deporte_id
WHERE g.tipo = 'deporte' AND g.nombre = 'Fútbol Varonil';


-- ── BLOQUE C: Buscar 'medina' sin unaccent ───────────────────
SELECT folio, nombre FROM inscripciones
WHERE lower(nombre) LIKE '%medina%'
  AND NOT COALESCE(exalumno, false);


-- ── BLOQUE D: Buscar 'enriquez' o 'enríquez' ────────────────
SELECT folio, nombre FROM inscripciones
WHERE (lower(nombre) LIKE '%enriquez%' OR lower(nombre) LIKE '%enr%quez%')
  AND NOT COALESCE(exalumno, false);


-- ── BLOQUE E: 20 nombres para ver el formato real ────────────
SELECT folio, nombre
FROM inscripciones
WHERE NOT COALESCE(exalumno, false)
ORDER BY nombre
LIMIT 20;
