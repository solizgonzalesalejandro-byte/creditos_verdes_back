export interface Intercambio {
  idintercambio: number;
  usuario_origen_id: number;
  usuario_destino_id: number;
  custodioCredito_id: number;
  creditoVerde: number | null;
  cantidad: number | null;
  estadoIntercam: string | null;
  fechaCreacion: string | Date | null;
  fechaFinal: string | Date | null;
  publicacion_id: number | null;
}
