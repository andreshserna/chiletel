import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-role-selection',
  templateUrl: './role-selection.component.html',
  styleUrls: ['./role-selection.component.sass']
})
export class RoleSelectionComponent {
  displayDialog: boolean = false;
  username: string = '';
  password: string = '';
  selectedRole: 'admin' | 'customer' | 'technician';  // Removido 'customer2' de los tipos ya que se manejará dentro de 'customer'

  // Simular una lista de usuarios como una propiedad de solo lectura
  private readonly mockUsers = {
    admin: { username: 'admin', password: 'admin123' },
    customer: { username: 'customer', password: 'customer123' },
    customer2: { username: 'customer2', password: 'customer123' },  // Nuevo usuario agregado
    technician: { username: 'technician', password: 'tech123' },
  };

  constructor(private router: Router) {}

  openDialog(role: 'admin' | 'customer' | 'technician') {
    this.selectedRole = role;
    this.displayDialog = true;
  }

  login() {
    if (this.selectedRole === 'customer') {
      if ((this.username === 'customer' && this.password === 'customer123') || 
          (this.username === 'customer2' && this.password === 'customer123')) {
        // Establecer customerId en el almacenamiento local
        if (this.username === 'customer') {
          localStorage.setItem('customerId', '3');
        } else if (this.username === 'customer2') {
          localStorage.setItem('customerId', '5');
        }

        localStorage.setItem('userRole', this.selectedRole);
        this.router.navigate([`${this.selectedRole}-dashboard`]);
        this.displayDialog = false;
      } else {
        alert('Credenciales incorrectas.');
        this.username = '';
        this.password = '';
      }
    } else {
      // Lógica para otros roles (admin, technician)
      if (this.username === this.mockUsers[this.selectedRole]?.username && 
          this.password === this.mockUsers[this.selectedRole]?.password) {
        localStorage.setItem('userRole', this.selectedRole);
        this.router.navigate([`${this.selectedRole}-dashboard`]);
        this.displayDialog = false;
      } else {
        alert('Credenciales incorrectas.');
        this.username = '';
        this.password = '';
      }
    }
  }
}
