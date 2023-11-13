import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';
import { CommonModule } from '@angular/common';


import { ButtonModule } from 'primeng/button';
import { CardModule } from 'primeng/card';
import { DialogModule } from 'primeng/dialog';
import { MenubarModule } from 'primeng/menubar';
import { DataViewModule } from 'primeng/dataview';
import { RatingModule } from 'primeng/rating';
import { TagModule } from 'primeng/tag';
import { DropdownModule } from 'primeng/dropdown';
import { MultiSelectModule } from 'primeng/multiselect';

import { BrowserAnimationsModule } from '@angular/platform-browser/animations';


import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { AdminDashboardComponent } from './admin/admin-dashboard/admin-dashboard.component';
import { ManageTechniciansComponent } from './admin/manage-technicians/manage-technicians.component';
import { CustomerDashboardComponent } from './customer/customer-dashboard/customer-dashboard.component';
import { TechnicianDashboardComponent } from './technician/technician-dashboard/technician-dashboard.component';
import { RoleSelectionComponent } from './role-selection/role-selection.component';
import { NavbarComponent } from './shared/navbar/navbar.component';
import { FormsModule } from '@angular/forms';
import { CreateManualScheduleComponent } from './admin/create-manual-schedule/create-manual-schedule.component';
import { CreateTechnicianComponent } from './admin/create-technician/create-technician.component';
import { ViewReportsComponent } from './admin/view-reports/view-reports.component';
import { ViewGeneralScheduleComponent } from './admin/view-general-schedule/view-general-schedule.component';
import { UploadTechnicianFileComponent } from './admin/upload-technician-file/upload-technician-file.component';
import { ViewTechniciansComponent } from './admin/view-technicians/view-technicians.component';

@NgModule({
  declarations: [
    AppComponent,
    AdminDashboardComponent,
    ManageTechniciansComponent,
    CustomerDashboardComponent,
    TechnicianDashboardComponent,
    RoleSelectionComponent,
    NavbarComponent,
    CreateManualScheduleComponent,
    CreateTechnicianComponent,
    ViewReportsComponent,
    ViewGeneralScheduleComponent,
    UploadTechnicianFileComponent,
    ViewTechniciansComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    ButtonModule,
    CardModule,
    DialogModule,
    FormsModule,
    BrowserAnimationsModule,
    MenubarModule,
    CommonModule,
    DataViewModule,
    RatingModule,
    TagModule,
    DropdownModule,
    MultiSelectModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }