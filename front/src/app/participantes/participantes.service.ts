import { Injectable } from '@angular/core';
import { CrudService } from '../shared/crud-service';
import { Participante } from './participante';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class ParticipantesService extends CrudService<Participante> {

  constructor(protected http: HttpClient) {
    super(http, `${environment.API}participantes`);
  }

  loadByID(id) {
    return null;
  }
}
