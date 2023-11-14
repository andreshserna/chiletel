import { Component, OnInit } from '@angular/core';
import { AttentionOrder } from 'src/app/models/attention-order.model';
import { AttentionOrderService } from 'src/app/services/attentionorder.service';

@Component({
  selector: 'app-technician-dashboard',
  templateUrl: './technician-dashboard.component.html',
  styleUrls: ['./technician-dashboard.component.sass']
})
export class TechnicianDashboardComponent implements OnInit {
  orders: AttentionOrder[] = [];
  durationDialogVisible: boolean = false;
  selectedOrderDuration: string = '';
  selectedOrderId: number | null = null;

  constructor(private attentionOrderService: AttentionOrderService) {}

  ngOnInit(): void {
    this.loadOrders();
  }

  loadOrders(): void {
    const technicianId = parseInt(localStorage.getItem('technicianId') || '0');
    if (technicianId) {
      this.attentionOrderService.getOrdersByTechnicianId(technicianId).subscribe(data => {
        this.orders = data;
      });
    }
  }

  showDurationDialog(order: AttentionOrder): void {
    this.selectedOrderId = order.orderId;
    this.durationDialogVisible = true;
  }

  shouldShowUpdateButton(order: AttentionOrder): boolean {
    // Asegúrate de que la comprobación se ajuste al tipo y formato de fixedDate en tu modelo
    return !order.fixedDate || typeof order.fixedDate === 'string' && (order.fixedDate === '' || order.fixedDate === 'null');
  }

  updateOrderDuration(): void {
    if (this.selectedOrderId && this.selectedOrderDuration) {
      this.attentionOrderService.updateOrderDuration(this.selectedOrderId, this.selectedOrderDuration).subscribe(() => {
        this.durationDialogVisible = false;
        this.loadOrders(); // Recargar las órdenes para reflejar los cambios
      });
    }
  }
}
