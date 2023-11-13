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

  constructor(private orderService: AttentionOrderService) {}

  ngOnInit(): void {
    this.orderService.getAllOrders().subscribe(data => {
      this.orders = data;
    });
  }
}
