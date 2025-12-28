// services/usuario.service.ts
import { db } from "../index";
import { Usuario } from "../models/usuario.model";
import { Intercambio } from "../models/intercambio.model";
export class UsuarioService {

  // ============================================
  // 1) LISTAR USUARIOS
  // ============================================
  async getAllUsers(): Promise<Usuario[]> {
    const [rows] = await db.query("SELECT * FROM usuario");
    return rows as Usuario[];
  }

  // ============================================
  // 2) REGISTRAR USUARIO COMPLETO
  // CALL sp_registrar_usuario_completo(...)
  // ============================================
  async registrarUsuarioCompleto(
    nombre: string,
    apellido: string,
    nombreUser: string,
    contrasenia: string,
    roles: string[]
  ) {
    const rolesJson = JSON.stringify(roles);

    const [rows]: any = await db.query(
      `CALL sp_registrar_usuario_completo(?,?,?,?,?)`,
      [nombre, apellido, nombreUser, contrasenia, rolesJson]
    );

    // El SP devuelve usuario_id y billetera_id en rows[0]
    return rows[0][0];
  }

  // ============================================
  // 3) MODIFICAR USUARIO
  // CALL sp_modificar_usuario(nombreUser, ...)
  // ============================================
  async modificarUsuario(
    nombreUser: string,
    nuevoNombre: string,
    nuevoApellido: string,
    nuevaContrasenia: string
  ) {
    const [rows]: any = await db.query(
      `CALL sp_modificar_usuario(?,?,?,?)`,
      [nombreUser, nuevoNombre, nuevoApellido, nuevaContrasenia]
    );

    return { message: "Usuario modificado correctamente" };
  }

  // ============================================
  // 4) REGISTRAR ACCESO (bitácora login)
  // CALL sp_registrar_acceso(...)
  // ============================================
  async registrarAcceso(
    usuario: string,
    ip: string,
    userAgent: string,
    exito: boolean,
    motivo: string
  ) {
    await db.query(
      `CALL sp_registrar_acceso(?,?,?,?,?)`,
      [usuario, ip, userAgent, exito, motivo]
    );

    return { message: "Acceso registrado" };
  }
  async cancelarCompraActor(idIntercambio: number, actorUsuarioId: number) {
    if (!idIntercambio || !actorUsuarioId) {
      throw new Error("Faltan parámetros: idIntercambio y actorUsuarioId son requeridos");
    }

    // CALL al procedimiento almacenado
    try {
      const [rows]: any = await db.query(
        `CALL sp_cancelar_compra_actor(?, ?)`,
        [idIntercambio, actorUsuarioId]
      );

      // Dependiendo de tu versión de MySQL, rows puede ser un array anidado.
      // Devuelvo rows tal cual para inspección; si prefieres un objeto simple, ajusta aquí.
      return rows;
    } catch (error: any) {
      // Re-lanzar con mensaje claro para el controlador
      const msg = (error && error.message) ? error.message : 'Error ejecutando sp_cancelar_compra_actor';
      throw new Error(msg);
    }
  }

  // Asegúrate de tener: import { db } from "../index"; y export class UsuarioService { ... }

  /**
   * Upsert reporte (acumula CO2/Energia/Agua)
   */
  async upsertReporte(usuarioId: number, CO2: number, Energia: number, Agua: number) {
    try {
      await db.query(
        `CALL sp_upsert_reporte(?, ?, ?, ?)`,
        [usuarioId, CO2, Energia, Agua]
      );
      return { success: true };
    } catch (err: any) {
      throw new Error(err?.message ?? "Error en sp_upsert_reporte");
    }
  }

  /**
   * Publicar con impacto (devuelve idpublicacion)
   */
  async publicarConImpacto(
    usuarioId: number,
    nombreCategoria: string,
    unidadMedida: string,
    titulo: string,
    descripcion: string,
    valorCredito: number,
    cantidadUnidad: number,
    foto: string
  ) {
    try {
      // Usamos variable de sesión para capturar OUT param
      await db.query(
        `CALL sp_publicar_con_impacto(?, ?, ?, ?, ?, ?, ?,?, @p_idpublicacion)`,
        [usuarioId, nombreCategoria, unidadMedida, titulo, descripcion, valorCredito, cantidadUnidad,foto]
      );
      const [rows]: any = await db.query(`SELECT @p_idpublicacion as idpublicacion`);
      return { idpublicacion: rows[0]?.idpublicacion ?? null };
    } catch (err: any) {
      throw new Error(err?.message ?? "Error en sp_publicar_con_impacto");
    }
  }

  /**
   * Recargar billetera
   */
  async recargarBilletera(usuarioId: number, monto: number, descripcion?: string) {
    try {
      await db.query(`CALL sp_recargar_billetera(?, ?, ?)`, [
        usuarioId,
        monto,
        descripcion ?? null,
      ]);
      return { success: true };
    } catch (err: any) {
      throw new Error(err?.message ?? "Error en sp_recargar_billetera");
    }
  }

  /**
   * Iniciar compra con crédito verde (devuelve idintercambio)
   */
  async iniciarCompraConCreditoVerde(compradorId: number, idpublicacion: number, cantidad: number) {
    try {
      await db.query(
        `CALL sp_iniciar_compra_con_credito_verde(?, ?, ?, @p_idintercambio)`,
        [compradorId, idpublicacion, cantidad]
      );
      const [rows]: any = await db.query(`SELECT @p_idintercambio as idintercambio`);
      return { idintercambio: rows[0]?.idintercambio ?? null };
    } catch (err: any) {
      throw new Error(err?.message ?? "Error en sp_iniciar_compra_con_credito_verde");
    }
  }

  /**
   * Liberar pago (completa intercambio)
   */
  async liberarPagoConCreditoVerde(idintercambio: number) {
    try {
      await db.query(`CALL sp_liberar_pago_con_credito_verde(?)`, [idintercambio]);
      return { success: true };
    } catch (err: any) {
      throw new Error(err?.message ?? "Error en sp_liberar_pago_con_credito_verde");
    }
  }

  async login(nombreUser: string, contrasenia: string, rolesSolicitados?: string[]) {
  if (!nombreUser?.trim() || !contrasenia?.trim()) {
    return { success: false, status: 400, message: "nombreUser y contrasenia son requeridos" };
  }

  try {
    // 1) Buscar usuario y validar contraseña (SHA2 256)
    const [urows]: any = await db.query(
      `SELECT idusuario, nombre, apellido, nombreUser, billetera_id
         FROM usuario
        WHERE nombreUser = ? AND contrasenia = SHA2(?, 256)
        LIMIT 1`,
      [nombreUser, contrasenia]
    );

    if (!urows || urows.length === 0) {
      // registrar intento fallido (sin usuario encontrado)
      await this.registrarAcceso(nombreUser, "", "", false, "Credenciales inválidas");
      return { success: false, status: 401, message: "Usuario o contraseña incorrectos" };
    }

    const usuario = urows[0];

    // 2) Obtener roles del usuario
    const [rrows]: any = await db.query(
      `SELECT r.nombreRol
         FROM usuario_rol ur
         JOIN rol r ON r.idrol = ur.idrol
        WHERE ur.idusuario = ?`,
      [usuario.idusuario]
    );
    const rolesUsuario: string[] = (rrows || []).map((r: any) => r.nombreRol);

    // 4) Registrar acceso exitoso y devolver datos
    await this.registrarAcceso(nombreUser, "", "", true, "Login OK");

    return {
      success: true,
      usuario: {
        idusuario: usuario.idusuario,
        nombre: usuario.nombre,
        apellido: usuario.apellido,
        nombreUser: usuario.nombreUser,
        billetera_id: usuario.billetera_id,
      },
      roles: rolesUsuario,
    };
  } catch (err: any) {
    console.error("UsuarioService.login error:", err);
    return { success: false, status: 500, message: "Error interno" };
  }
}
  // --- Añadir dentro de export class UsuarioService { ... }

// ============================================
// OBTENER LISTA DE PROCEDIMIENTOS (ROUTINES)
// ============================================
async getStoredProcedures(schema: string = 'mydb') {
  try {
    const sql = `
      SELECT ROUTINE_NAME
      FROM information_schema.ROUTINES
      WHERE ROUTINE_TYPE = 'PROCEDURE'
        AND ROUTINE_SCHEMA = ?
    `;
    const [rows]: any = await db.query(sql, [schema]);
    return rows;
  } catch (err: any) {
    throw new Error(err?.message ?? 'Error consultando procedimientos almacenados');
  }
}

// ============================================
// LISTAR USUARIOS CON ROLES Y SALDO DE BILLETERA
// ============================================
async getUsuariosConRoles() {
  try {
    const sql = `
      SELECT 
        u.idusuario       AS usuario_id,
        CONCAT(u.nombre, ' ', u.apellido) AS nombre_completo,
        u.nombreUser      AS nombre_usuario,
        GROUP_CONCAT(r.nombreRol ORDER BY r.nombreRol SEPARATOR ', ') AS roles,
        b.saldoActual     AS saldo_billetera
      FROM usuario u
      JOIN usuario_rol ur 
          ON u.idusuario = ur.idusuario
      JOIN rol r 
          ON ur.idrol = r.idrol
      JOIN billetera b
          ON u.billetera_id = b.idbilletera
      GROUP BY u.idusuario, u.nombre, u.apellido, u.nombreUser, b.saldoActual
      ORDER BY u.idusuario;
    `;
    const [rows]: any = await db.query(sql);
    return rows;
  } catch (err: any) {
    throw new Error(err?.message ?? 'Error en getUsuariosConRoles');
  }
}

// ============================================
// VER IMPACTO SEGUN TITULO DE PUBLICACION
// (recibe titulo como parametro)
// ============================================
async getImpactoPorTitulo(titulo: string) {
  try {
    const sql = `
      SELECT 
        c.cantidadUnidad,
        t.factorCO2,
        t.factorEnergiaKwh,
        t.factorAguaLitro,
        c.cantidadUnidad * (t.factorCO2 + t.factorEnergiaKwh + t.factorAguaLitro) AS impacto_total
      FROM categoria c
      JOIN tabla_equivalencia t ON t.idtablaEquivalencia = c.tablaEquivalencia_id
      JOIN publicacion p        ON p.idpublicacion = c.publicacion_id
      WHERE p.titulo = ?
    `;
    const [rows]: any = await db.query(sql, [titulo]);
    return rows;
  } catch (err: any) {
    throw new Error(err?.message ?? 'Error en getImpactoPorTitulo');
  }
}

// ============================================
// OBTENER TODAS LAS PUBLICACIONES
// ============================================
async getPublicaciones() {
  try {
    const sql = `SELECT * FROM publicacion`;
    const [rows]: any = await db.query(sql);
    return rows;
  } catch (err: any) {
    throw new Error(err?.message ?? 'Error en getPublicaciones');
  }
}

// ============================================
// BUSCAR EN V_PUBLICACIONES_IMPACTO POR termino (LIKE)
// ============================================
async searchPublicacionesImpacto(termino: string) {
  try {
    const sql = `SELECT * FROM v_publicaciones_impacto WHERE titulo LIKE ?`;
    const like = `%${termino}%`;
    const [rows]: any = await db.query(sql, [like]);
    return rows;
  } catch (err: any) {
    throw new Error(err?.message ?? 'Error en searchPublicacionesImpacto');
  }
}

// ============================================
// INTERCAMBIOS PENDIENTES / EN_PROCESO
// (igual que otras funciones, expone rows directo)
// ============================================
async getIntercambiosPendientes() {
  try {
    const sql = `
      SELECT 
        i.idintercambio,
        i.usuario_origen_id AS comprador_id,
        i.usuario_destino_id AS vendedor_id,
        u1.nombreUser AS comprador,
        u2.nombreUser AS vendedor,
        i.creditoVerde,
        i.cantidad,
        i.estadoIntercam,
        i.fechaCreacion,
        p.titulo AS publicacion
      FROM intercambio i
      JOIN usuario u1 ON i.usuario_origen_id = u1.idusuario
      JOIN usuario u2 ON i.usuario_destino_id = u2.idusuario
      LEFT JOIN publicacion p ON i.publicacion_id = p.idpublicacion
      WHERE i.estadoIntercam IN ('pendiente', 'en_proceso')
      ORDER BY i.fechaCreacion DESC;
    `;
    const [rows]: any = await db.query(sql);
    return rows;
  } catch (err: any) {
    throw new Error(err?.message ?? 'Error en getIntercambiosPendientes');
  }
}

// ============================================
// IMPACTO DE USUARIOS (CO2, Energia, Agua)
// ============================================
async getImpactoUsuarios() {
  try {
    const sql = `
      SELECT 
        u.idusuario,
        u.nombre,
        u.apellido,
        u.nombreUser,
        r.CO2,
        r.Energia,
        r.Agua,
        (IFNULL(r.CO2,0) + IFNULL(r.Energia,0) + IFNULL(r.Agua,0)) AS impactoTotal
      FROM reporte r
      JOIN usuario u ON r.usuario_id = u.idusuario
      ORDER BY impactoTotal DESC;
    `;
    const [rows]: any = await db.query(sql);
    return rows;
  } catch (err: any) {
    throw new Error(err?.message ?? 'Error en getImpactoUsuarios');
  }
}

// ============================================
// USUARIOS MAS ECOLOGICOS (ordenados por impactoTotal)
// ============================================
async getUsuariosMasEcologicos() {
  try {
    const sql = `
      SELECT 
        u.nombreUser,
        ROUND(r.CO2,4) AS CO2,
        ROUND(r.Energia,4) AS Energia,
        ROUND(r.Agua,4) AS Agua,
        ROUND((r.CO2+r.Energia+r.Agua),4) AS impactoTotal
      FROM reporte r
      JOIN usuario u ON u.idusuario = r.usuario_id
      ORDER BY impactoTotal DESC;
    `;
    const [rows]: any = await db.query(sql);
    return rows;
  } catch (err: any) {
    throw new Error(err?.message ?? 'Error en getUsuariosMasEcologicos');
  }
}

// ============================================
// COMPRAS INTERCAMBIOS COMPLETADOS
// ============================================
async getComprasCompletadas() {
  try {
    const sql = `
      SELECT 
        i.idintercambio,
        i.usuario_origen_id AS comprador_id,
        i.usuario_destino_id AS vendedor_id,
        u1.nombreUser AS comprador,
        u2.nombreUser AS vendedor,
        i.creditoVerde,
        i.cantidad,
        i.estadoIntercam,
        i.fechaCreacion,
        i.fechaFinal,
        p.titulo AS publicacion
      FROM intercambio i
      JOIN usuario u1 ON i.usuario_origen_id = u1.idusuario
      JOIN usuario u2 ON i.usuario_destino_id = u2.idusuario
      LEFT JOIN publicacion p ON i.publicacion_id = p.idpublicacion
      WHERE i.estadoIntercam = 'completado'
      ORDER BY i.fechaFinal DESC;
    `;
    const [rows]: any = await db.query(sql);
    return rows;
  } catch (err: any) {
    throw new Error(err?.message ?? 'Error en getComprasCompletadas');
  }
}

// ============================================
// AUDITORIA - ULTIMO ACCESO (limit por defecto 200)
// ============================================
async getBitacoraAcceso(limit: number = 200) {
  try {
    const sql = `
      SELECT usuario, ip, user_agent, exito, motivo, fecha
      FROM bitacora_acceso
      ORDER BY fecha DESC
      LIMIT ?
    `;
    const [rows]: any = await db.query(sql, [limit]);
    return rows;
  } catch (err: any) {
    throw new Error(err?.message ?? 'Error en getBitacoraAcceso');
  }
}

// ============================================
// HISTÓRICO CONSOLIDADO (últimos N eventos, default 200)
// ============================================
async getHistoricoConsolidado(limit: number = 200) {
  try {
    const sql = `
      SELECT 'usuario' AS origen, b.usuario_id AS actor_id, b.accion, b.detalle, b.fecha
      FROM bitacora_usuario b
      UNION ALL
      SELECT 'publicacion', bp.usuario_id, bp.accion, bp.detalle, bp.fecha
      FROM bitacora_publicacion bp
      UNION ALL
      SELECT 'intercambio', bi.idintercambio, CONCAT('estado ', bi.estado_old, '->', bi.estado_new), NULL, bi.fecha
      FROM bitacora_intercambio bi
      ORDER BY 5 DESC
      LIMIT ?
    `;
    const [rows]: any = await db.query(sql, [limit]);
    return rows;
  } catch (err: any) {
    throw new Error(err?.message ?? 'Error en getHistoricoConsolidado');
  }
}

// ============================================
// EXTRACTO BILLETERA POR nombreUser (últimos N, default 200)
// ============================================
async getExtractoBilletera(nombreUser: string, limit: number = 200) {
  if (!nombreUser) throw new Error('Parametro nombreUser es requerido');
  try {
    const sql = `
      SELECT m.idmovimiento_credito, u.nombreUser, m.tipoMovimiento, m.monto, m.descripcionMovi, m.fechaMovimiento, m.intercambio_id
      FROM movimiento_credito m
      JOIN billetera b ON m.billetera_id = b.idbilletera
      JOIN usuario u ON u.billetera_id = b.idbilletera
      WHERE u.nombreUser = ?
      ORDER BY m.fechaMovimiento DESC
      LIMIT ?
    `;
    const [rows]: any = await db.query(sql, [nombreUser, limit]);
    return rows;
  } catch (err: any) {
    throw new Error(err?.message ?? 'Error en getExtractoBilletera');
  }
}

// ============================================
// HISTORIAL COMPRA DE CREDITOS
// ============================================
async getCompraCreditos() {
  try {
    const sql = `
      SELECT 
          c.idcompra,
          u.nombreUser AS usuario,
          c.montoBs,
          c.creditosComprados,
          c.fechaCompra,
          c.metodoPago,
          p.monto AS ganancia_plataforma,
          p.fecha AS fecha_registro,
          p.detalle
      FROM compra_credito c
      JOIN usuario u 
          ON u.idusuario = c.usuario_id
      LEFT JOIN plataforma_ingresos p 
          ON p.referencia_id = c.idcompra 
         AND p.tipo = 'venta_creditos'
      ORDER BY c.fechaCompra DESC;
    `;
    const [rows]: any = await db.query(sql);
    return rows;
  } catch (err: any) {
    throw new Error(err?.message ?? 'Error en getCompraCreditos');
  }
}

// ============================================
// CONSULTAS ADICIONALES: bitacoras (opcional)
// ============================================
async getBitacoraIntercambio(limit: number = 200) {
  try {
    const sql = `SELECT * FROM bitacora_intercambio ORDER BY fecha DESC LIMIT ?`;
    const [rows]: any = await db.query(sql, [limit]);
    return rows;
  } catch (err: any) {
    throw new Error(err?.message ?? 'Error en getBitacoraIntercambio');
  }
}

async getBitacoraUsuario(limit: number = 200) {
  try {
    const sql = `SELECT * FROM bitacora_usuario ORDER BY fecha DESC LIMIT ?`;
    const [rows]: any = await db.query(sql, [limit]);
    return rows;
  } catch (err: any) {
    throw new Error(err?.message ?? 'Error en getBitacoraUsuario');
  }
}

// Eliminar usuario por id
async eliminarUsuario(idusuario: number) {
  if (!idusuario) throw new Error('p_idusuario es requerido');
  try {
    await db.query(`CALL sp_eliminar_usuario(?)`, [idusuario]);
    return { success: true, message: 'Usuario eliminado' };
  } catch (err: any) {
    throw new Error(err?.message ?? 'Error en sp_eliminar_usuario');
  }
}

// Eliminar publicacion por id
async eliminarPublicacion(idpublicacion: number) {
  if (!idpublicacion) throw new Error('p_idpublicacion es requerido');
  try {
    await db.query(`CALL sp_eliminar_publicacion(?)`, [idpublicacion]);
    return { success: true, message: 'Publicación eliminada' };
  } catch (err: any) {
    throw new Error(err?.message ?? 'Error en sp_eliminar_publicacion');
  }
}

async obtenerCategorias() {
  try {
    const result: any = await db.query(
      `SELECT * FROM catalogo_categoria`
    );

    // result normalmente viene como [rows, fields]
    return result[0]; // devuelve solo las filas

  } catch (err: any) {
    console.error("Error en obtenerCategorias - detalles:", {
      message: err?.message,
      code: err?.code,
      sqlMessage: err?.sqlMessage,
      sqlState: err?.sqlState,
      stack: err?.stack,
    });

    const msg = err?.sqlMessage ?? err?.message ?? "Error al obtener categorias de la plataforma";
    throw new Error(msg);
  }
}



// Compra de créditos (llama el SP sp_compra_creditos y devuelve idcompra)
async compraCreditos(usuarioId: number, montoBs: number, creditos: number, metodo: string = 'tarjeta') {
  if (!usuarioId || !montoBs || !creditos) throw new Error('Parámetros inválidos');
  try {
    // El SP al final hace: SELECT v_idcomp AS idcompra;
    const [rows]: any = await db.query(`CALL sp_compra_creditos(?, ?, ?, ?)`, [
      usuarioId,
      montoBs,
      creditos,
      metodo,
    ]);
    // Dependiendo del driver rows puede venir anidado. Normalmente rows[0] contiene el SELECT devuelto.
    const idcompra = rows?.[0]?.idcompra ?? rows?.idcompra ?? null;
    return { success: true, idcompra };
  } catch (err: any) {
    throw new Error(err?.message ?? 'Error en sp_compra_creditos');
  }
}

// Buscar publicaciones (wrapper para sp_buscar_publicaciones)
async buscarPublicaciones(texto: string | null, categoria: string | null, offset = 0, limit = 50) {
  try {
    const [rows]: any = await db.query(
      `CALL sp_buscar_publicaciones(?, ?, ?, ?)`,
      [texto ?? null, categoria ?? null, offset, limit]
    );
    // sp_buscar_publicaciones devuelve un result set; según driver puede venir en rows[0]
    return rows?.[0] ?? rows;
  } catch (err: any) {
    throw new Error(err?.message ?? 'Error en sp_buscar_publicaciones');
  }
}

// Modificar publicacion (wrapper para sp_modificar_publicacion)
async modificarPublicacion(
  idpublicacion: number,
  titulo?: string | null,
  descripcion?: string | null,
  valorCredito?: number | null,
  estado?: string | null,
  foto?: string | null
) {
  if (!idpublicacion) throw new Error('p_idpublicacion es requerido');
  try {
    await db.query(
      `CALL sp_modificar_publicacion(?, ?, ?, ?, ?, ?)`,
      [idpublicacion, titulo ?? null, descripcion ?? null, valorCredito ?? null, estado ?? null, foto ?? null]
    );
    return { success: true, message: 'Publicación modificada' };
  } catch (err: any) {
    throw new Error(err?.message ?? 'Error en sp_modificar_publicacion');
  }
}
  // ============================================
  // OBTENER IMPACTO POR SEMANA (vista v_impacto_semana)
  // ============================================
  async getImpactoSemana() {
    try {
      const sql = `SELECT
    YEARWEEK(fecha, 1) AS semana_inicio,  -- Número de semana del año (modo 1: lunes inicio)
    SUM(impactoCO2) AS CO2,
    SUM(impactoEnergia) AS Energia,
    SUM(impactoAgua) AS Agua,
    SUM(impactoCO2 + impactoEnergia + impactoAgua) AS Total
FROM (
    -- Impacto por publicaciones
    SELECT 
        p.fechaPublicacion AS fecha,
        SUM(c.cantidadUnidad * te.factorCO2) AS impactoCO2,
        SUM(c.cantidadUnidad * te.factorEnergiaKwh) AS impactoEnergia,
        SUM(c.cantidadUnidad * te.factorAguaLitro) AS impactoAgua
    FROM publicacion p
    JOIN categoria c ON c.publicacion_id = p.idpublicacion
    JOIN tabla_equivalencia te ON te.idtablaEquivalencia = c.tablaEquivalencia_id
    GROUP BY p.idpublicacion, p.fechaPublicacion

    UNION ALL

    -- Impacto por intercambios
    SELECT 
        i.fechaCreacion AS fecha,
        SUM(mc.monto * te.factorCO2) AS impactoCO2,
        SUM(mc.monto * te.factorEnergiaKwh) AS impactoEnergia,
        SUM(mc.monto * te.factorAguaLitro) AS impactoAgua
    FROM intercambio i
    JOIN custodio_credito cc ON cc.idcustodioCredito = i.custodioCredito_id
    JOIN movimiento_credito mc ON mc.intercambio_id = i.idintercambio
    JOIN tabla_equivalencia te ON te.unidadMedida = 'credito_verde'  -- Ajusta según unidad
    GROUP BY i.idintercambio, i.fechaCreacion
) AS impacto
GROUP BY semana_inicio
ORDER BY semana_inicio;
`;
      const [rows]: any = await db.query(sql);
      return rows;
    } catch (err: any) {
      throw new Error(err?.message ?? 'Error en getImpactoSemana');
    }
  }

  // ============================================
  // OBTENER RANKING DE USUARIOS (vista v_ranking_usuarios)
  // ============================================
  async getRankingUsuariosView() {
    try {
      const sql = `SELECT * FROM v_ranking_usuarios ORDER BY bs_liberados DESC, ventas DESC, pubs DESC`;
      const [rows]: any = await db.query(sql);
      return rows;
    } catch (err: any) {
      throw new Error(err?.message ?? 'Error en getRankingUsuariosView');
    }
  }

  // ============================================
  // OBTENER TOP10 RANKING (vista top10_ranking)
  // ============================================
  async getTop10RankingView() {
    try {
      const sql = `SELECT * FROM top10_ranking`;
      const [rows]: any = await db.query(sql);
      return rows;
    } catch (err: any) {
      throw new Error(err?.message ?? 'Error en getTop10RankingView');
    }
  }

  // ============================================
  // LISTAR VISTAS EN UN SCHEMA (INFORMATION_SCHEMA.VIEWS)
  // ============================================
  async listViews(schema: string = 'mydb') {
    try {
      const sql = `
        SELECT TABLE_NAME AS vista, VIEW_DEFINITION
        FROM INFORMATION_SCHEMA.VIEWS
        WHERE TABLE_SCHEMA = ?
        ORDER BY TABLE_NAME
      `;
      const [rows]: any = await db.query(sql, [schema]);
      return rows;
    } catch (err: any) {
      throw new Error(err?.message ?? 'Error consultando vistas en INFORMATION_SCHEMA.VIEWS');
    }
  }

  async crearPublicacionSimple(
  usuarioId: number,
  titulo: string,
  descripcion: string | null,
  valorCredito: number | null,
  estadoPublica: string | null = 'activa',
  foto: string | null = null,
  promocionId: number | null = null,
  reporteId: number | null = null
) {
  if (!usuarioId) throw new Error('usuarioId requerido');
  if (!titulo?.trim()) throw new Error('titulo requerido');

  try {
    const sql = `
      INSERT INTO publicacion
        (usuario_id, promocion_id, reporte_id, titulo, descripcion, valorCredito, fechaPublicacion, estadoPublica, foto)
      VALUES (?, ?, ?, ?, ?, ?, CURDATE(), ?, ?)
    `;

    const [result]: any = await db.query(sql, [
      usuarioId,
      promocionId,
      reporteId,
      titulo,
      descripcion,
      valorCredito,
      estadoPublica,
      foto,
    ]);

    return { idpublicacion: result.insertId };
  } catch (err: any) {
    throw new Error(err?.message ?? "Error creando publicación");
  }
}
  
  // services/usuario.service.ts (dentro de export class UsuarioService { ... })
/**
 * Devuelve un perfil consolidado usando idusuario (preferible frente a nombreUser).
 * Usa vistas útiles: v_publicaciones_impacto, v_extracto_billetera, v_impacto_semana, v_ranking_usuarios
 */
async getPerfilConsolidadoById(idusuario: number) {
  if (!idusuario || Number.isNaN(Number(idusuario))) {
    throw new Error("idusuario es requerido y debe ser numérico");
  }

  try {
    // 1) usuario + roles + saldo
    const [uRows]: any = await db.query(
      `SELECT u.idusuario,
              CONCAT(u.nombre,' ',u.apellido) AS nombre_completo,
              u.nombreUser,
              b.saldoActual AS saldo_billetera,
              u.billetera_id
       FROM usuario u
       LEFT JOIN billetera b ON u.billetera_id = b.idbilletera
       WHERE u.idusuario = ? LIMIT 1`,
      [idusuario]
    );
    const usuario = (uRows && uRows[0]) ? uRows[0] : null;

    // roles
    const [rRows]: any = await db.query(
      `SELECT r.nombreRol
       FROM usuario_rol ur
       JOIN rol r ON r.idrol = ur.idrol
       WHERE ur.idusuario = ?`,
      [idusuario]
    );
    const roles: string[] = (rRows || []).map((r: any) => r.nombreRol);

    // 2) impacto (reporte)
    const [impRows]: any = await db.query(
      `SELECT CO2, Energia, Agua, (IFNULL(CO2,0)+IFNULL(Energia,0)+IFNULL(Agua,0)) AS impactoTotal
       FROM reporte
       WHERE usuario_id = ? LIMIT 1`,
      [idusuario]
    );
    const impacto = (impRows && impRows[0]) ? impRows[0] : { CO2: 0, Energia: 0, Agua: 0, impactoTotal: 0 };

    // 3) publicaciones del usuario (usa v_publicaciones_impacto para impacto calculado)
    const [pubRows]: any = await db.query(
      `SELECT p.idpublicacion, p.titulo, p.descripcion, p.valorCredito, p.estadoPublica, p.fechaPublicacion, p.foto,
              v.impactoTotal, v.impactoCO2, v.impactoEnergia, v.impactoAgua
       FROM publicacion p
       LEFT JOIN v_publicaciones_impacto v ON v.idpublicacion = p.idpublicacion
       WHERE p.usuario_id = ?
       ORDER BY p.fechaPublicacion DESC
       LIMIT 200`,
      [idusuario]
    );

    // 4) intercambios pendientes relacionados al usuario (comprador o vendedor)
    const [intRows]: any = await db.query(
      `SELECT i.idintercambio, i.usuario_origen_id, i.usuario_destino_id, i.cantidad, i.creditoVerde,
              i.estadoIntercam, i.fechaCreacion, p.idpublicacion, p.titulo AS publicacion,
              u1.nombreUser AS comprador, u2.nombreUser AS vendedor
       FROM intercambio i
       LEFT JOIN publicacion p ON i.publicacion_id = p.idpublicacion
       LEFT JOIN usuario u1 ON i.usuario_origen_id = u1.idusuario
       LEFT JOIN usuario u2 ON i.usuario_destino_id = u2.idusuario
       WHERE (i.usuario_origen_id = ? OR i.usuario_destino_id = ?) 
         AND i.estadoIntercam IN ('pendiente','en_proceso')
       ORDER BY i.fechaCreacion DESC`,
      [idusuario, idusuario]
    );

    // 5) compras completadas (como comprador o vendedor)
    const [compRows]: any = await db.query(
      `SELECT i.idintercambio, i.usuario_origen_id, i.usuario_destino_id, i.cantidad, i.creditoVerde,
              i.estadoIntercam, i.fechaCreacion, i.fechaFinal, p.idpublicacion, p.titulo AS publicacion,
              u1.nombreUser AS comprador, u2.nombreUser AS vendedor
       FROM intercambio i
       LEFT JOIN publicacion p ON i.publicacion_id = p.idpublicacion
       LEFT JOIN usuario u1 ON i.usuario_origen_id = u1.idusuario
       LEFT JOIN usuario u2 ON i.usuario_destino_id = u2.idusuario
       WHERE (i.usuario_origen_id = ? OR i.usuario_destino_id = ?) 
         AND i.estadoIntercam = 'completado'
       ORDER BY i.fechaFinal DESC
       LIMIT 200`,
      [idusuario, idusuario]
    );

    // 6) extracto de billetera (vista v_extracto_billetera) — la vista tiene nombreUser; necesitamos nombreUser del usuario
    const nombreUser = usuario?.nombreUser ?? null;
    let extracto: any[] = [];
    if (nombreUser) {
      const [extRows]: any = await db.query(
        `SELECT * FROM v_extracto_billetera WHERE nombreUser = ? ORDER BY fechaMovimiento DESC LIMIT 200`,
        [nombreUser]
      );
      extracto = extRows || [];
    }

    // 7) ultimo acceso (bitacora_acceso) — la tabla guarda campo 'usuario' = nombreUser
    let ultimoAcceso: any = null;
    if (nombreUser) {
      const [baRows]: any = await db.query(
        `SELECT usuario, ip, user_agent, exito, motivo, fecha 
         FROM bitacora_acceso 
         WHERE usuario = ? 
         ORDER BY fecha DESC LIMIT 1`,
        [nombreUser]
      );
      ultimoAcceso = (baRows && baRows[0]) ? baRows[0] : null;
    }

    // 8) impacto por semana — usar vista v_impacto_semana (puede devolver varias semanas)
    const [impSemRows]: any = await db.query(
      `SELECT semana_inicio, co2, energia, agua FROM v_impacto_semana ORDER BY semana_inicio DESC LIMIT 8`
    );
    const impactoSemana = impSemRows || [];

    // 9) ranking / actividad del usuario usando v_ranking_usuarios (si existe)
    let rankingRow: any = null;
    try {
      const [rankRows]: any = await db.query(
        `SELECT * FROM v_ranking_usuarios WHERE idusuario = ? LIMIT 1`,
        [idusuario]
      );
      rankingRow = (rankRows && rankRows[0]) ? rankRows[0] : null;
    } catch (e) {
      // si la vista no existe, ignorar y seguir
      rankingRow = null;
    }

    // 10) resumen rápido: counts
    const publicacionesCount = Array.isArray(pubRows) ? pubRows.length : 0;
    const pendientesCount = Array.isArray(intRows) ? intRows.length : 0;
    const completadasCount = Array.isArray(compRows) ? compRows.length : 0;

    return {
      usuario,
      roles,
      impacto,
      publicaciones: pubRows || [],
      intercambiosPendientes: intRows || [],
      comprasCompletadas: compRows || [],
      extracto,
      ultimoAcceso,
      impactoSemana,
      ranking: rankingRow,
      resumen: {
        publicacionesCount,
        pendientesCount,
        completadasCount
      }
    };
  } catch (err: any) {
    throw new Error(err?.message ?? "Error en getPerfilConsolidadoById");
  }
}

// ============================================
// SP: sp_resumen_ganancias(p_fecha_ini, p_fecha_fin)
// Devuelve: { global: {...}, desglose: [...], topCompradores: [...] }
// ============================================
async spResumenGanancias(fechaIni: string | Date, fechaFin: string | Date) {
  if (!fechaIni || !fechaFin) throw new Error("fechaIni y fechaFin son requeridos");

  try {
    // CALL devuelve múltiples resultsets: [ rs1, rs2, rs3, ... ]
    const [rows]: any = await db.query(`CALL sp_resumen_ganancias(?, ?)`, [fechaIni, fechaFin]);

    // rows puede venir como:
    // - un array donde rows[0] = resultset1, rows[1]=resultset2, rows[2]=resultset3
    // - o directamente rows[0] conteniendo el primer resultset (dependiendo del driver)
    const rs1 = Array.isArray(rows) && Array.isArray(rows[0]) ? rows[0] : (Array.isArray(rows) ? rows[0] : rows);
    const rs2 = Array.isArray(rows) && rows.length > 1 ? rows[1] : [];
    const rs3 = Array.isArray(rows) && rows.length > 2 ? rows[2] : [];

    // Normalizar global (primer resultset, fila 0)
    const globalRow = (Array.isArray(rs1) && rs1.length > 0) ? rs1[0] : (rs1 && rs1[0]) ? rs1[0] : null;
    const global = {
      total_compras: Number(globalRow?.total_compras ?? 0),
      ventas_brutas_bs: Number(globalRow?.ventas_brutas_bs ?? 0),
      ingresos_plataforma_bs: Number(globalRow?.ingresos_plataforma_bs ?? 0)
    };

    // Desglose (segundo resultset)
    const desglose = Array.isArray(rs2) ? rs2.map((r: any) => ({
      tipo: r.tipo ?? 'sin_tipo',
      transacciones: Number(r.transacciones ?? 0),
      monto_total_bs: Number(r.monto_total_bs ?? 0)
    })) : [];

    // Top compradores (tercer resultset)
    const topCompradores = Array.isArray(rs3) ? rs3.map((r: any) => ({
      idusuario: r.idusuario,
      nombreUser: r.nombreUser,
      num_compras: Number(r.num_compras ?? 0),
      total_gastado_bs: Number(r.total_gastado_bs ?? 0)
    })) : [];

    return { global, desglose, topCompradores };
  } catch (err: any) {
    throw new Error(err?.message ?? 'Error en spResumenGanancias');
  }
}

// ============================================
// SP: sp_compra_creditos(p_usuario_id, p_montoBs, p_creditos, p_metodo)
// Devuelve: { success: boolean, idcompra: number | null }
// ============================================
async spCompraCreditos(
  usuarioId: number,
  montoBs: number,
  creditos: number,
  metodo: string = "tarjeta"
) {
  if (!usuarioId || !montoBs || !creditos)
    throw new Error(
      "Parámetros inválidos: usuarioId, montoBs, creditos son requeridos"
    );

  try {
    // No destructuramos inicialmente: guardamos el resultado tal cual para inspección.
    const result: any = await db.query(`CALL sp_compra_creditos(?, ?, ?, ?)`, [
      usuarioId,
      montoBs,
      creditos,
      metodo,
    ]);

    // DEBUG: inspecciona el resultado real para ver su forma.
    // Quita o comenta esta línea en producción.
    console.dir(result, { depth: 4 });

    // Normalizar `rows` desde distintos formatos que pueden devolver mysql/mysql2:
    // - mysql2 (promise) normalmente devuelve [rows, fields]
    // - rows para CALL suele ser un array de resultsets: [ [ { idcompra: 1 } ], ... ]
    // - algunos drivers devuelven directamente rows
    let rows: any = null;

    if (Array.isArray(result) && result.length > 0) {
      // si es [rows, fields] o [ resultset1, resultset2, ... ]
      // preferimos tomar result[0] como candidateRows
      rows = result[0];
    } else {
      rows = result;
    }

    // A partir de aquí `rows` puede ser:
    // - un array con el primer resultset: [ { idcompra: 123 } ]
    // - un array de resultsets: [ [ { idcompra: 123 } ], ... ]
    // - un objeto que contiene idcompra directamente
    let idcompra: number | null = null;

    // Caso: rows es array y su primer elemento es otro array (resultset)
    if (Array.isArray(rows) && rows.length > 0) {
      const first = rows[0];

      if (Array.isArray(first) && first.length > 0 && first[0].idcompra !== undefined) {
        idcompra = Number(first[0].idcompra);
      } else if (first && first.idcompra !== undefined) {
        // rows[0] es un objeto con idcompra
        idcompra = Number(first.idcompra);
      } else if (rows[0] && rows[0].idcompra !== undefined) {
        // rows es array de objetos
        idcompra = Number(rows[0].idcompra);
      }
    } else if (rows && typeof rows === "object" && rows.idcompra !== undefined) {
      // Caso: rows es un objeto directo con idcompra
      idcompra = Number(rows.idcompra);
    }

    return { success: true, idcompra };
  } catch (err: any) {
    // Proporciona info más rica en el log para depuración
    console.error("Error en spCompraCreditos - detalles:", {
      message: err?.message,
      code: err?.code,
      sqlMessage: err?.sqlMessage,
      stack: err?.stack,
    });

    // Si el SP lanzó SIGNAL con un message, suele venir en err.message o err.sqlMessage.
    const mensaje = err?.message ?? err?.sqlMessage ?? "Error en sp_compra_creditos";
    // Re-lanzamos con info útil (puedes ajustar el mensaje para no filtrar detalles sensibles)
    throw new Error(`Error al procesar compra de créditos: ${mensaje}`);
  }
}

// ============================================
// SP: sp_confirmar_compra_creditos(p_idcomp, p_montoBs, p_metodo)
// Devuelve: { success: boolean }
// ============================================
async spConfirmarCompraCreditos(idcomp: number, montoBs: number, metodo: string = 'tarjeta') {
  if (!idcomp || !montoBs) throw new Error('Parámetros inválidos: idcomp y montoBs son requeridos');

  try {
    await db.query(`CALL sp_confirmar_compra_creditos(?, ?, ?)`, [idcomp, montoBs, metodo]);
    return { success: true };
  } catch (err: any) {
    throw new Error(err?.message ?? 'Error en sp_confirmar_compra_creditos');
  }
}

async spObtenerUsuario(p_idusuario: number) {
  if (p_idusuario === undefined || p_idusuario === null || Number.isNaN(Number(p_idusuario))) {
    throw new Error("p_idusuario es requerido y debe ser numérico");
  }

  try {
    const result: any = await db.query(`CALL sp_obtener_usuario(?)`, [p_idusuario]);

    // Normalizar/extraer el primer resultset de forma robusta
    // result puede ser: [ rows, fields ] o [ [rows], ... ] dependiendo del driver/SP
    let rowsCandidate: any;
    if (Array.isArray(result) && result.length > 0) {
      rowsCandidate = result[0];
    } else {
      rowsCandidate = result;
    }

    // rowsCandidate puede ser un array (resultset) o un objeto
    const filas = Array.isArray(rowsCandidate) ? rowsCandidate : (rowsCandidate ? [rowsCandidate] : []);
    const fila = filas[0] ?? null;

    if (!fila) {
      throw new Error("Usuario no encontrado");
    }

    // Devolver la fila CRUDA exactamente como vino del driver
    return fila;
  } catch (err: any) {
    console.error("Error en spObtenerUsuario - detalles:", {
      message: err?.message,
      code: err?.code,
      sqlMessage: err?.sqlMessage,
      sqlState: err?.sqlState,
      stack: err?.stack,
    });

    const mensajeSql = err?.sqlMessage ?? err?.message ?? "";
    if (err?.code === "ER_SIGNAL_EXCEPTION" || mensajeSql.toLowerCase().includes("usuario no encontrado")) {
      throw new Error("Usuario no encontrado");
    }

    throw new Error(err?.sqlMessage ?? err?.message ?? "Error en sp_obtener_usuario");
  }
}

async spCompraSuscripcion(p_usuario_id: number, p_meses: number, p_monto: number) {
  if (!p_usuario_id || !p_meses || !p_monto) {
    throw new Error("p_usuario_id, p_meses y p_monto son requeridos");
  }

  try {
    const result: any = await db.query(
      `CALL sp_compra_suscripcion(?, ?, ?)`,
      [p_usuario_id, p_meses, p_monto]
    );

    // Devuelve el resultado crudo tal cual (puede ser [rows, fields])
    return result;

  } catch (err: any) {
    console.error("Error en spCompraSuscripcion - detalles:", {
      message: err?.message,
      code: err?.code,
      sqlMessage: err?.sqlMessage,
      sqlState: err?.sqlState,
      stack: err?.stack,
    });

    const msg = err?.sqlMessage ?? err?.message ?? "Error en sp_compra_suscripcion";

    // Detectar SIGNAL del SP
    if (err?.code === "ER_SIGNAL_EXCEPTION") {
      throw new Error(msg);
    }

    throw new Error(msg);
  }
}

async obtenerPlataformaIngresos() {
  try {
    const result: any = await db.query(
      `SELECT * FROM plataforma_ingresos ORDER BY fecha DESC`
    );

    // result normalmente viene como [rows, fields]
    return result[0]; // devuelve solo las filas

  } catch (err: any) {
    console.error("Error en obtenerPlataformaIngresos - detalles:", {
      message: err?.message,
      code: err?.code,
      sqlMessage: err?.sqlMessage,
      sqlState: err?.sqlState,
      stack: err?.stack,
    });

    const msg = err?.sqlMessage ?? err?.message ?? "Error al obtener ingresos de la plataforma";
    throw new Error(msg);
  }
}

async getTotal() {
    try {
      const sql = `SELECT
    YEARWEEK(fechaCompra, 1) AS semana_inicio,
    COUNT(*) AS cantidad_ventas,
    SUM(montoBs) AS total_ventas
FROM compra_credito
-- opcional: filtrar solo compras completadas si hay un estado, ej: WHERE estado = 'completada'
GROUP BY semana_inicio
ORDER BY semana_inicio;`;
      const [rows]: any = await db.query(sql);
      return rows;
    } catch (err: any) {
      throw new Error(err?.message ?? 'Error en getTotal');
    }
  }

}

// Tipo local (si no lo tienes importado)

