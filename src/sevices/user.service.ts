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

}
