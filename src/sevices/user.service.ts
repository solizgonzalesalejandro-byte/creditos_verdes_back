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

    // 3) Si el cliente envió roles solicitados, verificar intersección
    if (Array.isArray(rolesSolicitados) && rolesSolicitados.length > 0) {
      const tieneAlguno = rolesSolicitados.some((rol) => rolesUsuario.includes(rol));
      if (!tieneAlguno) {
        await this.registrarAcceso(nombreUser, "", "", false, "Roles no autorizados");
        return { success: false, status: 403, message: "No tienes los roles requeridos" };
      }
    }

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
}
