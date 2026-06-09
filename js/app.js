/* =============================================
   ECCA — Supabase client + utilidades compartidas
   ============================================= */

// Cliente Supabase (config.js debe cargarse antes)
const _sb = window.supabase.createClient(SUPABASE_URL, SUPABASE_KEY);

/* ---- Mappers DB ↔ JS ---- */
function toDb(d) {
  return {
    folio:         d.folio,
    nombre:        d.nombre        || null,
    curp:          d.curp          || null,
    fecha_nac:     d.fechaNac      || null,
    edad:          d.edad          ? parseInt(d.edad) : null,
    tel:           d.tel           || null,
    correo:        d.correo        || null,
    escuela:       d.escuela       || null,
    p_nombre:      d.pNombre       || null,
    p_ocup:        d.pOcup         || null,
    p_tel:         d.pTel          || null,
    p_correo:      d.pCorreo       || null,
    modalidad:     d.modalidad     || null,
    trabaja:       d.trabaja       || null,
    deporte:       d.deporte       || null,
    objetivo:      d.objetivo      || null,
    doc_acta:      !!d.docActa,
    doc_acta_obs:  d.docActaObs    || null,
    doc_curp:      !!d.docCurp,
    doc_curp_obs:  d.docCurpObs    || null,
    doc_cert:      !!d.docCert,
    doc_cert_obs:  d.docCertObs    || null,
    doc_fotos:     !!d.docFotos,
    doc_fotos_obs: d.docFotosObs   || null,
    doc_otro:      !!d.docOtro,
    doc_otro_obs:  d.docOtroObs    || null,
    fecha_pago:    d.fechaPago     || null,
    concepto:      d.concepto      || null,
    monto:         d.monto         ? parseFloat(d.monto) : null,
    fpago:         d.fpago         || null,
    recibio:       d.recibio       || null,
    medio:         d.medio         || null,
  };
}

function fromDb(d) {
  if (!d) return null;
  return {
    folio:       d.folio,
    nombre:      d.nombre,
    curp:        d.curp,
    fechaNac:    d.fecha_nac,
    edad:        d.edad != null ? String(d.edad) : '',
    tel:         d.tel,
    correo:      d.correo,
    escuela:     d.escuela,
    pNombre:     d.p_nombre,
    pOcup:       d.p_ocup,
    pTel:        d.p_tel,
    pCorreo:     d.p_correo,
    modalidad:   d.modalidad,
    trabaja:     d.trabaja,
    deporte:     d.deporte,
    objetivo:    d.objetivo,
    docActa:     d.doc_acta,     docActaObs:  d.doc_acta_obs,
    docCurp:     d.doc_curp,     docCurpObs:  d.doc_curp_obs,
    docCert:     d.doc_cert,     docCertObs:  d.doc_cert_obs,
    docFotos:    d.doc_fotos,    docFotosObs: d.doc_fotos_obs,
    docOtro:     d.doc_otro,     docOtroObs:  d.doc_otro_obs,
    fechaPago:   d.fecha_pago,
    concepto:    d.concepto,
    monto:       d.monto != null ? String(d.monto) : '',
    fpago:       d.fpago,
    recibio:     d.recibio,
    medio:       d.medio,
    registrado:  d.created_at,
  };
}

/* ---- Operaciones de datos (async) ---- */
async function getRecords() {
  const { data, error } = await _sb
    .from('inscripciones')
    .select('*')
    .order('created_at', { ascending: false });
  if (error) { console.error('getRecords:', error); return []; }
  return (data || []).map(fromDb);
}

async function getRecord(folio) {
  const { data, error } = await _sb
    .from('inscripciones')
    .select('*')
    .eq('folio', folio)
    .single();
  if (error) return null;
  return fromDb(data);
}

async function saveRecord(d) {
  const { data, error } = await _sb
    .from('inscripciones')
    .upsert(toDb(d), { onConflict: 'folio' })
    .select();
  if (error) throw error;
  if (!data || data.length === 0) throw new Error('El registro no se guardó — verifique los permisos de la tabla en Supabase.');
}

async function deleteRecord(folio) {
  const { error, count } = await _sb
    .from('inscripciones')
    .delete({ count: 'exact' })
    .eq('folio', folio);
  if (error) throw error;
  if (count === 0) throw new Error('El registro no se encontró o no hay permiso para eliminarlo.');
}

async function nextFolio() {
  const { data, error } = await _sb.rpc('next_folio');
  if (!error && data) return data;
  // Fallback si la función no existe aún
  const { data: rows } = await _sb
    .from('inscripciones')
    .select('folio')
    .order('folio', { ascending: false })
    .limit(1);
  const n = rows?.length ? (parseInt(rows[0].folio.replace('ECF', '')) || 0) : 0;
  return 'ECF' + String(n + 1).padStart(4, '0');
}

async function refreshBadge() {
  const { count } = await _sb
    .from('inscripciones')
    .select('*', { count: 'exact', head: true });
  document.querySelectorAll('.sb-badge').forEach(b => b.textContent = count ?? 0);
}

/* ---- Session storage (folio activo) ---- */
function getActiveFolio() { return sessionStorage.getItem('ecca_active'); }
function setActiveFolio(f) {
  f ? sessionStorage.setItem('ecca_active', f) : sessionStorage.removeItem('ecca_active');
}

/* ---- DOM helpers ---- */
const $  = id => document.getElementById(id);
const gv = id => { const e = $(id); return e ? (e.value || '').trim() : ''; };
const sv = (id, v) => { const e = $(id); if (e) e.value = v ?? ''; };
const gc = id => { const e = $(id); return e ? e.checked : false; };
const sc = (id, v) => { const e = $(id); if (e) e.checked = !!v; };

function today()     { return new Date().toISOString().split('T')[0]; }
function esc(s)      { return String(s || '').replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;').replace(/"/g,'&quot;'); }
function fmtDate(d)  { if (!d) return ''; return new Date(d + 'T00:00:00').toLocaleDateString('es-MX', {day:'2-digit',month:'2-digit',year:'numeric'}); }
function fmtMoney(n) { if (!n && n !== 0) return '—'; return '$' + parseFloat(n).toLocaleString('es-MX', {minimumFractionDigits:2}); }

/* ---- Toast ---- */
(function() {
  const cont = document.createElement('div');
  cont.className = 'toast-container';
  document.body.appendChild(cont);
  const icons = { ok:'✓', err:'✕', warn:'⚠', '':'ℹ' };
  window.toast = function(msg, type = '') {
    const el = document.createElement('div');
    el.className = 'toast' + (type ? ' ' + type : '');
    el.innerHTML = `<span class="toast-icon">${icons[type] || 'ℹ'}</span><span>${esc(msg)}</span>`;
    cont.appendChild(el);
    requestAnimationFrame(() => requestAnimationFrame(() => el.classList.add('show')));
    setTimeout(() => { el.classList.remove('show'); setTimeout(() => el.remove(), 350); }, 3500);
  };
})();

/* ---- Modal confirmar ---- */
let _mcb = null;
window.confirm2 = function(title, msg, cb) {
  const t = $('mc-title'), m = $('mc-msg');
  if (t) t.textContent = title;
  if (m) m.textContent = msg;
  _mcb = cb;
  openModal('modal-confirm');
};
(function() {
  const ok = $('mc-ok');
  if (ok) ok.onclick = () => { closeModal('modal-confirm'); if (_mcb) _mcb(); };
})();

window.openModal  = id => { const m = $(id); if (m) m.classList.add('open'); };
window.closeModal = id => { const m = $(id); if (m) m.classList.remove('open'); };

document.querySelectorAll('.modal-ov').forEach(el =>
  el.addEventListener('click', e => { if (e.target === el) el.classList.remove('open'); })
);
document.addEventListener('keydown', e => {
  if (e.key === 'Escape') document.querySelectorAll('.modal-ov.open').forEach(m => m.classList.remove('open'));
});

/* ---- Sidebar activo + badge ---- */
(function() {
  const page = window.location.pathname.split('/').pop() || 'index.html';
  document.querySelectorAll('.sb-item[href]').forEach(el => {
    if (el.getAttribute('href') === page) el.classList.add('active');
  });
  refreshBadge().catch(() => {});
})();

/* ---- Sidebar móvil ---- */
(function() {
  const hbtn = document.querySelector('.topbar-hamburger');
  const sb   = $('sidebar');
  if (hbtn && sb) hbtn.addEventListener('click', () => sb.classList.toggle('open'));
  document.querySelectorAll('.sidebar-overlay').forEach(ov =>
    ov.addEventListener('click', () => sb && sb.classList.remove('open'))
  );
})();

/* ---- Exportar CSV (async) ---- */
window.exportarCSV = async function() {
  toast('Generando CSV...', '');
  try {
    const recs = await getRecords();
    if (!recs.length) { toast('No hay registros para exportar.', 'warn'); return; }
    const hdrs = ['Folio','Nombre','CURP','Fecha Nac.','Edad','Teléfono','Correo','Escuela',
      'Padre/Tutor','Ocupación','Tel. Padre','Correo Padre','Modalidad','Trabaja','Deporte',
      'Objetivo','Acta','CURP Doc','Certificado','Fotos','Otro',
      'Fecha Pago','Concepto','Monto','Forma Pago','Recibió','Medio','Registrado'];
    const rows = recs.map(r => [
      r.folio, r.nombre, r.curp, r.fechaNac, r.edad, r.tel, r.correo, r.escuela,
      r.pNombre, r.pOcup, r.pTel, r.pCorreo, r.modalidad, r.trabaja, r.deporte, r.objetivo,
      r.docActa ? 'Sí' : 'No', r.docCurp ? 'Sí' : 'No', r.docCert ? 'Sí' : 'No',
      r.docFotos ? 'Sí' : 'No', r.docOtroObs || '',
      r.fechaPago, r.concepto, r.monto, r.fpago, r.recibio, r.medio,
      r.registrado ? new Date(r.registrado).toLocaleDateString('es-MX') : ''
    ]);
    const csv  = [hdrs, ...rows].map(row =>
      row.map(c => '"' + (c || '').toString().replace(/"/g, '""') + '"').join(',')
    ).join('\n');
    const blob = new Blob(['﻿' + csv], { type: 'text/csv;charset=utf-8;' });
    const url  = URL.createObjectURL(blob);
    Object.assign(document.createElement('a'), { href: url, download: `ECCA_${today()}.csv` }).click();
    URL.revokeObjectURL(url);
    toast('CSV exportado correctamente.', 'ok');
  } catch(e) {
    toast('Error al exportar: ' + e.message, 'err');
  }
};
