// services/user.service.ts
import { db } from "../index";

export class UsuarioService {
    async getAllUsers() {
        try {
            const [rows] = await db.query('SELECT * FROM usuario');
            return rows;
        } catch (error) {
            console.error("Error en getAllUsers:", error);
            throw error;
        }
    }
}

