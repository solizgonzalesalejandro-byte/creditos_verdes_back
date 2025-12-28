import { Router } from "express";
import { UsuarioController } from "../controllers/user.controller";

const router = Router();
const usuarioController = new UsuarioController();

// Registrar usuario
router.post("/user", (req, res) =>
  usuarioController.registrarUsuarioCompleto(req, res)
);

// Modificar usuario
router.put("/user", (req, res) =>
  usuarioController.modificarUsuario(req, res)
);

// Obtener todos
router.get("/users", (req, res) =>
  usuarioController.getAllUsers(req, res)
);

router.put('/cancelarCompra',(req, res) => usuarioController.cancelarIntercambioActor(req, res));
router.post("/usuario/upsert-reporte", usuarioController.upsertReporte.bind(usuarioController));
router.post("/publicacion/con-impacto", usuarioController.publicarConImpacto.bind(usuarioController));
router.post("/usuario/recargar-billetera", usuarioController.recargarBilletera.bind(usuarioController));
router.post("/compra/iniciar", usuarioController.iniciarCompraConCreditoVerde.bind(usuarioController));
router.post("/compra/liberar", usuarioController.liberarPagoConCreditoVerde.bind(usuarioController));
router.post("/intercambio/cancelar", usuarioController.cancelarIntercambioActor.bind(usuarioController));

// Obtener lista de procedimientos almacenados (opcional: ?schema=mydb)
router.get("/procedures", usuarioController.getStoredProcedures.bind(usuarioController));

// Usuarios con roles y saldo de billetera
router.get("/usuarios/roles", usuarioController.getUsuariosConRoles.bind(usuarioController));

// Impacto por titulo (query: ?titulo=...)
router.get("/impacto/por-titulo", usuarioController.getImpactoPorTitulo.bind(usuarioController));

// Listar publicaciones
router.get("/publicaciones", usuarioController.getPublicaciones.bind(usuarioController));

// Buscar publicaciones en la vista de impacto (query: ?term=solar)
router.get("/publicaciones/impacto/search", usuarioController.searchPublicacionesImpacto.bind(usuarioController));

// Intercambios pendientes / en_proceso
router.get("/intercambios/pendientes", usuarioController.getIntercambiosPendientes.bind(usuarioController));

// Impacto agregado por usuarios
router.get("/impacto/usuarios", usuarioController.getImpactoUsuarios.bind(usuarioController));

// Usuarios más ecológicos
router.get("/usuarios/mas-ecologicos", usuarioController.getUsuariosMasEcologicos.bind(usuarioController));

// Compras / intercambios completados
router.get("/compras/completadas", usuarioController.getComprasCompletadas.bind(usuarioController));

// Bitácora de acceso (query: ?limit=200)
router.get("/bitacora/acceso", usuarioController.getBitacoraAcceso.bind(usuarioController));

// Histórico consolidado (query: ?limit=200)
router.get("/historico/consolidado", usuarioController.getHistoricoConsolidado.bind(usuarioController));

// Extracto de billetera por nombreUser (query: ?nombreUser=ale1234&limit=200)
router.get("/billetera/extracto", usuarioController.getExtractoBilletera.bind(usuarioController));

router.get("/categorias", usuarioController.obtenerCategorias.bind(usuarioController));

// Historial de compra de créditos
router.get("/compras/creditos", usuarioController.getCompraCreditos.bind(usuarioController));

// Bitácoras: intercambio y usuario (query: ?limit=200)
router.get("/bitacora/intercambio", usuarioController.getBitacoraIntercambio.bind(usuarioController));
router.get("/bitacora/usuario", usuarioController.getBitacoraUsuario.bind(usuarioController));

// router file, por ejemplo routes/usuario.routes.ts o similar
router.post("/login", (req, res) => usuarioController.login(req, res));

// Eliminar usuario (DELETE): por params o body
// Ejemplo: DELETE /user/123  ó  DELETE /user  { "idusuario": 123 }
router.delete("/user/:id", (req, res) => usuarioController.eliminarUsuario(req, res));

// Eliminar publicación (DELETE): por params o body
// Ejemplo: DELETE /publicacion/456  ó  DELETE /publicacion  { "idpublicacion": 456 }
router.delete("/publicacion/:id", (req, res) => usuarioController.eliminarPublicacion(req, res));

// Compra de créditos (POST)
// Body: { usuarioId, montoBs, creditos, metodo? }
router.post("/compras/creditos", (req, res) => usuarioController.compraCreditos(req, res));

// Buscar publicaciones (GET)
// Query: ?texto=...&categoria=...&offset=0&limit=50
router.get("/buscar/publicaciones", (req, res) => usuarioController.buscarPublicaciones(req, res));

// Modificar publicación (PUT)
// Body: { idpublicacion, titulo?, descripcion?, valorCredito?, estado?, foto? }
router.put("/publicacion", (req, res) => usuarioController.modificarPublicacion(req, res));

router.get("/impacto/semana", usuarioController.getImpactoSemana.bind(usuarioController));
router.get("/ranking/usuarios", usuarioController.getRankingUsuariosView.bind(usuarioController));
router.get("/ranking/top10", usuarioController.getTop10RankingView.bind(usuarioController));
router.get("/views", usuarioController.listViews.bind(usuarioController));

router.post("/publicacion", (req, res) => usuarioController.crearPublicacionSimple(req, res));

router.get("/perfil/me", usuarioController.getPerfilConsolidado.bind(usuarioController));

// 1) Resumen de ganancias (GET)
// Query: ?fechaIni=YYYY-MM-DD&fechaFin=YYYY-MM-DD
router.get("/resumen/ganancias", usuarioController.resumenGanancias.bind(usuarioController));

// 2) Ejecutar sp_compra_creditos (POST)
// Body: { usuarioId, montoBs, creditos, metodo? }
router.post("/sp/compra-creditos", usuarioController.compraCreditosSP.bind(usuarioController));

// 3) Ejecutar sp_confirmar_compra_creditos (POST)
// Body: { idcomp, montoBs, metodo? }
router.post("/sp/confirmar-compra", usuarioController.confirmarCompraCreditos.bind(usuarioController));

router.get('/api/usuario/:id', usuarioController.obtenerUsuario);

router.post('/api/compra-suscripcion', usuarioController.compraSuscripcion);

router.get("/plataforma/ingresos", usuarioController.obtenerPlataformaIngresos.bind(usuarioController));

router.get("/total",usuarioController.getTotal.bind(usuarioController))

export default router;
