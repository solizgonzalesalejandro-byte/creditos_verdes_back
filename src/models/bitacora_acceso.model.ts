export interface BitacoraAcceso {
  id: number;
  usuario: string | null;
  ip: string | null;
  user_agent: string | null;
  exito: boolean;
  motivo: string | null;
  fecha: string | Date;
}
