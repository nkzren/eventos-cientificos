import { Injectable } from '@angular/core';
import { CrudService } from '../shared/crud-service';
import { Evento } from './evento';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../environments/environment';
import { tap, delay, take } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class EventosService extends CrudService<Evento> {

  private readonly API = `${environment.API}eventos`;

  constructor(protected http: HttpClient) {
    super(http, `${environment.API}eventos`);
  }

  loadByID(id) {
    return this.http.get<Evento>(`${this.API}/${id}`).pipe(take(1));
  }
}
