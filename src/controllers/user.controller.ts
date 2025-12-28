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

  async obtenerCategorias(req: Request, res: Response) {
  try {
    console.log("obteniendo categorias");

    const data = await usuarioService.obtenerCategorias(); // ← función que ya te generé

    return res.status(200).json({
      success: true,
      data
    });

  } catch (err: any) {
    console.error("Error obtenerCategorias:", err);

    return res.status(500).json({
      success: false,
      message: err?.message ?? "Error al obtener las categorias"
    });
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
      const { usuarioId, nombreCategoria, unidadMedida, titulo, descripcion, valorCredito, cantidadUnidad,foto } = req.body;
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
        Number(cantidadUnidad),
        String(foto)
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
      console.log(req.body)
      if (![compradorId, idpublicacion, cantidad].every(Boolean)) return res.status(400).json({ success:false, message: "Faltan parámetros" });
      const result = await usuarioService.iniciarCompraConCreditoVerde(Number(compradorId), Number(idpublicacion), Number(cantidad));
      console.log(result)
      return res.json({ success: true, data: result });
    } catch (err: any) {
      console.log(err)
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

  // DELETE /user/:id   OR body { idusuario }
async eliminarUsuario(req: Request, res: Response) {
  try {
    // permitir id por params o body
    const idParam = req.params.id || req.body.idusuario || req.body.id;
    const idusuario = Number(idParam);
    if (!idusuario || Number.isNaN(idusuario)) {
      return res.status(400).json({ success: false, message: "p_idusuario es requerido y debe ser numérico" });
    }

    // Llamada al service (asume que usuarioService.eliminarUsuario está implementado)
    const result = await usuarioService.eliminarUsuario(idusuario);

    return res.json({ success: true, data: result });
  } catch (err: any) {
    console.error("Error eliminarUsuario:", err);
    const msg = err?.message || "Error al eliminar usuario";
    // Si SP lanzó SIGNAL con texto claro, lo devolvemos
    return res.status(500).json({ success: false, message: msg });
  }
}

// DELETE /publicacion/:id   OR body { idpublicacion }
async eliminarPublicacion(req: Request, res: Response) {
  try {
    const idParam = req.params.id || req.body.idpublicacion || req.body.id;
    const idpublicacion = Number(idParam);
    if (!idpublicacion || Number.isNaN(idpublicacion)) {
      return res.status(400).json({ success: false, message: "p_idpublicacion es requerido y debe ser numérico" });
    }

    const result = await usuarioService.eliminarPublicacion(idpublicacion);
    return res.json({ success: true, data: result });
  } catch (err: any) {
    console.error("Error eliminarPublicacion:", err);
    const msg = err?.message || "Error al eliminar publicación";
    return res.status(500).json({ success: false, message: msg });
  }
}

// POST /compras/creditos
async compraCreditos(req: Request, res: Response) {
  try {
    const { usuarioId, montoBs, creditos, metodo } = req.body;
    if (![usuarioId, montoBs, creditos].every((v) => v !== undefined && v !== null && v !== '')) {
      return res.status(400).json({ success: false, message: "usuarioId, montoBs y creditos son requeridos" });
    }

    const usuarioIdN = Number(usuarioId);
    const montoN = Number(montoBs);
    const creditosN = Number(creditos);
    if ([usuarioIdN, montoN, creditosN].some((n) => Number.isNaN(n))) {
      return res.status(400).json({ success: false, message: "Parámetros numéricos inválidos" });
    }

    const metodoStr = String(metodo ?? "tarjeta");

    const result = await usuarioService.compraCreditos(usuarioIdN, montoN, creditosN, metodoStr);

    return res.json({ success: true, data: result });
  } catch (err: any) {
    console.error("Error compraCreditos:", err);
    return res.status(500).json({ success: false, message: err?.message || "Error al comprar créditos" });
  }
}

// GET /buscar/publicaciones?texto=...&categoria=...&offset=0&limit=50
async buscarPublicaciones(req: Request, res: Response) {
  try {
    const texto = (req.query.texto as string) ?? (req.query.q as string) ?? null;
    const categoria = (req.query.categoria as string) ?? null;
    const offset = Number(req.query.offset ?? 0);
    const limit = Number(req.query.limit ?? 50);

    if (offset < 0 || Number.isNaN(offset) || limit <= 0 || Number.isNaN(limit)) {
      return res.status(400).json({ success: false, message: "offset/limit inválidos" });
    }

    const rows = await usuarioService.buscarPublicaciones(texto, categoria, offset, limit);
    // rows puede ser array de resultados ya
    return res.json({ success: true, data: rows, count: Array.isArray(rows) ? rows.length : undefined });
  } catch (err: any) {
    console.error("Error buscarPublicaciones:", err);
    return res.status(500).json({ success: false, message: err?.message || "Error buscando publicaciones" });
  }
}

// PUT /publicacion  (body con idpublicacion y campos a modificar)
async modificarPublicacion(req: Request, res: Response) {
  try {
    const {
      idpublicacion,
      titulo,
      descripcion,
      valorCredito,
      estado,
      foto
    } = req.body;

    if (!idpublicacion) {
      return res.status(400).json({ success: false, message: "p_idpublicacion es requerido" });
    }

    const id = Number(idpublicacion);
    if (Number.isNaN(id)) {
      return res.status(400).json({ success: false, message: "p_idpublicacion debe ser numérico" });
    }

    const valorN = valorCredito !== undefined && valorCredito !== null && valorCredito !== '' ? Number(valorCredito) : null;
    if (valorCredito !== undefined && valorCredito !== null && valorCredito !== '' && Number.isNaN(valorN)) {
      return res.status(400).json({ success: false, message: "valorCredito inválido" });
    }

    const result = await usuarioService.modificarPublicacion(
      id,
      titulo ?? null,
      descripcion ?? null,
      valorN,
      estado ?? null,
      foto ?? null
    );

    return res.json({ success: true, data: result });
  } catch (err: any) {
    console.error("Error modificarPublicacion:", err);
    return res.status(500).json({ success: false, message: err?.message || "Error al modificar publicación" });
  }
}

    // ==================================================
  // GET /impacto/semana
  // ==================================================
  async getImpactoSemana(req: Request, res: Response) {
    try {
      const rows = await usuarioService.getImpactoSemana();
      const response: ApiResponse<typeof rows> = {
        success: true,
        data: rows,
        count: Array.isArray(rows) ? rows.length : 0
      };
      return res.json(response);
    } catch (err: any) {
      console.error("Error getImpactoSemana:", err);
      return res.status(500).json({ success: false, message: err?.message || "Error consultando impacto por semana" });
    }
  }

  // ==================================================
  // GET /ranking/usuarios
  // ==================================================
  async getRankingUsuariosView(req: Request, res: Response) {
    try {
      const rows = await usuarioService.getRankingUsuariosView();
      const response: ApiResponse<typeof rows> = {
        success: true,
        data: rows,
        count: Array.isArray(rows) ? rows.length : 0
      };
      return res.json(response);
    } catch (err: any) {
      console.error("Error getRankingUsuariosView:", err);
      return res.status(500).json({ success: false, message: err?.message || "Error consultando ranking de usuarios" });
    }
  }

  // ==================================================
  // GET /ranking/top10
  // ==================================================
  async getTop10RankingView(req: Request, res: Response) {
    try {
      const rows = await usuarioService.getTop10RankingView();
      const response: ApiResponse<typeof rows> = {
        success: true,
        data: rows,
        count: Array.isArray(rows) ? rows.length : 0
      };
      return res.json(response);
    } catch (err: any) {
      console.error("Error getTop10RankingView:", err);
      return res.status(500).json({ success: false, message: err?.message || "Error consultando top10 ranking" });
    }
  }

  // ==================================================
  // GET /views?schema=mydb
  // ==================================================
  async listViews(req: Request, res: Response) {
    try {
      const schema = String(req.query.schema || "mydb");
      const rows = await usuarioService.listViews(schema);
      return res.json({ success: true, data: rows, count: Array.isArray(rows) ? rows.length : 0 });
    } catch (err: any) {
      console.error("Error listViews:", err);
      return res.status(500).json({ success: false, message: err?.message || "Error listando vistas" });
    }
  }

  // POST /publicacion
async crearPublicacionSimple(req: Request, res: Response) {
  try {
    const {
      usuarioId,
      titulo,
      descripcion,
      valorCredito,
      estadoPublica,
      foto,
      promocionId,
      reporteId
    } = req.body;

    // Validaciones básicas
    if (!usuarioId) return res.status(400).json({ success: false, message: "usuarioId es requerido" });
    if (!titulo || !String(titulo).trim()) return res.status(400).json({ success: false, message: "titulo es requerido" });

    const usuarioIdN = Number(usuarioId);
    if (Number.isNaN(usuarioIdN)) return res.status(400).json({ success: false, message: "usuarioId debe ser numérico" });

    const valorN = (valorCredito !== undefined && valorCredito !== null && valorCredito !== '') ? Number(valorCredito) : null;
    if (valorCredito !== undefined && valorCredito !== null && valorCredito !== '' && Number.isNaN(valorN)) {
      return res.status(400).json({ success: false, message: "valorCredito inválido" });
    }

    const promocionIdN = promocionId ? Number(promocionId) : null;
    const reporteIdN = reporteId ? Number(reporteId) : null;

    // Llamada al service (asegúrate que el método exista)
    const result = await usuarioService.crearPublicacionSimple(
      usuarioIdN,
      String(titulo),
      descripcion ?? null,
      valorN,
      estadoPublica ?? 'activa',
      foto ?? null,
      promocionIdN,
      reporteIdN
    );

    return res.status(201).json({ success: true, message: "Publicación creada", data: result });
  } catch (err: any) {
    console.error("Error crearPublicacionSimple:", err);
    return res.status(500).json({ success: false, message: err?.message || "Error creando publicación" });
  }
}

  // controllers/user.controller.ts (dentro de export class UsuarioController { ... })
async getPerfilConsolidado(req: Request, res: Response) {
  try {
    const idParam = req.query.idusuario || req.query.id || req.body.idusuario || req.body.id;
    const idusuario = Number(idParam);
    if (!idusuario || Number.isNaN(idusuario)) {
      return res.status(400).json({ success: false, message: "idusuario es requerido y debe ser numérico" });
    }

    const result = await usuarioService.getPerfilConsolidadoById(idusuario);
    return res.json({ success: true, data: result });
  } catch (err: any) {
    console.error("Error getPerfilConsolidado:", err);
    return res.status(500).json({ success: false, message: err?.message || "Error consultando perfil consolidado" });
  }
}

// GET /resumen/ganancias?fechaIni=YYYY-MM-DD&fechaFin=YYYY-MM-DD
async resumenGanancias(req: Request, res: Response) {
  try {
    const fechaIni = (req.query.fechaIni as string) || (req.query.fecha_inicio as string);
    const fechaFin = (req.query.fechaFin as string) || (req.query.fecha_fin as string);

    if (!fechaIni || !fechaFin) {
      return res.status(400).json({ success: false, message: "fechaIni y fechaFin son requeridos (YYYY-MM-DD)" });
    }

    // opcional: validar formato YYYY-MM-DD rápido
    const d1 = new Date(fechaIni);
    const d2 = new Date(fechaFin);
    if (isNaN(d1.getTime()) || isNaN(d2.getTime())) {
      return res.status(400).json({ success: false, message: "Formato de fecha inválido" });
    }

    const result = await usuarioService.spResumenGanancias(fechaIni, fechaFin);
    return res.json({ success: true, data: result });
  } catch (err: any) {
    console.error("Error resumenGanancias:", err);
    return res.status(500).json({ success: false, message: err?.message || "Error consultando resumen de ganancias" });
  }
}

// POST /sp/compra-creditos   body: { usuarioId, montoBs, creditos, metodo }
async compraCreditosSP(req: Request, res: Response) {
  try {
    const { usuarioId, montoBs, creditos, metodo } = req.body;
    if (![usuarioId, montoBs, creditos].every((v) => v !== undefined && v !== null && v !== '')) {
      return res.status(400).json({ success: false, message: "usuarioId, montoBs y creditos son requeridos" });
    }

    const usuarioIdN = Number(usuarioId);
    const montoN = Number(montoBs);
    const creditosN = Number(creditos);
    if ([usuarioIdN, montoN, creditosN].some((n) => Number.isNaN(n))) {
      return res.status(400).json({ success: false, message: "Parámetros numéricos inválidos" });
    }

    const metodoStr = String(metodo ?? "tarjeta");

    // Llamada a la versión del service que invoca el SP directamente
    console.log("Llamando a spCompraCreditos con:", { usuarioIdN, montoN, creditosN, metodoStr });
    const result = await usuarioService.spCompraCreditos(usuarioIdN, montoN, creditosN, metodoStr);

    return res.status(201).json({ success: true, data: result });
  } catch (err: any) {
    console.error("Error compraCreditosSP:", err);
    return res.status(500).json({ success: false, message: err?.message ?? "Error ejecutando sp_compra_creditos" });
  }
}

// POST /sp/confirmar-compra   body: { idcomp, montoBs, metodo }
async confirmarCompraCreditos(req: Request, res: Response) {
  try {
    const { idcomp, montoBs, metodo } = req.body;
    if (idcomp === undefined || montoBs === undefined) {
      return res.status(400).json({ success: false, message: "idcomp y montoBs son requeridos" });
    }

    const idcompN = Number(idcomp);
    const montoN = Number(montoBs);
    if (Number.isNaN(idcompN) || Number.isNaN(montoN)) {
      return res.status(400).json({ success: false, message: "idcomp o montoBs inválidos" });
    }

    const metodoStr = String(metodo ?? "tarjeta");

    await usuarioService.spConfirmarCompraCreditos(idcompN, montoN, metodoStr);
    return res.json({ success: true, message: "Compra confirmada" });
  } catch (err: any) {
    console.error("Error confirmarCompraCreditos:", err);
    return res.status(500).json({ success: false, message: err?.message ?? "Error ejecutando sp_confirmar_compra_creditos" });
  }
}

async obtenerUsuario(req: Request, res: Response) {
  try {
    // aceptar id desde params (/usuario/:id), body o query
    const rawId = req.params.id ?? req.body.id ?? req.query.id;

    if (rawId === undefined || rawId === null || rawId === "") {
      return res.status(400).json({ success: false, message: "id usuario es requerido (params|body|query)" });
    }

    const idN = Number(rawId);
    if (Number.isNaN(idN) || !Number.isInteger(idN) || idN <= 0) {
      return res.status(400).json({ success: false, message: "id usuario inválido" });
    }

    // Llamada al service que invoca el SP
    console.log("Llamando a spObtenerUsuario con id:", idN);
    const usuario = await usuarioService.spObtenerUsuario(idN);

    // Si el servicio decide devolver null/undefined en vez de lanzar, manejarlo:
    if (!usuario) {
      return res.status(404).json({ success: false, message: "Usuario no encontrado" });
    }

    return res.status(200).json({ success: true, data: usuario });
  } catch (err: any) {
    console.error("Error obtenerUsuario:", err);

    // Si el SP lanzó SIGNAL con 'Usuario no encontrado' (mysql2 -> ER_SIGNAL_EXCEPTION),
    // normalizamos a 404 para el cliente.
    const sqlMsg = String(err?.sqlMessage ?? err?.message ?? "").toLowerCase();
    if (err?.code === "ER_SIGNAL_EXCEPTION" || sqlMsg.includes("usuario no encontrado")) {
      return res.status(404).json({ success: false, message: "Usuario no encontrado" });
    }

    return res.status(500).json({ success: false, message: err?.message ?? "Error ejecutando sp_obtener_usuario" });
  }
}

async compraSuscripcion(req: Request, res: Response) {
  try {
    const { usuarioId, meses, monto } = req.body;

    // Validación básica
    if ([usuarioId, meses, monto].some(v => v === undefined || v === null || v === "")) {
      return res.status(400).json({
        success: false,
        message: "usuarioId, meses y monto son requeridos"
      });
    }

    const usuarioIdN = Number(usuarioId);
    const mesesN = Number(meses);
    const montoN = Number(monto);

    if ([usuarioIdN, mesesN, montoN].some(n => Number.isNaN(n))) {
      return res.status(400).json({
        success: false,
        message: "usuarioId, meses y monto deben ser numéricos"
      });
    }

    if (!Number.isInteger(mesesN) || mesesN <= 0) {
      return res.status(400).json({
        success: false,
        message: "meses debe ser un entero positivo"
      });
    }

    if (montoN <= 0) {
      return res.status(400).json({
        success: false,
        message: "monto debe ser mayor a 0"
      });
    }

    console.log("Llamando a spCompraSuscripcion con:", {
      usuarioIdN,
      mesesN,
      montoN
    });

    const result = await usuarioService.spCompraSuscripcion(
      usuarioIdN,
      mesesN,
      montoN
    );

    // Puedes normalizar el resultado si quieres, por ahora devolvemos tal cual
    return res.status(201).json({
      success: true,
      data: result
    });

  } catch (err: any) {
    console.error("Error compraSuscripcion:", err);

    const sqlMsg = String(err?.sqlMessage ?? err?.message ?? "").toLowerCase();

    // Si el SP hace SIGNAL con algún mensaje de negocio, puedes mapearlo aquí
    if (err?.code === "ER_SIGNAL_EXCEPTION") {
      return res.status(400).json({
        success: false,
        message: err?.sqlMessage ?? err?.message ?? "Error al procesar compra de suscripción"
      });
    }

    if (sqlMsg.includes("usuario no encontrado")) {
      return res.status(404).json({
        success: false,
        message: "Usuario no encontrado"
      });
    }

    return res.status(500).json({
      success: false,
      message: err?.message ?? "Error ejecutando sp_compra_suscripcion"
    });
  }
}

async obtenerPlataformaIngresos(req: Request, res: Response) {
  try {
    console.log("Consultando plataforma_ingresos...");

    const data = await usuarioService.obtenerPlataformaIngresos(); // ← función que ya te generé

    return res.status(200).json({
      success: true,
      data
    });

  } catch (err: any) {
    console.error("Error obtenerPlataformaIngresos:", err);

    return res.status(500).json({
      success: false,
      message: err?.message ?? "Error al obtener los ingresos de la plataforma"
    });
  }
}

async getTotal(req: Request, res: Response) {
    try {
      const rows = await usuarioService.getTotal();
      const response: ApiResponse<typeof rows> = {
        success: true,
        data: rows,
        count: Array.isArray(rows) ? rows.length : 0
      };
      return res.json(response);
    } catch (err: any) {
      console.error("Error getTotal:", err);
      return res.status(500).json({ success: false, message: err?.message || "Error consultando total" });
    }
  }

}
