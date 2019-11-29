import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule } from '@angular/forms';

import { EventosRoutingModule } from './eventos-routing.module';
import { EventosListaComponent } from './eventos-lista/eventos-lista.component';
import { EventosFormComponent } from './eventos-form/eventos-form.component';

@NgModule({
  imports: [
    CommonModule,
    EventosRoutingModule,
    ReactiveFormsModule
  ],
  declarations: [EventosListaComponent, EventosFormComponent]
})
export class EventosModule { }
