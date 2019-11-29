import { Injectable } from '@angular/core';
import { CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, Resolve } from '@angular/router';
import { Observable, of } from 'rxjs';
import { Certificado } from '../certificado';
import { CertificadosService } from '../certificados.service';

@Injectable({
  providedIn: 'root'
})
export class CertificadoResolverGuard implements Resolve<Certificado> {
  constructor(private service: CertificadosService) {}

  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<Certificado> {
    if (route.params && route.params['id']) {
      return this.service.loadByID(route.params['id']);
    }

    return of({
      id: null,
      cpf: null,
      nome: null,
      edicao: null,
      tipo: null,
    });
  }
}
