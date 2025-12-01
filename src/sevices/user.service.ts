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
    cantidadUnidad: number
  ) {
    try {
      // Usamos variable de sesión para capturar OUT param
      await db.query(
        `CALL sp_publicar_con_impacto(?, ?, ?, ?, ?, ?, ?, @p_idpublicacion)`,
        [usuarioId, nombreCategoria, unidadMedida, titulo, descripcion, valorCredito, cantidadUnidad]
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

}
