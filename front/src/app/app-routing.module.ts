import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

const routes: Routes = [
  {
    path: '', pathMatch: 'full', redirectTo: 'participantes'
  },
  // {
  //   path: 'cursos',
  //   loadChildren: () => import('./cursos/cursos.module').then(m => m.CursosModule)
  // },
  {
    path: 'participantes',
    loadChildren: () => import('./participantes/participantes.module').then(m => m.ParticipantesModule)
  },
  {
    path: 'eventos',
    loadChildren: () => import('./eventos/eventos.module').then(m => m.EventosModule)
  },
  {
    path: 'certificados',
    loadChildren: () => import('./certificados/certificados.module').then(m => m.CertificadosModule)
  },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
