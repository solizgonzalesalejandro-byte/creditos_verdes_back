export interface Publicacion {
  idpublicacion: number;
  usuario_id: number;
  promocion_id: number | null;
  reporte_id: number | null;
  titulo: string | null;
  descripcion: string | null;
  valorCredito: number | null;
  fechaPublicacion: string | Date | null;
  estadoPublica: string | null;
  foto: string | null;
}
