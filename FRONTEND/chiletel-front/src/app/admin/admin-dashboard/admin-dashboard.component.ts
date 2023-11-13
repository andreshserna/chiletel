import { Component, OnInit } from '@angular/core';
import { CrewService } from 'src/app/services/crew.service';
import { Crew } from 'src/app/models/crew.model';

@Component({
  selector: 'app-admin-dashboard',
  templateUrl: './admin-dashboard.component.html',
  styleUrls: ['./admin-dashboard.component.sass']
})
export class AdminDashboardComponent implements OnInit {
  crews: Crew[] = [];

  constructor(private crewService: CrewService) {}

  ngOnInit(): void {
    this.crewService.getAllCrews().subscribe(data => {
      this.crews = data;
    });
  }
}
