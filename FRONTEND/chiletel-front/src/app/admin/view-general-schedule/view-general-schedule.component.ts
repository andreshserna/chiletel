import { Component, OnInit } from '@angular/core';
import { AttentionOrder } from 'src/app/models/attention-order.model';
import { AttentionOrderService } from 'src/app/services/attentionorder.service';

@Component({
  selector: 'app-view-general-schedule',
  templateUrl: './view-general-schedule.component.html',
  styleUrls: ['./view-general-schedule.component.sass']
})
export class ViewGeneralScheduleComponent implements OnInit {
  orders: AttentionOrder[] = [];
  technicianDialogVisible: boolean = false;
  selectedTechnicianId: number | null = null;
  selectedOrderId: number | null = null;

  constructor(private attentionOrderService: AttentionOrderService) {}

  ngOnInit(): void {
    this.loadAllOrders();
  }

  loadAllOrders(): void {
    this.attentionOrderService.getAllOrders().subscribe(data => {
      this.orders = this.sortOrdersByStatus(data);
    });
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

  shouldShowAssignButton(order: AttentionOrder): boolean {
    return !order.technicianId;
  }

  showAssignTechnicianDialog(order: AttentionOrder): void {
    this.selectedOrderId = order.orderId;
    this.selectedTechnicianId = null; // Reiniciar el ID del técnico seleccionado
    this.technicianDialogVisible = true;
  }

  assignTechnician(): void {
    if (this.selectedOrderId && this.selectedTechnicianId) {
      this.attentionOrderService.assignTechnicianToOrder(this.selectedOrderId, this.selectedTechnicianId).subscribe(() => {
        this.technicianDialogVisible = false;
        this.loadAllOrders(); 
      });
    }
  }
}
