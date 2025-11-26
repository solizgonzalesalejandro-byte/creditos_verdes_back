export interface Suscripcion {
  idsuscripcion: number;
  usuario_id: number;
  fechaIniSus: string | Date;
  fechaFinSus: string | Date;
  monto: number | null;
}
