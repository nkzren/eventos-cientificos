import { Component, OnInit, ViewChild } from '@angular/core';
import { EventosService } from '../eventos.service';
import { Evento } from '../evento';
import { Observable, empty, of, Subject, EMPTY } from 'rxjs';
import { catchError, switchMap, take } from 'rxjs/operators';
import { BsModalService, BsModalRef } from 'ngx-bootstrap/modal';
import { AlertModalComponent } from '../../shared/alert-modal/alert-modal.component';
import { AlertModalService } from '../../shared/alert-modal.service';
import { Router, ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-eventos-lista',
  templateUrl: './eventos-lista.component.html',
  styleUrls: ['./eventos-lista.component.scss'],
  preserveWhitespaces: true
})
export class EventosListaComponent implements OnInit {

  deleteModalRef: BsModalRef;
  @ViewChild('deleteModal', { static: true }) deleteModal;

  eventos$: Observable<Evento[]>;
  error$ = new Subject<boolean>();

  eventoSelecionado: Evento;

  constructor(
    private service: EventosService,
    private modalService: BsModalService,
    private alertService: AlertModalService,
    private router: Router,
    private route: ActivatedRoute
  ) {}

  ngOnInit() {

    this.onRefresh();
  }

  onRefresh() {
    this.eventos$ = this.service.list().pipe(
      catchError(error => {
        console.error(error);
        this.handleError();
        return empty();
      })
    );
  }

  handleError() {
    this.alertService.showAlertDanger('Erro ao carregar eventos. Tente novamente mais tarde.');
  }

  onEdit(id) {
    this.router.navigate(['editar', id], { relativeTo: this.route });
  }

  onDelete(evento) {
    this.eventoSelecionado = evento;

    const result$ = this.alertService.showConfirm('Confirmacao', 'Tem certeza que deseja remover esse evento?');
    result$.asObservable()
    .pipe(
      take(1),
      switchMap(result => result ? this.service.remove(evento.id) : EMPTY)
    )
    .subscribe(
      success => {
        this.onRefresh();
      },
      error => {
        this.alertService.showAlertDanger('Erro ao remover evento. Tente novamente mais tarde.');
      }
    );
  }

  onConfirmDelete() {
    this.service.remove(this.eventoSelecionado.id)
    .subscribe(
      success => {
        this.onRefresh();
        this.deleteModalRef.hide();
      },
      error => {
        this.alertService.showAlertDanger('Erro ao remover evento. Tente novamente mais tarde.');
        this.deleteModalRef.hide();
      }
    );
  }

  onDeclineDelete() {
    this.deleteModalRef.hide();
  }
}
