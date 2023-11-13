import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.sass']
})
export class NavbarComponent {
  constructor(private router: Router) {}

  goToDashboard(): void {
    // Usa la ruta definida en AppRoutingModule
    this.router.navigate(['/admin-dashboard']);
  }

  logout(): void {
    // cerrar sesión
    this.router.navigate(['/select-role']);
  }
}
