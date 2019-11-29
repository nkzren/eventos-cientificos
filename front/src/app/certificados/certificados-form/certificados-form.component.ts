import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { CertificadosService } from '../certificados.service';
import { AlertModalService } from '../../shared/alert-modal.service';
import { Location } from '@angular/common';
import { ActivatedRoute } from '@angular/router';
import { map, switchMap, exhaustMap } from 'rxjs/operators';

@Component({
  selector: 'app-certificados-form',
  templateUrl: './certificados-form.component.html',
  styleUrls: ['./certificados-form.component.scss']
})
export class CertificadosFormComponent implements OnInit {
  form: FormGroup;
  submitted = false;

  constructor(
    private fb: FormBuilder,
    private service: CertificadosService,
    private modal: AlertModalService,
    private location: Location,
    private route: ActivatedRoute
  ) {}

  ngOnInit() {

    const certificado = this.route.snapshot.data['certificado'];

    this.form = this.fb.group({
      id: [certificado.id],
      nome: [certificado.nome, [Validators.required, Validators.minLength(3), Validators.maxLength(250)]],cpf: [certificado.cpf, [Validators.required, Validators.minLength(9), Validators.maxLength(12)]],
      edicao: [certificado.edicao],
      tipo: [certificado.tipo],
    });
  }

  hasError(field: string) {
    return this.form.get(field).errors;
  }

  onSubmit() {
    this.submitted = true;
    console.log(this.form.value);
    if (this.form.valid) {
      console.log('submit');

      let msgSuccess = 'Certificado criado com sucesso!';
      let msgError = 'Erro ao criar certificado, tente novamente!';
      if (this.form.value.id) {
        msgSuccess = 'Certificado atualizado com sucesso!';
        msgError = 'Erro ao atualizar certificado, tente novamente!';
      }

      this.service.save(this.form.value).subscribe(
        success => {
          this.modal.showAlertSuccess(msgSuccess);
            this.location.back();
        },
        error => this.modal.showAlertDanger(msgError)
      );
    }
  }

  onCancel() {
    this.submitted = false;
    this.form.reset();
    this.location.back();
  }
}
