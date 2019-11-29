import { Injectable } from '@angular/core';
import { CrudService } from '../shared/crud-service';
import { Evento } from './evento';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class EventosService extends CrudService<Evento> {

  constructor(protected http: HttpClient) {
    super(http, `${environment.API}eventos`);
  }

  loadByID(id) {
    return null;
  }
}
