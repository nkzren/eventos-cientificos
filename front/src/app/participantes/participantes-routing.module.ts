import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ParticipantesListaComponent } from './participantes-lista/participantes-lista.component';
import { ParticipantesFormComponent } from './participantes-form/participantes-form.component';
import { ParticipanteResolverGuard } from './guards/participante-resolver.guard';

const routes: Routes = [
  { path: '', component: ParticipantesListaComponent },
  {
    path: 'novo',
    component: ParticipantesFormComponent,
    resolve: {
      participante: ParticipanteResolverGuard
    }
  },
  {
    path: 'editar/:id',
    component: ParticipantesFormComponent,
    resolve: {
      participante: ParticipanteResolverGuard
    }
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ParticipantesRoutingModule {}
