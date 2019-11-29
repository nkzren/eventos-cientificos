import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { ParticipantesService } from '../participantes.service';
import { AlertModalService } from '../../shared/alert-modal.service';
import { Location } from '@angular/common';
import { ActivatedRoute } from '@angular/router';
import { map, switchMap, exhaustMap } from 'rxjs/operators';

@Component({
  selector: 'app-participantes-form',
  templateUrl: './participantes-form.component.html',
  styleUrls: ['./participantes-form.component.scss']
})
export class ParticipantesFormComponent implements OnInit {
  form: FormGroup;
  submitted = false;

  constructor(
    private fb: FormBuilder,
    private service: ParticipantesService,
    private modal: AlertModalService,
    private location: Location,
    private route: ActivatedRoute
  ) {}

  ngOnInit() {

    const participante = this.route.snapshot.data['participante'];

    this.form = this.fb.group({
      id: [participante.id],
      nome: [participante.nome, [Validators.required, Validators.minLength(3), Validators.maxLength(250)]]
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

      let msgSuccess = 'Participante criado com sucesso!';
      let msgError = 'Erro ao criar participante, tente novamente!';
      if (this.form.value.id) {
        msgSuccess = 'Participante atualizado com sucesso!';
        msgError = 'Erro ao atualizar participante, tente novamente!';
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
  }
}
