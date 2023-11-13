export class AttentionOrder {
  orderDescription: string;
  reportDate: Date;
  customerId: number;
  damageId: number;
  technicianId?: number;
  duration?: string; // Considere usar una clase o interfaz si necesita manejar intervalos específicos
  fixedDate?: Date;
  orderId: number;
}