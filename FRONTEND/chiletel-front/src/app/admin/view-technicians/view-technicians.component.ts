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
    // Cargar detalles adicionales si es necesario
  }

  updateCrew(technicianId: number, newCrewId: number) {
    // Llamada al servicio para actualizar la cuadrilla
  }

  addSpecialty(technicianId: number, newSpecialty: number) {
    // Llamada al servicio para agregar la especialidad
  }
}
