import { Component, OnInit } from '@angular/core';
import { Technician } from 'src/app/models/technician.model';
import { TechnicianService } from 'src/app/services/technician.service';

@Component({
  selector: 'app-view-technicians',
  templateUrl: './view-technicians.component.html',
  styleUrls: ['./view-technicians.component.sass']
})
export class ViewTechniciansComponent implements OnInit {
  technicians: Technician[] = [];
  displayModal: boolean = false;
  technicianSpecialties: any[] = [];
  selectedTechnician: Technician | null = null;

  constructor(private technicianService: TechnicianService) {}

  ngOnInit(): void {
    this.technicianService.getAllTechnicians().subscribe(data => {
      this.technicians = data;
    });
  }

  showDetails(technician: Technician) {
    this.selectedTechnician = technician;
    this.displayModal = true;

    
    this.getTechnicianSpecialties(technician.technicianId);
  }

  getTechnicianSpecialties(technicianId: number) {
    this.technicianService.getTechnicianSpecialties(technicianId).subscribe(
      specialties => {
        this.technicianSpecialties = specialties;
      },
      error => {
        console.error('Error al obtener las especialidades', error);
      }
    );
  }

  updateCrew(technicianId: number, newCrewId: number) {
    
  }

  addSpecialty(technicianId: number, newSpecialty: number) {
    
  }
}
