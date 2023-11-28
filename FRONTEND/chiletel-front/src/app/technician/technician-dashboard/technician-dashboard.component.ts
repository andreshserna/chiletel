import { Component, OnInit } from '@angular/core';
import { AttentionOrder } from 'src/app/models/attention-order.model';
import { AttentionOrderService } from 'src/app/services/attentionorder.service';
import { Technician } from 'src/app/models/technician.model';
import { TechnicianService } from 'src/app/services/technician.service';

@Component({
  selector: 'app-technician-dashboard',
  templateUrl: './technician-dashboard.component.html',
  styleUrls: ['./technician-dashboard.component.sass'],
})
export class TechnicianDashboardComponent implements OnInit {
  orders: AttentionOrder[] = [];
  technician: Technician | null = null;
  durationDialogVisible: boolean = false;
  selectedOrderDuration: string = '';
  selectedOrderId: number | null = null;

  constructor(
    private attentionOrderService: AttentionOrderService,
    private technicianService: TechnicianService
    ) {}

  ngOnInit(): void {
    this.loadTechnicianDetails();
    this.loadOrders();
  }

  loadTechnicianDetails(): void {
    const technicianId = parseInt(localStorage.getItem('technicianId') || '0');
    if (technicianId) {
      this.technicianService.getTechnicianById(technicianId).subscribe(tech => {
        this.technician = tech;
        // Aquí también puedes llamar a getTechnicianSpecialties si es necesario
      });
    }
  }

  loadOrders(): void {
    const technicianId = parseInt(localStorage.getItem('technicianId') || '0');
    if (technicianId) {
      this.attentionOrderService
        .getOrdersByTechnicianId(technicianId)
        .subscribe((data) => {
          this.orders = this.sortOrders(data);
        });
    }
  }

  showDurationDialog(order: AttentionOrder): void {
    this.selectedOrderId = order.orderId;
    this.durationDialogVisible = true;
  }

  shouldShowUpdateButton(order: AttentionOrder): boolean {
    return !order.fixedDate || this.isDateInvalid(order.fixedDate);
  }

  isDateInvalid(date: any): boolean {
    return date === 'null' || date === '' || date === undefined;
  }

  updateOrderDuration(): void {
    if (this.selectedOrderId && this.selectedOrderDuration) {
      this.attentionOrderService
        .updateOrderDuration(this.selectedOrderId, this.selectedOrderDuration)
        .subscribe(() => {
          this.durationDialogVisible = false;
          this.loadOrders();
        });
    }
  }

  sortOrders(orders: AttentionOrder[]): AttentionOrder[] {
    return orders.sort((a, b) => {
      const updateA = this.shouldShowUpdateButton(a) ? 0 : 1;
      const updateB = this.shouldShowUpdateButton(b) ? 0 : 1;
      return updateA - updateB;
    });
  }
}
