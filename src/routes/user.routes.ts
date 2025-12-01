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

router.put('/cancelarCompra',(req, res) =>
  usuarioController.cancelarIntercambioActor(req, res));
router.post("/usuario/upsert-reporte", usuarioController.upsertReporte.bind(usuarioController));
router.post("/publicacion/con-impacto", usuarioController.publicarConImpacto.bind(usuarioController));
router.post("/usuario/recargar-billetera", usuarioController.recargarBilletera.bind(usuarioController));
router.post("/compra/iniciar", usuarioController.iniciarCompraConCreditoVerde.bind(usuarioController));
router.post("/compra/liberar", usuarioController.liberarPagoConCreditoVerde.bind(usuarioController));
router.post("/intercambio/cancelar", usuarioController.cancelarIntercambioActor.bind(usuarioController));

// router file, por ejemplo routes/usuario.routes.ts o similar
router.post("/login", (req, res) => usuarioController.login(req, res));

export default router;
