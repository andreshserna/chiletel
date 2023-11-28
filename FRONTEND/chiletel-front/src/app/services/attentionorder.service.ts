import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { AttentionOrder } from '../models/attention-order.model';

@Injectable({
  providedIn: 'root'
})
export class AttentionOrderService {
  private apiUrl = 'http://localhost:8080/api/damage-order/attention-orders';
  private baseUrl = 'http://localhost:8080/api/damage-order/attention-orders/customer';

  constructor(private http: HttpClient) {}

  getAllOrders(): Observable<AttentionOrder[]> {
    return this.http.get<AttentionOrder[]>(this.apiUrl);
  }

  getOrderById(id: number): Observable<AttentionOrder> {
    return this.http.get<AttentionOrder>(`${this.apiUrl}/${id}`);
  }

  getOrdersByCustomerId(customerId: number): Observable<any> {
    return this.http.get(`${this.baseUrl}/${customerId}`);
  }

  getOrdersByTechnicianId(technicianId: number): Observable<AttentionOrder[]> {
    return this.http.get<AttentionOrder[]>(`${this.apiUrl}/technician/${technicianId}`);
  }

  createOrder(orderData: any): Observable<any> {
    return this.http.post(`${this.apiUrl}`, orderData);
  }

  assignTechnicianToOrder(orderId: number, technicianId: number): Observable<any> {
    return this.http.put(`${this.apiUrl}/${orderId}/assign-technician`, { technicianId });
  }
  


  updateOrderDuration(orderId: number, duration: string): Observable<any> {
    return this.http.put(`${this.apiUrl}/${orderId}`, { duration: duration });
  }

  getUnassignedOrders(): Observable<AttentionOrder[]> {
    return this.http.get<AttentionOrder[]>(`${this.apiUrl}/unassigned`);
  }

}
