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
    grupo_id:      d.grupoId       ? parseInt(d.grupoId) : null,
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
    foto_url:      d.fotoUrl       || null,
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
    grupoId:     d.grupo_id != null ? String(d.grupo_id) : '',
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
    fotoUrl:     d.foto_url,
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

async function uploadFoto(file, folio) {
  const ext  = (file.name.split('.').pop() || 'jpg').toLowerCase();
  const path = `${folio}_${Date.now()}.${ext}`;
  const { error } = await _sb.storage.from('fotos').upload(path, file, {
    contentType: file.type, upsert: true
  });
  if (error) throw error;
  const { data } = _sb.storage.from('fotos').getPublicUrl(path);
  return data.publicUrl;
}

async function refreshBadge() {
  const { count } = await _sb
    .from('inscripciones')
    .select('*', { count: 'exact', head: true });
  document.querySelectorAll('.sb-badge').forEach(b => b.textContent = count ?? 0);
}

/* ---- Grupos (async) ---- */
async function getGrupos() {
  const { data, error } = await _sb.from('grupos').select('*').order('nombre', { ascending: true });
  if (error) { console.error('getGrupos:', error); return []; }
  return data || [];
}

async function getGrupo(id) {
  const { data, error } = await _sb.from('grupos').select('*').eq('id', id).single();
  if (error) return null;
  return data;
}

async function saveGrupo(g) {
  const payload = {
    nombre:             g.nombre,
    modalidad:          g.modalidad || null,
    ciclo:              g.ciclo     || null,
    cupo:               g.cupo      ? parseInt(g.cupo) : null,
    monto_inscripcion:  g.montoInscripcion ? parseFloat(g.montoInscripcion) : null,
    monto_colegiatura:  g.montoColegiatura ? parseFloat(g.montoColegiatura) : null,
    num_colegiaturas:   g.numColegiaturas  ? parseInt(g.numColegiaturas)    : null,
  };
  if (g.id) payload.id = parseInt(g.id);
  const { data, error } = await _sb.from('grupos').upsert(payload).select();
  if (error) throw error;
  if (!data || !data.length) throw new Error('No se pudo guardar el grupo.');
  return data[0];
}

async function deleteGrupo(id) {
  const { error, count } = await _sb.from('grupos').delete({ count: 'exact' }).eq('id', id);
  if (error) throw error;
  if (count === 0) throw new Error('El grupo no se encontró o no hay permiso para eliminarlo.');
}

async function getAlumnosByGrupo(grupoId) {
  const { data, error } = await _sb.from('inscripciones').select('*').eq('grupo_id', grupoId);
  if (error) { console.error('getAlumnosByGrupo:', error); return []; }
  return (data || []).map(fromDb);
}

async function asignarGrupo(folio, grupoId) {
  const { error } = await _sb.from('inscripciones').update({ grupo_id: grupoId }).eq('folio', folio);
  if (error) throw error;
}

/* ---- Cargos (lo que se debe) ---- */
async function getCargos(folio) {
  const { data, error } = await _sb.from('cargos').select('*').eq('folio', folio).order('created_at', { ascending: true });
  if (error) { console.error('getCargos:', error); return []; }
  return data || [];
}

async function getCargosByGrupo(grupoId) {
  const { data, error } = await _sb.from('cargos').select('*').eq('grupo_id', grupoId);
  if (error) { console.error('getCargosByGrupo:', error); return []; }
  return data || [];
}

async function saveCargo(c) {
  const payload = {
    folio:             c.folio,
    grupo_id:          c.grupoId ? parseInt(c.grupoId) : null,
    concepto:          c.concepto,
    descripcion:       c.descripcion || null,
    monto:             parseFloat(c.monto),
    fecha_vencimiento: c.fechaVencimiento || null,
  };
  if (c.id) payload.id = parseInt(c.id);
  const { data, error } = await _sb.from('cargos').upsert(payload).select();
  if (error) throw error;
  if (!data || !data.length) throw new Error('No se pudo guardar el cargo.');
  return data[0];
}

async function deleteCargo(id) {
  const { error, count } = await _sb.from('cargos').delete({ count: 'exact' }).eq('id', id);
  if (error) throw error;
  if (count === 0) throw new Error('El cargo no se encontró o no hay permiso para eliminarlo.');
}

async function generarCargosGrupo(grupoId, { concepto, monto, descripcion, fechaVencimiento }) {
  const alumnos = await getAlumnosByGrupo(grupoId);
  if (!alumnos.length) throw new Error('El grupo no tiene alumnos asignados.');
  const rows = alumnos.map(a => ({
    folio: a.folio, grupo_id: parseInt(grupoId), concepto,
    descripcion: descripcion || null, monto: parseFloat(monto),
    fecha_vencimiento: fechaVencimiento || null,
  }));
  const { data, error } = await _sb.from('cargos').insert(rows).select();
  if (error) throw error;
  return data || [];
}

/* ---- Pagos (dinero recibido) ---- */
async function getPagos(folio) {
  const { data, error } = await _sb.from('pagos').select('*').eq('folio', folio).order('fecha_pago', { ascending: false });
  if (error) { console.error('getPagos:', error); return []; }
  return data || [];
}

async function getPago(id) {
  const { data, error } = await _sb.from('pagos').select('*').eq('id', id).single();
  if (error) return null;
  return data;
}

async function savePago(p) {
  const payload = {
    folio:           p.folio,
    cargo_id:        p.cargoId ? parseInt(p.cargoId) : null,
    concepto:        p.concepto,
    monto:           parseFloat(p.monto),
    fecha_pago:      p.fechaPago || today(),
    forma_pago:      p.formaPago || null,
    recibio:         p.recibio   || null,
    comprobante_url: p.comprobanteUrl || null,
    metodo:          p.metodo || 'manual',
    referencia:      p.referencia || null,
    estado:          p.estado || 'confirmado',
  };
  if (p.id) payload.id = parseInt(p.id);
  const { data, error } = await _sb.from('pagos').upsert(payload).select();
  if (error) throw error;
  if (!data || !data.length) throw new Error('No se pudo guardar el pago.');
  return data[0];
}

async function deletePago(id) {
  const { error, count } = await _sb.from('pagos').delete({ count: 'exact' }).eq('id', id);
  if (error) throw error;
  if (count === 0) throw new Error('El pago no se encontró o no hay permiso para eliminarlo.');
}

async function uploadComprobante(file, folio) {
  const ext  = (file.name.split('.').pop() || 'jpg').toLowerCase();
  const path = `${folio}_${Date.now()}.${ext}`;
  const { error } = await _sb.storage.from('comprobantes').upload(path, file, {
    contentType: file.type, upsert: true
  });
  if (error) throw error;
  const { data } = _sb.storage.from('comprobantes').getPublicUrl(path);
  return data.publicUrl;
}

async function getAllPagos() {
  const { data, error } = await _sb.from('pagos').select('folio,cargo_id,monto,estado');
  if (error) { console.error('getAllPagos:', error); return []; }
  return data || [];
}

async function getAllCargos() {
  const { data, error } = await _sb.from('cargos').select('folio,monto');
  if (error) { console.error('getAllCargos:', error); return []; }
  return data || [];
}

/* ---- Saldo (cliente: cargos vs. pagos confirmados) ---- */
function calcSaldo(cargos, pagos) {
  const confirmados = pagos.filter(p => p.estado === 'confirmado');
  const totalCargos = cargos.reduce((s, c) => s + (parseFloat(c.monto) || 0), 0);
  const totalPagado = confirmados.reduce((s, p) => s + (parseFloat(p.monto) || 0), 0);
  return { totalCargos, totalPagado, saldo: totalCargos - totalPagado };
}

function estadoCargo(cargo, pagos) {
  const pagado = pagos.filter(p => p.cargo_id === cargo.id && p.estado === 'confirmado')
    .reduce((s, p) => s + (parseFloat(p.monto) || 0), 0);
  const monto = parseFloat(cargo.monto) || 0;
  if (pagado >= monto) return 'pagado';
  if (pagado > 0) return 'parcial';
  if (cargo.fecha_vencimiento && cargo.fecha_vencimiento < today()) return 'vencido';
  return 'pendiente';
}

/* ---- Session storage (folio activo / pago activo) ---- */
function getActiveFolio() { return sessionStorage.getItem('ecca_active'); }
function setActiveFolio(f) {
  f ? sessionStorage.setItem('ecca_active', f) : sessionStorage.removeItem('ecca_active');
}

function getActivePago() { return sessionStorage.getItem('ecca_active_pago'); }
function setActivePago(id) {
  id ? sessionStorage.setItem('ecca_active_pago', id) : sessionStorage.removeItem('ecca_active_pago');
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

/* ---- Auth ---- */
async function signIn(email, password) {
  const { data, error } = await _sb.auth.signInWithPassword({ email, password });
  if (error) throw error;
  return data;
}

async function signOut() {
  sessionStorage.removeItem('ecca_rol');
  sessionStorage.removeItem('ecca_nombre');
  await _sb.auth.signOut();
  window.location.href = 'login.html';
}

/* ---- Permisos por rol (null = acceso total) ---- */
const _PERMISOS = {
  admin:           null,
  director:        null,
  asesor:          ['formulario.html','base-datos.html','pagos.html','recibo.html','credencial.html'],
  profesor:        ['base-datos.html','credencial.html'],
  control_escolar: ['base-datos.html','grupos.html','pagos.html','recibo.html','credencial.html'],
  ventas:          ['formulario.html'],
};
const _ROL_HOME = {
  admin:           'formulario.html',
  director:        'formulario.html',
  asesor:          'formulario.html',
  profesor:        'base-datos.html',
  control_escolar: 'base-datos.html',
  ventas:          'formulario.html',
};
const _ROL_LABEL = {
  admin:'Admin', director:'Director', asesor:'Asesor',
  profesor:'Profesor', control_escolar:'Control Escolar', ventas:'Ventas / Insc.',
};

window._userRol = null;

/* Aplica permisos y muestra el sidebar — puede llamarse con datos del caché o de Supabase */
function _aplicarPermisos(rol, nombre) {
  window._userRol = rol;

  // Badge de usuario (evitar duplicados)
  const sbFooter = document.querySelector('.sb-footer');
  if (sbFooter) {
    document.querySelector('.sb-user')?.remove();
    const el = document.createElement('div');
    el.className = 'sb-user';
    el.innerHTML = `<div class="sb-user-info"><div class="sb-user-name">${esc(nombre)}</div><div class="sb-user-rol">${esc(_ROL_LABEL[rol]||rol)}</div></div><button class="sb-logout" onclick="signOut()" title="Cerrar sesión"><i class="fas fa-right-from-bracket"></i></button>`;
    sbFooter.parentNode.insertBefore(el, sbFooter);
  }

  // Mostrar / ocultar links según rol
  const perms = _PERMISOS[rol];
  document.querySelectorAll('.sb-item[href]').forEach(el => {
    const href = el.getAttribute('href');
    if (!href) return;
    const visible = !perms || perms.includes(href);
    const esUsuarios = href === 'usuarios.html';
    el.style.display = (visible && (!esUsuarios || rol === 'admin' || rol === 'director')) ? '' : 'none';
  });

  // Ocultar labels de grupo sin items visibles
  document.querySelectorAll('.sb-group-label').forEach(lbl => {
    let next = lbl.nextElementSibling;
    let tieneVisible = false;
    while (next && !next.classList.contains('sb-group-label')) {
      if (next.classList.contains('sb-item') && next.style.display !== 'none') tieneVisible = true;
      next = next.nextElementSibling;
    }
    lbl.style.display = tieneVisible ? '' : 'none';
  });

  // Revelar sidebar
  document.querySelector('.sb-nav')?.classList.add('sb-ready');
}

/* ---- Sidebar activo + badge + auth guard + permisos ---- */
(async function() {
  const page = window.location.pathname.split('/').pop() || 'index.html';

  if (page === 'login.html') return;

  const paginasProtegidas = ['formulario.html','base-datos.html','grupos.html',
    'pagos.html','recibo.html','credencial.html','usuarios.html'];

  // 1) Aplicar desde caché (síncrono — sin flash)
  const cachedRol    = sessionStorage.getItem('ecca_rol');
  const cachedNombre = sessionStorage.getItem('ecca_nombre') || '';
  if (cachedRol) {
    const perms = _PERMISOS[cachedRol];
    if (perms && paginasProtegidas.includes(page) && !perms.includes(page)) {
      window.location.href = _ROL_HOME[cachedRol] || 'formulario.html';
      return;
    }
    _aplicarPermisos(cachedRol, cachedNombre);
  }

  // 2) Verificar sesión real con Supabase (en segundo plano)
  try {
    const { data: { session } } = await _sb.auth.getSession();
    if (!session) {
      sessionStorage.removeItem('ecca_rol');
      sessionStorage.removeItem('ecca_nombre');
      window.location.href = 'login.html';
      return;
    }
    const { data: { user } } = await _sb.auth.getUser();
    if (user) {
      const { data: perfil } = await _sb.from('perfiles').select('nombre,rol,email,activo').eq('id', user.id).single();
      if (perfil?.activo === false) {
        sessionStorage.removeItem('ecca_rol');
        sessionStorage.removeItem('ecca_nombre');
        await _sb.auth.signOut();
        window.location.href = 'login.html';
        return;
      }
      const rol    = perfil?.rol    || 'asesor';
      const nombre = perfil?.nombre || perfil?.email || user.email || '';
      sessionStorage.setItem('ecca_rol',    rol);
      sessionStorage.setItem('ecca_nombre', nombre);
      // Re-aplicar si el rol o nombre cambió (o si no había caché)
      if (rol !== cachedRol || nombre !== cachedNombre) {
        const perms = _PERMISOS[rol];
        if (perms && paginasProtegidas.includes(page) && !perms.includes(page)) {
          window.location.href = _ROL_HOME[rol] || 'formulario.html';
          return;
        }
        _aplicarPermisos(rol, nombre);
      }
    }
  } catch(e) {
    if (!cachedRol) { window.location.href = 'login.html'; }
  }

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
