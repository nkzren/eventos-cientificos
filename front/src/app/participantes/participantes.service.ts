import { Injectable } from '@angular/core';
import { CrudService } from '../shared/crud-service';
import { Participante } from './participante';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../environments/environment';
import { tap, delay, take } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class ParticipantesService extends CrudService<Participante> {

  private readonly API = `${environment.API}participantes`;

  constructor(protected http: HttpClient) {
    super(http, `${environment.API}participantes`);
  }

  loadByID(id) {
    return this.http.get<Participante>(`${this.API}/${id}`).pipe(take(1));
  }
}
