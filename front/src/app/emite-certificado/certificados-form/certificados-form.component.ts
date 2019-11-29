import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { EmiteCertificadoService } from '../emite-certificado.service';
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
    private service: EmiteCertificadoService,
    private modal: AlertModalService,
    private location: Location,
    private route: ActivatedRoute
  ) {}

  ngOnInit() {

    // const registro = null;

    // this.route.params.subscribe(
    //   (params: any) => {
    //     const id = params['id'];
    //     console.log(id);
    //     const curso$ = this.service.loadByID(id);
    //     curso$.subscribe(curso => {
    //       registro = curso;
    //       this.updateForm(curso);
    //     });
    //   }
    // );

    // console.log(registro);

    // this.route.params
    // .pipe(
    //   map((params: any) => params['id']),
    //   switchMap(id => this.service.loadByID(id)),
    //   // switchMap(certificados => obterAulas)
    // )
    // .subscribe(curso => this.updateForm(curso));

    // concatMap -> ordem da requisiçao importa
    // mergeMap -> ordem nao importa
    // exhaustMap -> casos de login

    const emiteCertificado = this.route.snapshot.data['emite-certificado'];

    this.form = this.fb.group({
      id: [emiteCertificado.id],
      nome: [emiteCertificado.nome, [Validators.required, Validators.minLength(3), Validators.maxLength(250)]]
    });
  }

  // updateForm(curso) {
  //   this.form.patchValue({
  //     id: curso.id,
  //     nome: curso.nome
  //   });
  // }

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

      /* if (this.form.value.id) {
        // update
        this.service.update(this.form.value).subscribe(
          success => {
            this.modal.showAlertSuccess('Curso atualizado com sucesso!');
            this.location.back();
          },
          error => this.modal.showAlertDanger('Erro ao atualizar curso, tente novamente!'),
          () => console.log('update completo')
        );
      } else {
        this.service.create(this.form.value).subscribe(
          success => {
            this.modal.showAlertSuccess('Curso criado com sucesso!');
            this.location.back();
          },
          error => this.modal.showAlertDanger('Erro ao criar curso, tente novamente!'),
          () => console.log('request completo')
        );
      } */
    }
  }

  onCancel() {
    this.submitted = false;
    this.form.reset();
    // console.log('onCancel');
  }
}
