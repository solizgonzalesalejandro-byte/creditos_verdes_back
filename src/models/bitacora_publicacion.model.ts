export interface BitacoraPublicacion {
  id: number;
  idpublicacion: number;
  usuario_id: number;
  accion: string | null;
  detalle: string | null;
  fecha: string | Date;
}
