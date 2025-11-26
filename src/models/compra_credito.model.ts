export interface CompraCredito {
  idcompra: number;
  usuario_id: number;
  montoBs: number;
  creditosComprados: number;
  fechaCompra: string | Date;
  metodoPago: string;
}
