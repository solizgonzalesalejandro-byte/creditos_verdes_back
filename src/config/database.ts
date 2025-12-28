import mysql from 'mysql2/promise';

const connectDB = async () => {
  try {
    const connection = await mysql.createConnection({
      host: process.env.DB_HOST || "localhost",
      user: process.env.DB_USER || "root",
      password: process.env.DB_PASSWORD || "71718902",
      database: process.env.DB_NAME || "mydb",
      port: Number(process.env.DB_PORT) || 3306
    });

    console.log('✅ MySQL conectado exitosamente');
    return connection;
  } catch (error) {
    console.error('❌ Error al conectar a MySQL:', error);
    process.exit(1);
  }
};

export default connectDB;
