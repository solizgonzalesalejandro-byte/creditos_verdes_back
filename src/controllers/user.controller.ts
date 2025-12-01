import { Request, Response } from "express";
import { UsuarioService } from "../sevices/user.service";
import { ApiResponse } from "../types";

const usuarioService = new UsuarioService();

export class UsuarioController {

  // ============================================
  // GET /users
  // ============================================
  async getAllUsers(req: Request, res: Response) {
    try {
      const users = await usuarioService.getAllUsers();

      const response: ApiResponse<typeof users> = {
        success: true,
        data: users,
        count: users.length
      };

      return res.json(response);

    } catch (error) {
      console.error("Error getAllUsers:", error);

      const response: ApiResponse<null> = {
        success: false,
        message: "Error al obtener usuarios"
      };

      return res.status(500).json(response);
    }
  }

  // ============================================
  // POST /user
  // ============================================
  async registrarUsuarioCompleto(req: Request, res: Response) {
    try {
      const { nombre, apellido, nombreUser, contrasenia, roles } = req.body;

      const result = await usuarioService.registrarUsuarioCompleto(
        nombre,
        apellido,
        nombreUser,
        contrasenia,
        roles
      );

      const response: ApiResponse<typeof result> = {
        success: true,
        message: "Usuario registrado correctamente",
        data: result
      };

      return res.json(response);

    } catch (error) {
      console.error("Error registrarUsuarioCompleto:", error);

      const response: ApiResponse<null> = {
        success: false,
        message: "Error al registrar usuario"
      };

      return res.status(500).json(response);
    }
  }

  // ============================================
  // PUT /user
  // ============================================
  async modificarUsuario(req: Request, res: Response) {
    try {
      const { nombreUser, nuevoNombre, nuevoApellido, nuevaContrasenia } = req.body;

      const result = await usuarioService.modificarUsuario(
        nombreUser,
        nuevoNombre,
        nuevoApellido,
        nuevaContrasenia
      );

      const response: ApiResponse<typeof result> = {
        success: true,
        message: "Usuario modificado correctamente",
        data: result
      };

      return res.json(response);

    } catch (error) {
      console.error("Error modificarUsuario:", error);

      const response: ApiResponse<null> = {
        success: false,
        message: "Error al modificar usuario"
      };

      return res.status(500).json(response);
    }
  }

  async cancelarIntercambioActor(req: Request, res: Response) {
    try {
      const { idIntercambio, actorUsuarioId } = req.body;

      if (!idIntercambio || !actorUsuarioId) {
        return res.status(400).json({
          success: false,
          message: "Faltan parámetros: idIntercambio y actorUsuarioId son requeridos",
        });
      }

      const result = await usuarioService.cancelarCompraActor(
        Number(idIntercambio),
        Number(actorUsuarioId)
      );

      // El SP puede lanzar SIGNAL que llegaría al catch; si llega aquí se considera éxito.
      return res.status(200).json({
        success: true,
        message: "Cancelación ejecutada correctamente",
        data: result,
      });
    } catch (error: any) {
      // Si el SP hizo SIGNAL, aquí llega con error.message (por ejemplo 'Intercambio no existe' o similar)
      const status = 500;
      return res.status(status).json({
        success: false,
        message: error.message || "Error al cancelar intercambio",
      });
    }
  }

  async upsertReporte(req: Request, res: Response) {
    try {
      const { usuarioId, CO2, Energia, Agua } = req.body;
      if (![usuarioId].every(Boolean)) return res.status(400).json({ success:false, message: "usuarioId requerido" });

      await usuarioService.upsertReporte(Number(usuarioId), Number(CO2 || 0), Number(Energia || 0), Number(Agua || 0));
      return res.json({ success: true, message: "Reporte actualizado" });
    } catch (err: any) {
      return res.status(500).json({ success:false, message: err.message });
    }
  }

  async publicarConImpacto(req: Request, res: Response) {
    try {
      const { usuarioId, nombreCategoria, unidadMedida, titulo, descripcion, valorCredito, cantidadUnidad } = req.body;
      if (![usuarioId, nombreCategoria, unidadMedida, titulo, valorCredito, cantidadUnidad].every(Boolean)) {
        return res.status(400).json({ success:false, message: "Faltan parámetros" });
      }
      const result = await usuarioService.publicarConImpacto(
        Number(usuarioId),
        String(nombreCategoria),
        String(unidadMedida),
        String(titulo),
        String(descripcion || ""),
        Number(valorCredito),
        Number(cantidadUnidad)
      );
      return res.json({ success: true, data: result });
    } catch (err: any) {
      return res.status(500).json({ success:false, message: err.message });
    }
  }

  async recargarBilletera(req: Request, res: Response) {
    try {
      const { usuarioId, monto, descripcion } = req.body;
      if (!usuarioId || !monto) return res.status(400).json({ success:false, message: "usuarioId y monto son requeridos" });
      const result = await usuarioService.recargarBilletera(Number(usuarioId), Number(monto), descripcion);
      return res.json({ success: true, data: result });
    } catch (err: any) {
      return res.status(500).json({ success:false, message: err.message });
    }
  }

  async iniciarCompraConCreditoVerde(req: Request, res: Response) {
    try {
      const { compradorId, idpublicacion, cantidad } = req.body;
      if (![compradorId, idpublicacion, cantidad].every(Boolean)) return res.status(400).json({ success:false, message: "Faltan parámetros" });
      const result = await usuarioService.iniciarCompraConCreditoVerde(Number(compradorId), Number(idpublicacion), Number(cantidad));
      return res.json({ success: true, data: result });
    } catch (err: any) {
      return res.status(500).json({ success:false, message: err.message });
    }
  }

  async liberarPagoConCreditoVerde(req: Request, res: Response) {
    try {
      const { idintercambio } = req.body;
      if (!idintercambio) return res.status(400).json({ success:false, message: "idintercambio es requerido" });
      const result = await usuarioService.liberarPagoConCreditoVerde(Number(idintercambio));
      return res.json({ success: true, data: result });
    } catch (err: any) {
      return res.status(500).json({ success:false, message: err.message });
    }
  }

  async getStoredProcedures(req: Request, res: Response) {
    try {
      const schema = String(req.query.schema || "mydb");
      const rows = await usuarioService.getStoredProcedures(schema);
      return res.json({ success: true, data: rows, count: rows.length });
    } catch (err: any) {
      console.error("Error getStoredProcedures:", err);
      return res.status(500).json({ success:false, message: err.message || "Error consultando procedimientos" });
    }
  }

  // ==================================================
  // GET /usuarios/roles
  // ==================================================
  async getUsuariosConRoles(req: Request, res: Response) {
    try {
      const rows = await usuarioService.getUsuariosConRoles();
      return res.json({ success: true, data: rows, count: rows.length });
    } catch (err: any) {
      console.error("Error getUsuariosConRoles:", err);
      return res.status(500).json({ success:false, message: err.message || "Error consultando usuarios con roles" });
    }
  }

  // ==================================================
  // GET /impacto/por-titulo?titulo=...
  // ==================================================
  async getImpactoPorTitulo(req: Request, res: Response) {
    try {
      const titulo = String(req.query.titulo || "");
      if (!titulo) return res.status(400).json({ success:false, message: "titulo es requerido" });
      const rows = await usuarioService.getImpactoPorTitulo(titulo);
      return res.json({ success: true, data: rows, count: rows.length });
    } catch (err: any) {
      console.error("Error getImpactoPorTitulo:", err);
      return res.status(500).json({ success:false, message: err.message || "Error consultando impacto por titulo" });
    }
  }

  // ==================================================
  // GET /publicaciones
  // ==================================================
  async getPublicaciones(req: Request, res: Response) {
    try {
      const rows = await usuarioService.getPublicaciones();
      return res.json({ success: true, data: rows, count: rows.length });
    } catch (err: any) {
      console.error("Error getPublicaciones:", err);
      return res.status(500).json({ success:false, message: err.message || "Error consultando publicaciones" });
    }
  }

  // ==================================================
  // GET /publicaciones/impacto/search?term=solar
  // ==================================================
  async searchPublicacionesImpacto(req: Request, res: Response) {
    try {
      const term = String(req.query.term || req.query.termino || "");
      if (!term) return res.status(400).json({ success:false, message: "term es requerido" });
      const rows = await usuarioService.searchPublicacionesImpacto(term);
      return res.json({ success: true, data: rows, count: rows.length });
    } catch (err: any) {
      console.error("Error searchPublicacionesImpacto:", err);
      return res.status(500).json({ success:false, message: err.message || "Error buscando publicaciones impacto" });
    }
  }

  // ==================================================
  // GET /intercambios/pendientes
  // ==================================================
  async getIntercambiosPendientes(req: Request, res: Response) {
    try {
      const rows = await usuarioService.getIntercambiosPendientes();
      return res.json({ success: true, data: rows, count: rows.length });
    } catch (err: any) {
      console.error("Error getIntercambiosPendientes:", err);
      return res.status(500).json({ success:false, message: err.message || "Error consultando intercambios pendientes" });
    }
  }

  // ==================================================
  // GET /impacto/usuarios
  // ==================================================
  async getImpactoUsuarios(req: Request, res: Response) {
    try {
      const rows = await usuarioService.getImpactoUsuarios();
      return res.json({ success: true, data: rows, count: rows.length });
    } catch (err: any) {
      console.error("Error getImpactoUsuarios:", err);
      return res.status(500).json({ success:false, message: err.message || "Error consultando impacto usuarios" });
    }
  }

  // ==================================================
  // GET /usuarios/mas-ecologicos
  // ==================================================
  async getUsuariosMasEcologicos(req: Request, res: Response) {
    try {
      const rows = await usuarioService.getUsuariosMasEcologicos();
      return res.json({ success: true, data: rows, count: rows.length });
    } catch (err: any) {
      console.error("Error getUsuariosMasEcologicos:", err);
      return res.status(500).json({ success:false, message: err.message || "Error consultando usuarios mas ecologicos" });
    }
  }

  // ==================================================
  // GET /compras/completadas
  // ==================================================
  async getComprasCompletadas(req: Request, res: Response) {
    try {
      const rows = await usuarioService.getComprasCompletadas();
      return res.json({ success: true, data: rows, count: rows.length });
    } catch (err: any) {
      console.error("Error getComprasCompletadas:", err);
      return res.status(500).json({ success:false, message: err.message || "Error consultando compras completadas" });
    }
  }

  // ==================================================
  // GET /bitacora/acceso?limit=200
  // ==================================================
  async getBitacoraAcceso(req: Request, res: Response) {
    try {
      const limit = Number(req.query.limit || 200);
      const rows = await usuarioService.getBitacoraAcceso(limit);
      return res.json({ success: true, data: rows, count: rows.length });
    } catch (err: any) {
      console.error("Error getBitacoraAcceso:", err);
      return res.status(500).json({ success:false, message: err.message || "Error consultando bitacora acceso" });
    }
  }

  // ==================================================
  // GET /historico/consolidado?limit=200
  // ==================================================
  async getHistoricoConsolidado(req: Request, res: Response) {
    try {
      const limit = Number(req.query.limit || 200);
      const rows = await usuarioService.getHistoricoConsolidado(limit);
      return res.json({ success: true, data: rows, count: rows.length });
    } catch (err: any) {
      console.error("Error getHistoricoConsolidado:", err);
      return res.status(500).json({ success:false, message: err.message || "Error consultando historico consolidado" });
    }
  }

  // ==================================================
  // GET /billetera/extracto?nombreUser=ale1234&limit=200
  // ==================================================
  async getExtractoBilletera(req: Request, res: Response) {
    try {
      const nombreUser = String(req.query.nombreUser || req.query.user || "");
      const limit = Number(req.query.limit || 200);
      if (!nombreUser) return res.status(400).json({ success:false, message: "nombreUser es requerido" });
      const rows = await usuarioService.getExtractoBilletera(nombreUser, limit);
      return res.json({ success: true, data: rows, count: rows.length });
    } catch (err: any) {
      console.error("Error getExtractoBilletera:", err);
      return res.status(500).json({ success:false, message: err.message || "Error consultando extracto billetera" });
    }
  }

  // ==================================================
  // GET /compras/creditos
  // ==================================================
  async getCompraCreditos(req: Request, res: Response) {
    try {
      const rows = await usuarioService.getCompraCreditos();
      return res.json({ success: true, data: rows, count: rows.length });
    } catch (err: any) {
      console.error("Error getCompraCreditos:", err);
      return res.status(500).json({ success:false, message: err.message || "Error consultando compra creditos" });
    }
  }

  // ==================================================
  // GET /bitacora/intercambio?limit=200
  // ==================================================
  async getBitacoraIntercambio(req: Request, res: Response) {
    try {
      const limit = Number(req.query.limit || 200);
      const rows = await usuarioService.getBitacoraIntercambio(limit);
      return res.json({ success: true, data: rows, count: rows.length });
    } catch (err: any) {
      console.error("Error getBitacoraIntercambio:", err);
      return res.status(500).json({ success:false, message: err.message || "Error consultando bitacora intercambio" });
    }
  }

  // ==================================================
  // GET /bitacora/usuario?limit=200
  // ==================================================
  async getBitacoraUsuario(req: Request, res: Response) {
    try {
      const limit = Number(req.query.limit || 200);
      const rows = await usuarioService.getBitacoraUsuario(limit);
      return res.json({ success: true, data: rows, count: rows.length });
    } catch (err: any) {
      console.error("Error getBitacoraUsuario:", err);
      return res.status(500).json({ success:false, message: err.message || "Error consultando bitacora usuario" });
    }
  }


}
