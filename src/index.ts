import express, { Request, Response } from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import connectDB from './config/database';

// Cargar variables de entorno
dotenv.config();

const app = express();
export let db: any;

// ✅ Conectar y guardar la conexión
const startServer = async () => {
  db = await connectDB();

  // Middlewares
  app.use(cors());
  app.use(express.json());

  // ✅ Ruta de prueba: SELECT 1 + 1
  app.get('/api/test', async (req: Request, res: Response) => {
    try {
      const [rows] = await db.query('SELECT 1 + 1 AS result');
      res.json({
        success: true,
        result: rows,
      });
    } catch (error) {
      res.status(500).json({
        success: false,
        error,
      });
    }
  });

  const PORT = process.env.PORT || 5000;
  app.listen(PORT, () => {
    console.log(`✅ Servidor corriendo en http://localhost:${PORT}`);
  });
};

startServer();