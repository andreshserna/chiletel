export class AttentionOrder {
  orderDescription: string;
  reportDate: Date;
  customerId: number;
  damageId: number;
  technicianId?: number;
  duration?: string; // Consider using a class or interface if you need to handle specific intervals
  fixedDate?: Date;
  orderId: number;

  constructor(
    orderDescription: string,
    reportDate: Date,
    customerId: number,
    damageId: number,
    technicianId?: number,
    duration?: string,
    fixedDate?: Date,
  ) {
    this.orderDescription = orderDescription;
    this.reportDate = reportDate;
    this.customerId = customerId;
    this.damageId = damageId;
    this.technicianId = technicianId;
    this.duration = duration;
    this.fixedDate = fixedDate;
  }
}
