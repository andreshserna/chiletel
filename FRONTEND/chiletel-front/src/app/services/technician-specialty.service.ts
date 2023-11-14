import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { TechnicianSpecialty } from '../models/technician-specialty.model';

@Injectable({
  providedIn: 'root'
})
export class TechnicianSpecialtyService {
  private apiUrl = 'http://localhost:8080/api/user-management/technician-specialties';

  constructor(private http: HttpClient) {}

  getAllSpecialties(): Observable<TechnicianSpecialty[]> {
    return this.http.get<TechnicianSpecialty[]>(this.apiUrl);
  }

  getSpecialtyById(id: number): Observable<TechnicianSpecialty> {
    return this.http.get<TechnicianSpecialty>(`${this.apiUrl}/${id}`);
  }

  createSpecialty(specialty: TechnicianSpecialty): Observable<TechnicianSpecialty> {
    return this.http.post<TechnicianSpecialty>(this.apiUrl, specialty);
  }
}
