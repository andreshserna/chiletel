import { Component, OnInit } from '@angular/core';
import { AttentionOrder } from 'src/app/models/attention-order.model';
import { AttentionOrderService } from 'src/app/services/attentionorder.service';

@Component({
  selector: 'app-assign-tech',
  templateUrl: './assign-tech.component.html',
  styleUrls: ['./assign-tech.component.sass']
})
export class AssignTechComponent implements OnInit {
  unassignedOrders: AttentionOrder[] = [];
  selectedOrderId: number | null = null;
  technicianId: number | null = null;

  constructor(private attentionOrderService: AttentionOrderService) {}

  ngOnInit(): void {
    this.loadUnassignedOrders();
  }

  loadUnassignedOrders(): void {
    this.attentionOrderService.getUnassignedOrders().subscribe(data => {
      this.unassignedOrders = data;
    });
  }

  assignTechnician(): void {
    if (this.selectedOrderId && this.technicianId) {
      this.attentionOrderService.assignTechnicianToOrder(this.selectedOrderId, this.technicianId).subscribe(() => {
        this.loadUnassignedOrders(); // Recargar las órdenes una vez asignado el técnico
      });
    }
  }
}
