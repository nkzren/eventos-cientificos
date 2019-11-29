import { Injectable } from '@angular/core';
import { CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, Resolve } from '@angular/router';
import { Observable, of } from 'rxjs';
import { emiteCertificado } from '../emite-certificado';
import { EmiteCertificadoService } from '../emite-certificado.service';

@Injectable({
  providedIn: 'root'
})
export class CertificadoResolverGuard implements Resolve<emiteCertificado> {
  constructor(private service: EmiteCertificadoService) {}

  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<emiteCertificado> {
    if (route.params && route.params['id']) {
      return this.service.loadByID(route.params['id']);
    }

    return of({
      id: null,
      nome: null
    });
  }
}
