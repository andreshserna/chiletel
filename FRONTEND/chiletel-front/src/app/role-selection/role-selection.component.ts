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
  selectedRole: 'admin' | 'customer' | 'technician';

  // Simular una lista de usuarios como una propiedad de solo lectura
  private readonly mockUsers = {
    admin: { username: 'admin', password: 'admin123' },
    customer: { username: 'customer', password: 'customer123' },
    technician: { username: 'technician', password: 'tech123' },
  };

  constructor(private router: Router) {}

  openDialog(role: 'admin' | 'customer' | 'technician') {
    this.selectedRole = role;
    this.displayDialog = true;
  }

  login() {
    if (this.username === this.mockUsers[this.selectedRole].username && this.password === this.mockUsers[this.selectedRole].password) {
      localStorage.setItem('userRole', this.selectedRole);
      this.router.navigate([`${this.selectedRole}-dashboard`]);
      this.displayDialog = false;
    } else {
      alert('Credenciales incorrectas.');
      // Limpiar los campos después de un intento fallido
      this.username = '';
      this.password = '';
    }
  }
}
