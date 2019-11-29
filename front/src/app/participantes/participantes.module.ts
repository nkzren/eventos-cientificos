import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule } from '@angular/forms';

import { ParticipantesRoutingModule } from './participantes-routing.module';
import { ParticipantesListaComponent } from './participantes-lista/participantes-lista.component';
import { ParticipantesFormComponent } from './participantes-form/participantes-form.component';

@NgModule({
  imports: [
    CommonModule,
    ParticipantesRoutingModule,
    ReactiveFormsModule
  ],
  declarations: [ParticipantesListaComponent, ParticipantesFormComponent]
})
export class ParticipantesModule { }
