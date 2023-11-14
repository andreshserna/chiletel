import { Component, Input } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.sass']
})
export class NavbarComponent {
  @Input() dashboardRoute: string = '/admin-dashboard'; 

  constructor(private router: Router) {}

  goToDashboard(): void {
    this.router.navigate([this.dashboardRoute]);
  }

  logout(): void {
    
    this.router.navigate(['/select-role']);
  }
}
