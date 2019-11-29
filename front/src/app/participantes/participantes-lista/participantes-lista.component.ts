// import { Component, OnInit } from '@angular/core';

// @Component({
//   selector: 'app-participantes-lista',
//   templateUrl: './participantes-lista.component.html',
//   styleUrls: ['./participantes-lista.component.scss']
// })
// export class ParticipantesListaComponent implements OnInit {

//   constructor() { }

//   ngOnInit() {
//   }

// }
import { Component, OnInit, ViewChild } from '@angular/core';
import { ParticipantesService } from '../participantes.service';
import { Participante } from '../participante';
import { Observable, empty, of, Subject, EMPTY } from 'rxjs';
import { catchError, switchMap, take } from 'rxjs/operators';
import { BsModalService, BsModalRef } from 'ngx-bootstrap/modal';
import { AlertModalComponent } from '../../shared/alert-modal/alert-modal.component';
import { AlertModalService } from '../../shared/alert-modal.service';
import { Router, ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-participantes-lista',
  templateUrl: './participantes-lista.component.html',
  styleUrls: ['./participantes-lista.component.scss'],
  preserveWhitespaces: true
})
export class ParticipantesListaComponent implements OnInit {
  // participantes: participante[];

  // bsModalRef: BsModalRef;

  deleteModalRef: BsModalRef;
  @ViewChild('deleteModal', { static: true }) deleteModal;

  participantes$: Observable<Participante[]>;
  error$ = new Subject<boolean>();

  participanteSelecionado: Participante;

  constructor(
    private service: ParticipantesService,
    private modalService: BsModalService,
    private alertService: AlertModalService,
    private router: Router,
    private route: ActivatedRoute
  ) {}

  ngOnInit() {
    // this.service.list()
    // .subscribe(dados => this.participantes = dados);

    this.onRefresh();
  }

  onRefresh() {
    this.participantes$ = this.service.list().pipe(
      // map(),
      // tap(),
      // switchMap(),
      catchError(error => {
        console.error(error);
        // this.error$.next(true);
        this.handleError();
        return empty();
      })
    );

    // this.service.list()
    // .pipe(
    //   catchError(error => empty())
    // )
    // .subscribe(
    //   dados => {
    //     console.log(dados);
    //   }
    //   // ,error => console.error(error),
    //   // () => console.log('Obserservable completo!')
    // );
  }

  handleError() {
    this.alertService.showAlertDanger('Erro ao carregar participantes. Tente novamente mais tarde.');
    // this.bsModalRef = this.modalService.show(AlertModalComponent);
    // this.bsModalRef.content.type = 'danger';
    // this.bsModalRef.content.message = 'Erro ao carregar participantes. Tente novamente mais tarde.';
  }

  onEdit(id) {
    this.router.navigate(['editar', id], { relativeTo: this.route });
  }

  onDelete(participante) {
    this.participanteSelecionado = participante;
    // this.deleteModalRef = this.modalService.show(this.deleteModal, { class: 'modal-sm' });

    const result$ = this.alertService.showConfirm('Confirmacao', 'Tem certeza que deseja remover esse participante?');
    result$.asObservable()
    .pipe(
      take(1),
      switchMap(result => result ? this.service.remove(participante.id) : EMPTY)
    )
    .subscribe(
      success => {
        this.onRefresh();
      },
      error => {
        this.alertService.showAlertDanger('Erro ao remover participante. Tente novamente mais tarde.');
      }
    );
  }

  onConfirmDelete() {
    this.service.remove(this.participanteSelecionado.id)
    .subscribe(
      success => {
        this.onRefresh();
        this.deleteModalRef.hide();
      },
      error => {
        this.alertService.showAlertDanger('Erro ao remover participante. Tente novamente mais tarde.');
        this.deleteModalRef.hide();
      }
    );
  }

  onDeclineDelete() {
    this.deleteModalRef.hide();
  }
}
