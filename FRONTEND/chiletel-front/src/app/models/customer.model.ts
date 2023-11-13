export class Customer {
    customerId: number;
    name: string;
    address: string;
    district: string;
    type: number; // 1 a 5
    createdAt: Date;
    updatedAt?: Date;
  }