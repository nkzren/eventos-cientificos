import { Component, OnInit, ViewChild } from '@angular/core';
import { EmiteCertificadoService } from '../emite-certificado.service';
import { emiteCertificado } from '../emite-certificado';
import { Observable, empty, of, Subject, EMPTY } from 'rxjs';
import { catchError, switchMap, take } from 'rxjs/operators';
import { BsModalService, BsModalRef } from 'ngx-bootstrap/modal';
import { AlertModalComponent } from '../../shared/alert-modal/alert-modal.component';
import { AlertModalService } from '../../shared/alert-modal.service';
import { Router, ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-certificados-lista',
  templateUrl: './certificados-lista.component.html',
  styleUrls: ['./certificados-lista.component.scss'],
  preserveWhitespaces: true
})
export class CertificadosListaComponent implements OnInit {
  // cursos: Curso[];

  // bsModalRef: BsModalRef;

  deleteModalRef: BsModalRef;
  @ViewChild('deleteModal', { static: true }) deleteModal;

  certificados$: Observable<emiteCertificado[]>;
  error$ = new Subject<boolean>();

  certificadoSelecionado: emiteCertificado;

  constructor(
    private service: EmiteCertificadoService,
    private modalService: BsModalService,
    private alertService: AlertModalService,
    private router: Router,
    private route: ActivatedRoute
  ) {}

  ngOnInit() {
    // this.service.list()
    // .subscribe(dados => this.cursos = dados);

    this.onRefresh();
  }

  onRefresh() {
    this.certificados$ = this.service.list().pipe(
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
    this.alertService.showAlertDanger('Erro ao carregar certificados. Tente novamente mais tarde.');
    // this.bsModalRef = this.modalService.show(AlertModalComponent);
    // this.bsModalRef.content.type = 'danger';
    // this.bsModalRef.content.message = 'Erro ao carregar cursos. Tente novamente mais tarde.';
  }

  onEdit(id) {
    this.router.navigate(['editar', id], { relativeTo: this.route });
  }

  onDelete(emiteCertificado) {
    this.certificadoSelecionado = emiteCertificado;
    // this.deleteModalRef = this.modalService.show(this.deleteModal, { class: 'modal-sm' });

    const result$ = this.alertService.showConfirm('Confirmacao', 'Tem certeza que deseja remover esse certificado?');
    result$.asObservable()
    .pipe(
      take(1),
      switchMap(result => result ? this.service.remove(emiteCertificado.id) : EMPTY)
    )
    .subscribe(
      success => {
        this.onRefresh();
      },
      error => {
        this.alertService.showAlertDanger('Erro ao remover certificados. Tente novamente mais tarde.');
      }
    );
  }

  onConfirmDelete() {
    this.service.remove(this.certificadoSelecionado.id)
    .subscribe(
      success => {
        this.onRefresh();
        this.deleteModalRef.hide();
      },
      error => {
        this.alertService.showAlertDanger('Erro ao remover certificado. Tente novamente mais tarde.');
        this.deleteModalRef.hide();
      }
    );
  }

  onDeclineDelete() {
    this.deleteModalRef.hide();
  }
}
