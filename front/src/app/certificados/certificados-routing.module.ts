import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { CertificadosListaComponent } from './certificados-lista/certificados-lista.component';
import { CertificadosFormComponent } from './certificados-form/certificados-form.component';
import { CertificadoResolverGuard } from './guards/certificado-resolver.guard';

const routes: Routes = [
  { path: '', component: CertificadosListaComponent },
  {
    path: 'novo',
    component: CertificadosFormComponent,
    resolve: {
      certificado: CertificadoResolverGuard
    }
  },
  {
    path: 'editar/:id',
    component: CertificadosFormComponent,
    resolve: {
      certificado: CertificadoResolverGuard
    }
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class CertificadosRoutingModule {}
