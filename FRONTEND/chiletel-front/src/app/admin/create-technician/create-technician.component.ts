import { Component, OnInit } from '@angular/core';
import { CrewService } from 'src/app/services/crew.service';
import { TechnicianService } from 'src/app/services/technician.service';
import { MessageService } from 'primeng/api';
import { NgForm } from '@angular/forms';

@Component({
  selector: 'app-create-technician',
  templateUrl: './create-technician.component.html',
  styleUrls: ['./create-technician.component.sass'],
  providers: [MessageService]
})
export class CreateTechnicianComponent implements OnInit {
  crews: any[] = [];
  selectedCrew: any;
  technicianName: string;
  technicianDocument: string;
  selectedDocumentType: string;
  documentTypes: any[] = [
    { label: 'CC', value: 'CC' },
    { label: 'CE', value: 'CE' }
  ];

  constructor(
    private crewService: CrewService, 
    private technicianService: TechnicianService, 
    private messageService: MessageService
  ) {}

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

  onSubmit(form: NgForm) {
    const technician = { 
      ...form.value, 
      name: this.technicianName,
      document: this.technicianDocument,
      documentType: this.selectedDocumentType, 
      crewId: this.selectedCrew.value 
    };

    console.log('Nombre del Técnico:', this.technicianName);
    console.log('Tipo de Documento:', this.selectedDocumentType);
    console.log('Número de Documento:', this.technicianDocument);
    console.log('ID de la Cuadrilla:', this.selectedCrew.value);


    this.technicianService.createTechnician(technician).subscribe(
      () => {
        this.messageService.add({ severity: 'success', summary: 'Éxito', detail: 'Técnico agregado correctamente.' });
        form.resetForm();
      },
      (error) => {
        this.messageService.add({ severity: 'error', summary: 'Error', detail: 'No se pudo agregar el técnico, verifica si no existe ya: ' + error.message });
      }
    );
  }
}
