import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Crew } from '../models/crew.model';

@Injectable({
  providedIn: 'root'
})
export class CrewService {
  private apiUrl = 'http://localhost:8080/api/user-management/crews'; // Cambia esto por la URL de tu API

  constructor(private http: HttpClient) {}

  getAllCrews(): Observable<Crew[]> {
    return this.http.get<Crew[]>(this.apiUrl);
  }

  getCrewById(id: number): Observable<Crew> {
    return this.http.get<Crew>(`${this.apiUrl}/${id}`);
  }

  // Agrega aquí otros métodos si los necesitas, como createCrew, updateCrew, etc.
}
