import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { EventosListaComponent } from './eventos-lista/eventos-lista.component';
import { EventosFormComponent } from './eventos-form/eventos-form.component';
import { EventoResolverGuard } from './guards/evento-resolver.guard';

const routes: Routes = [
  { path: '', component: EventosListaComponent },
  {
    path: 'novo',
    component: EventosFormComponent,
    resolve: {
      evento: EventoResolverGuard
    }
  },
  {
    path: 'editar/:id',
    component: EventosFormComponent,
    resolve: {
      evento: EventoResolverGuard
    }
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class EventosRoutingModule {}
