export interface MovimientoCredito {
  idmovimiento_credito: number;
  tipoMovimiento: string;
  monto: number;
  fechaMovimiento: string | Date;
  descripcionMovi: string | null;
  billetera_id: number;
  intercambio_id: number | null;
}
