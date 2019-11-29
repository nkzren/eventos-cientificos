import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { EventosService } from '../eventos.service';
import { AlertModalService } from '../../shared/alert-modal.service';
import { Location } from '@angular/common';
import { ActivatedRoute } from '@angular/router';
import { map, switchMap, exhaustMap } from 'rxjs/operators';

@Component({
  selector: 'app-eventos-form',
  templateUrl: './eventos-form.component.html',
  styleUrls: ['./eventos-form.component.scss']
})
export class EventosFormComponent implements OnInit {
  form: FormGroup;
  submitted = false;

  constructor(
    private fb: FormBuilder,
    private service: EventosService,
    private modal: AlertModalService,
    private location: Location,
    private route: ActivatedRoute
  ) {}

  ngOnInit() {

    const evento = this.route.snapshot.data['evento'];

    this.form = this.fb.group({
      id: [evento.id],
      nome: [evento.nome, [Validators.required, Validators.minLength(3), Validators.maxLength(250)]],
      tema: [evento.tema],
      edicao: [evento.edicao],
      data_hora_inicio: [evento.data_hora_inicio],
      data_hora_fim: [evento.data_hora_fim],
      id_local: [evento.id_local],
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

      let msgSuccess = 'Evento criado com sucesso!';
      let msgError = 'Erro ao criar evento, tente novamente!';
      if (this.form.value.id) {
        msgSuccess = 'Evento atualizado com sucesso!';
        msgError = 'Erro ao atualizar evento, tente novamente!';
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
