export interface CustodioCredito {
  idcustodioCredito: number;
  billetera_id: number;
  montoCustodio: number;
  estado: 'retenido' | 'liberado' | 'cancelado';
  fechaRetenido: string | Date | null;
  fechaLiberado: string | Date | null;
}
