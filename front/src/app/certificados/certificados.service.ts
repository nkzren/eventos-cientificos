import { Injectable } from '@angular/core';
import { CrudService } from '../shared/crud-service';
import { Certificado } from './certificado';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class CertificadosService extends CrudService<Certificado> {

  constructor(protected http: HttpClient) {
    super(http, `${environment.API}certificados`);
  }

  loadByID(id) {
    return null;
  }
}
