export interface BitacoraBilletera {
  id: number;
  billetera_id: number;
  accion: string | null;
  detalle: string | null;
  fecha: string | Date;
}
