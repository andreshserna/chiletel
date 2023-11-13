import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { RoleSelectionComponent } from './role-selection/role-selection.component'; // Asegúrate de importar este componente
import { TechnicianDashboardComponent } from './technician/technician-dashboard/technician-dashboard.component';
import { CustomerDashboardComponent } from './customer/customer-dashboard/customer-dashboard.component';
import { ManageTechniciansComponent } from './admin/manage-technicians/manage-technicians.component';
import { AdminDashboardComponent } from './admin/admin-dashboard/admin-dashboard.component';
import { CreateManualScheduleComponent } from './admin/create-manual-schedule/create-manual-schedule.component';
import { CreateTechnicianComponent } from './admin/create-technician/create-technician.component';
import { ViewReportsComponent } from './admin/view-reports/view-reports.component';
import { ViewGeneralScheduleComponent } from './admin/view-general-schedule/view-general-schedule.component';
import { UploadTechnicianFileComponent } from './admin/upload-technician-file/upload-technician-file.component';
import { ViewTechniciansComponent } from './admin/view-technicians/view-technicians.component';
import { ReportDamageComponent } from './customer/report-damage/report-damage.component';

const routes: Routes = [
  { path: '', redirectTo: 'select-role', pathMatch: 'full' }, 
  { path: 'select-role', component: RoleSelectionComponent }, 
  { path: 'admin-dashboard', component: AdminDashboardComponent }, 
  { path: 'admin/technicians', component: ManageTechniciansComponent },
  { path: 'customer-dashboard', component: CustomerDashboardComponent }, 
  { path: 'technician-dashboard', component: TechnicianDashboardComponent }, 
  { path: 'admin/create-manual-schedule', component: CreateManualScheduleComponent },
  { path: 'admin/create-technician', component: CreateTechnicianComponent },
  { path: 'admin/view-reports', component: ViewReportsComponent },
  { path: 'admin/view-general-schedule', component: ViewGeneralScheduleComponent },
  { path: 'admin/upload-technician-file', component: UploadTechnicianFileComponent },
  { path: 'admin/view-technicians', component: ViewTechniciansComponent },
  { path: 'report-damage', component: ReportDamageComponent }
  // ... otras rutas
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
