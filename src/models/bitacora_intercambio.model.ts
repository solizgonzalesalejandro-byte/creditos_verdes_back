export interface BitacoraIntercambio {
  id: number;
  idintercambio: number;
  estado_old: string | null;
  estado_new: string | null;
  fecha: string | Date;
}
