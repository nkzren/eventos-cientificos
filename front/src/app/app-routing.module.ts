import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

const routes: Routes = [
  {
    path: '', pathMatch: 'full', redirectTo: 'cursos'
  },
  {
    path: 'cursos',
    loadChildren: () => import('./cursos/cursos.module').then(m => m.CursosModule)
  },
  {
    path: 'participantes',
    loadChildren: () => import('./participantes/participantes.module').then(m => m.ParticipantesModule)
  },
  {
    path: 'eventos',
    loadChildren: () => import('./eventos/eventos.module').then(m => m.EventosModule)
  },
  {
    path: 'emite-certificado',
    loadChildren: () => import('./emite-certificado/emite-certificado.module').then(m => m.EmiteCertificadoModule)
  },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
