import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule } from '@angular/forms';

import { CertificadosRoutingModule } from './certificados-routing.module';
import { CertificadosListaComponent } from './certificados-lista/certificados-lista.component';
import { CertificadosFormComponent } from './certificados-form/certificados-form.component';

@NgModule({
  imports: [
    CommonModule,
    CertificadosRoutingModule,
    ReactiveFormsModule
  ],
  declarations: [CertificadosListaComponent, CertificadosFormComponent]
})
export class CertificadosModule { }
