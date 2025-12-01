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

  async login(req: Request, res: Response) {
    try {
      // Aceptar distintos nombres de campo (frontend puede usar 'user'/'password' o 'nombreUser'/'contrasenia')
      const body = req.body || {};
      const nombreUser = (body.nombreUser || body.user || "").toString();
      const contrasenia = (body.contrasenia || body.password || "").toString();
      const roles = Array.isArray(body.roles) ? body.roles : (body.roles ? [body.roles] : []);

      // ip y userAgent para registrar bitácora
      const ip = (req.headers["x-forwarded-for"] as string | undefined)?.split(",")[0]?.trim()
        || (req.socket && (req.socket.remoteAddress as string)) || "";
      const userAgent = req.headers["user-agent"] || "";

      // Llamada al service
      const result = await usuarioService.login(nombreUser, contrasenia, roles);

      // Si hubo error controlado
      if (!result.success) {
        // Registrar acceso fallido con motivo desde service (si quieres)
        await usuarioService.registrarAcceso(nombreUser, ip, userAgent, false, result.message || "Login fallido");

        return res.status(result.status || 400).json({
          success: false,
          message: result.message || "Error al iniciar sesión",
        });
      }

      // Login OK: registrar acceso exitoso con ip/ua
      await usuarioService.registrarAcceso(nombreUser, ip, userAgent, true, "Login OK");

      // Responder con info mínima (no enviar contraseña)
      return res.json({
        success: true,
        usuario: result.usuario,
        roles: result.roles,
      });

    } catch (err: any) {
      console.error("UsuarioController.login error:", err);
      return res.status(500).json({ success: false, message: "Error interno" });
    }
  }

}
