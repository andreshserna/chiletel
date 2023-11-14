import { Component, OnInit } from '@angular/core';
import { AttentionOrder } from 'src/app/models/attention-order.model';
import { AttentionOrderService } from 'src/app/services/attentionorder.service';

@Component({
  selector: 'app-customer-dashboard',
  templateUrl: './customer-dashboard.component.html',
  styleUrls: ['./customer-dashboard.component.sass']
})
export class CustomerDashboardComponent implements OnInit {
  orders: AttentionOrder[] = [];

  constructor(private attentionOrderService: AttentionOrderService) {}

  ngOnInit(): void {
    const customerId = parseInt(localStorage.getItem('customerId') || '0');
    if (customerId) {
      this.attentionOrderService.getOrdersByCustomerId(customerId).subscribe(data => {
        this.orders = this.sortOrdersByStatus(data);
      });
    }
  }

  getOrderStatus(order: AttentionOrder): string {
    if (order.fixedDate && order.technicianId) {
      return 'RESUELTA';
    } else if (order.technicianId) {
      return 'AGENDADA';
    } else {
      return 'ABIERTA';
    }
  }

  sortOrdersByStatus(orders: AttentionOrder[]): AttentionOrder[] {
    return orders.sort((a, b) => {
      const statusA = this.getOrderStatus(a);
      const statusB = this.getOrderStatus(b);
      return this.statusPriority(statusA) - this.statusPriority(statusB);
    });
  }

  statusPriority(status: string): number {
    switch (status) {
      case 'ABIERTA': return 1;
      case 'AGENDADA': return 2;
      case 'RESUELTA': return 3;
      default: return 4;
    }
  }
}
