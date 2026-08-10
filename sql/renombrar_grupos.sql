-- ============================================================
--  ECCA — Corrección de nombres de grupos cuatrimestral
--  Funciona desde los nombres originales (3A/5A) o intermedios (4°/6°)
-- ============================================================

-- 1. Marcar el 6A CT1 existente como historial ANTES de renombrar el nuevo
UPDATE grupos SET nombre = '6A CT1 (Historial)'
  WHERE nombre = '6A CT1';

-- 2. Renombrar grupos 3A → 4A
UPDATE grupos SET nombre = '4A CT1' WHERE nombre IN ('3A CT1', '4° CT1');
UPDATE grupos SET nombre = '4A CT2' WHERE nombre IN ('3A CT2', '4° CT2');
UPDATE grupos SET nombre = '4A SAB' WHERE nombre IN ('3A SAB', '4° SAB');

-- 3. Renombrar 5A CT1 → 6A CT1 (ahora sin conflicto)
UPDATE grupos SET nombre = '6A CT1' WHERE nombre IN ('5A CT1', '6° CT1');

-- Verificar resultado:
SELECT id, nombre, modalidad, ciclo FROM grupos ORDER BY nombre;
