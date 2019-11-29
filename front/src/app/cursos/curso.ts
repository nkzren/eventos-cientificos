export interface Curso {
  id: number;
  nome: string;
  cpf: string;
  cidade_origem: string;

  tema: string,
  edicao: number;
  data_hora_inicio: Date,
  data_hora_fim: Date,
  id_local: number,

  
  tipo: string;
}
