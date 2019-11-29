import { Injectable } from '@angular/core';
import { CrudService } from '../shared/crud-service';
import { Certificado } from './certificado';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../environments/environment';
import { tap, delay, take } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class CertificadosService extends CrudService<Certificado> {

  private readonly API = `${environment.API}certificados`;

  constructor(protected http: HttpClient) {
    super(http, `${environment.API}certificados`);
  }

  loadByID(id) {
    return this.http.get<Certificado>(`${this.API}/${id}`).pipe(take(1));
  }
}
