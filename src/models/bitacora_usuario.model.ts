export interface BitacoraUsuario {
  id: number;
  usuario_id: number;
  accion: string;
  detalle: string | null;
  fecha: string | Date;
}
