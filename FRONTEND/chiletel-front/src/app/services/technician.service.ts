import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Technician } from '../models/technician.model';

@Injectable({
  providedIn: 'root'
})
export class TechnicianService {
  private apiUrl = 'http://localhost:8080/api/user-management/technicians';

  constructor(private http: HttpClient) {}

  getAllTechnicians(): Observable<Technician[]> {
    return this.http.get<Technician[]>(this.apiUrl);
  }

  getTechnicianById(id: number): Observable<Technician> {
    return this.http.get<Technician>(`${this.apiUrl}/${id}`);
  }

  createTechnician(technician: Technician): Observable<Technician> {
    return this.http.post<Technician>(this.apiUrl, technician);
  }

  // Otros métodos como updateTechnician, deleteTechnician, etc.
}
