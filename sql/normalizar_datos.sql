-- ============================================================
-- ECCA — Normalizar datos existentes
-- Convierte textos a MAYUSCULAS sin acentos
-- Requiere extension unaccent (ya habilitada en este proyecto)
-- Ejecutar UNA VEZ en Supabase SQL Editor
-- ============================================================

-- ── 1. Inscripciones ──────────────────────────────────────────
UPDATE inscripciones SET
  nombre        = upper(unaccent(nombre))       WHERE nombre        IS NOT NULL AND nombre        <> upper(unaccent(nombre));
UPDATE inscripciones SET
  curp          = upper(curp)                   WHERE curp          IS NOT NULL AND curp          <> upper(curp);
UPDATE inscripciones SET
  escuela       = upper(unaccent(escuela))      WHERE escuela       IS NOT NULL AND escuela       <> upper(unaccent(escuela));
UPDATE inscripciones SET
  p_nombre      = upper(unaccent(p_nombre))     WHERE p_nombre      IS NOT NULL AND p_nombre      <> upper(unaccent(p_nombre));
UPDATE inscripciones SET
  p_ocup        = upper(unaccent(p_ocup))       WHERE p_ocup        IS NOT NULL AND p_ocup        <> upper(unaccent(p_ocup));
UPDATE inscripciones SET
  deporte       = upper(unaccent(deporte))      WHERE deporte       IS NOT NULL AND deporte       <> upper(unaccent(deporte));
UPDATE inscripciones SET
  objetivo      = upper(unaccent(objetivo))     WHERE objetivo      IS NOT NULL AND objetivo      <> upper(unaccent(objetivo));
UPDATE inscripciones SET
  referido_por  = upper(unaccent(referido_por)) WHERE referido_por  IS NOT NULL AND referido_por  <> upper(unaccent(referido_por));
UPDATE inscripciones SET
  concepto      = upper(unaccent(concepto))     WHERE concepto      IS NOT NULL AND concepto      <> upper(unaccent(concepto));
UPDATE inscripciones SET
  recibio       = upper(unaccent(recibio))      WHERE recibio       IS NOT NULL AND recibio       <> upper(unaccent(recibio));
UPDATE inscripciones SET
  doc_acta_obs  = upper(unaccent(doc_acta_obs)) WHERE doc_acta_obs  IS NOT NULL AND doc_acta_obs  <> upper(unaccent(doc_acta_obs));
UPDATE inscripciones SET
  doc_curp_obs  = upper(unaccent(doc_curp_obs)) WHERE doc_curp_obs  IS NOT NULL AND doc_curp_obs  <> upper(unaccent(doc_curp_obs));
UPDATE inscripciones SET
  doc_cert_obs  = upper(unaccent(doc_cert_obs)) WHERE doc_cert_obs  IS NOT NULL AND doc_cert_obs  <> upper(unaccent(doc_cert_obs));
UPDATE inscripciones SET
  doc_fotos_obs = upper(unaccent(doc_fotos_obs)) WHERE doc_fotos_obs IS NOT NULL AND doc_fotos_obs <> upper(unaccent(doc_fotos_obs));
UPDATE inscripciones SET
  doc_otro_obs  = upper(unaccent(doc_otro_obs)) WHERE doc_otro_obs  IS NOT NULL AND doc_otro_obs  <> upper(unaccent(doc_otro_obs));

-- ── 2. Maestros ───────────────────────────────────────────────
UPDATE maestros SET
  nombre       = upper(unaccent(nombre))       WHERE nombre       IS NOT NULL AND nombre       <> upper(unaccent(nombre));
UPDATE maestros SET
  especialidad = upper(unaccent(especialidad)) WHERE especialidad IS NOT NULL AND especialidad <> upper(unaccent(especialidad));

-- ── 3. Materias ───────────────────────────────────────────────
UPDATE materias SET
  nombre = upper(unaccent(nombre)) WHERE nombre IS NOT NULL AND nombre <> upper(unaccent(nombre));
UPDATE materias SET
  clave  = upper(unaccent(clave))  WHERE clave  IS NOT NULL AND clave  <> upper(unaccent(clave));

-- ── 4. Grupos ─────────────────────────────────────────────────
UPDATE grupos SET
  nombre = upper(unaccent(nombre)) WHERE nombre IS NOT NULL AND nombre <> upper(unaccent(nombre));

-- ── Verificacion ──────────────────────────────────────────────
SELECT
  COUNT(*) FILTER (WHERE nombre ~ '[a-z]') AS inscripciones_pendientes
FROM inscripciones;

SELECT
  COUNT(*) FILTER (WHERE nombre ~ '[a-z]') AS maestros_pendientes
FROM maestros;
