import { Component, OnInit } from '@angular/core';
import { CrewService } from 'src/app/services/crew.service';

@Component({
  selector: 'app-create-technician',
  templateUrl: './create-technician.component.html',
  styleUrls: ['./create-technician.component.sass']
})
export class CreateTechnicianComponent implements OnInit {
  crews: any[] = [];
  selectedCrew: number; 
  specialties: any[] = [
    { label: '1. Daño eléctrico menor', value: 1 },
    { label: '2. Daño de infraestructura', value: 2 },
    { label: '3. Daño de hardware crítico', value: 3 },
    { label: '4. Fallo de software', value: 4 },
    { label: '5. CORTE DE SERVICIOS ESENCIALES', value: 5 }
  ];

  constructor(private crewService: CrewService) {}

  ngOnInit(): void {
    this.loadCrews();
  }

  loadCrews() {
    this.crewService.getAllCrews().subscribe(data => {
      this.crews = data.map(crew => ({
        label: crew.name, 
        value: crew.crewId
      }));
    });
  }

  // Otros métodos...
}
