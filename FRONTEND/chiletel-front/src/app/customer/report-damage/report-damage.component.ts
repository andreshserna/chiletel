import { Component } from '@angular/core';
import { AttentionOrderService } from 'src/app/services/attentionorder.service';

@Component({
  selector: 'app-report-damage',
  templateUrl: './report-damage.component.html',
  styleUrls: ['./report-damage.component.sass']
})
export class ReportDamageComponent {
  orderDescription: string = '';
  damageType: string = '';
  message: string = '';
  isError: boolean = false;

  constructor(private attentionOrderService: AttentionOrderService) {}

  onSubmit(): void {
    const customerId = localStorage.getItem('customerId');
    const reportDate = new Date().toISOString().split('T')[0];

    const orderData = {
      orderDescription: this.orderDescription,
      customerId: customerId,
      damageId: this.damageType,
      reportDate: reportDate
    };

    this.attentionOrderService.createOrder(orderData).subscribe(
      response => {
        this.message = 'Orden de atención creada con éxito.';
        this.isError = false;
        this.resetForm();
      },
      error => {
        this.message = 'Error al crear la orden de atención. Inténtalo de nuevo.';
        this.isError = true;
      }
    );
  }

  resetForm(): void {
    this.orderDescription = '';
    this.damageType = '';
  }
}
