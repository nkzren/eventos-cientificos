import { Injectable } from '@angular/core';
import { CrudService } from '../shared/crud-service';
import { emiteCertificado } from './emite-certificado';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class EmiteCertificadoService extends CrudService<emiteCertificado> {

  constructor(protected http: HttpClient) {
    super(http, `${environment.API}emite-certificado`);
  }

  loadByID(id) {
    return null;
  }
}
