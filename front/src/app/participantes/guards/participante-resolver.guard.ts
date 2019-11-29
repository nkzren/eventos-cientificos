import { Injectable } from '@angular/core';
import { CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, Resolve } from '@angular/router';
import { Observable, of } from 'rxjs';
import { Participante } from '../participante';
import { ParticipantesService } from '../participantes.service';

@Injectable({
  providedIn: 'root'
})
export class ParticipanteResolverGuard implements Resolve<Participante> {
  constructor(private service: ParticipantesService) {}

  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<Participante> {
    if (route.params && route.params['id']) {
      return this.service.loadByID(route.params['id']);
    }

    return of({
      id: null,
      nome: null
    });
  }
}
