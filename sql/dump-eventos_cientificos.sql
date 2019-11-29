--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10
-- Dumped by pg_dump version 11.2

-- Started on 2019-11-29 13:48:58

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 7 (class 2615 OID 30481)
-- Name: eventos; Type: SCHEMA; Schema: -; Owner: bd2019
--

CREATE SCHEMA eventos;


ALTER SCHEMA eventos OWNER TO bd2019;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 201 (class 1259 OID 31240)
-- Name: apresentado_em; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.apresentado_em (
    numero numeric(10,0) NOT NULL,
    codigo_da_atividade numeric(10,0) NOT NULL
);


ALTER TABLE eventos.apresentado_em OWNER TO bd2019;

--
-- TOC entry 262 (class 1259 OID 35464)
-- Name: id_area_sequencia; Type: SEQUENCE; Schema: eventos; Owner: bd2019
--

CREATE SEQUENCE eventos.id_area_sequencia
    START WITH 4
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE eventos.id_area_sequencia OWNER TO bd2019;

--
-- TOC entry 202 (class 1259 OID 31245)
-- Name: area_local; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.area_local (
    id_area numeric(10,0) DEFAULT nextval('eventos.id_area_sequencia'::regclass) NOT NULL,
    id_local numeric(10,0) NOT NULL,
    nome_da_area character varying(250) NOT NULL,
    capacidade numeric(10,0) NOT NULL
);


ALTER TABLE eventos.area_local OWNER TO bd2019;

--
-- TOC entry 203 (class 1259 OID 31250)
-- Name: artigo; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.artigo (
    tipo character varying(50) NOT NULL,
    editora character varying(150) NOT NULL,
    numero numeric(10,0) NOT NULL,
    nome character varying(255)
);


ALTER TABLE eventos.artigo OWNER TO bd2019;

--
-- TOC entry 264 (class 1259 OID 45841)
-- Name: atividade_seq; Type: SEQUENCE; Schema: eventos; Owner: bd2019
--

CREATE SEQUENCE eventos.atividade_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE eventos.atividade_seq OWNER TO bd2019;

--
-- TOC entry 204 (class 1259 OID 31255)
-- Name: atividade; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.atividade (
    codigo_da_atividade numeric(10,0) DEFAULT nextval('eventos.atividade_seq'::regclass) NOT NULL,
    nome character varying(250) NOT NULL,
    data_hora_inicio timestamp without time zone NOT NULL,
    data_hora_fim timestamp without time zone NOT NULL,
    capacidade_minima numeric(5,0) NOT NULL,
    workshop numeric(1,0),
    tutorial numeric(1,0),
    sessao_de_artigo numeric(1,0),
    reuniao numeric(1,0),
    palestra numeric(1,0),
    concurso numeric(1,0),
    atividade_social numeric(1,0),
    pos_nome character varying(150) NOT NULL,
    pos_edicao numeric(150,0) NOT NULL,
    CONSTRAINT extone_atividade CHECK ((((workshop IS NOT NULL) AND (tutorial IS NULL) AND (sessao_de_artigo IS NULL) AND (reuniao IS NULL) AND (palestra IS NULL) AND (concurso IS NULL) AND (atividade_social IS NULL)) OR ((workshop IS NULL) AND (tutorial IS NOT NULL) AND (sessao_de_artigo IS NULL) AND (reuniao IS NULL) AND (palestra IS NULL) AND (concurso IS NULL) AND (atividade_social IS NULL)) OR ((workshop IS NULL) AND (tutorial IS NULL) AND (sessao_de_artigo IS NOT NULL) AND (reuniao IS NULL) AND (palestra IS NULL) AND (concurso IS NULL) AND (atividade_social IS NULL)) OR ((workshop IS NULL) AND (tutorial IS NULL) AND (sessao_de_artigo IS NULL) AND (reuniao IS NOT NULL) AND (palestra IS NULL) AND (concurso IS NULL) AND (atividade_social IS NULL)) OR ((workshop IS NULL) AND (tutorial IS NULL) AND (sessao_de_artigo IS NULL) AND (reuniao IS NULL) AND (palestra IS NOT NULL) AND (concurso IS NULL) AND (atividade_social IS NULL)) OR ((workshop IS NULL) AND (tutorial IS NULL) AND (sessao_de_artigo IS NULL) AND (reuniao IS NULL) AND (palestra IS NULL) AND (concurso IS NOT NULL) AND (atividade_social IS NULL)) OR ((workshop IS NULL) AND (tutorial IS NULL) AND (sessao_de_artigo IS NULL) AND (reuniao IS NULL) AND (palestra IS NULL) AND (concurso IS NULL) AND (atividade_social IS NOT NULL))))
);


ALTER TABLE eventos.atividade OWNER TO bd2019;

--
-- TOC entry 205 (class 1259 OID 31260)
-- Name: atividade_social; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.atividade_social (
    codigo_da_atividade numeric(10,0) NOT NULL,
    tipo character varying(100) NOT NULL,
    valor_convite numeric(6,2) NOT NULL
);


ALTER TABLE eventos.atividade_social OWNER TO bd2019;

--
-- TOC entry 206 (class 1259 OID 31265)
-- Name: autor_de_artigo; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.autor_de_artigo (
    cpf_corpo numeric(9,0) NOT NULL,
    cpf_controle character(2) NOT NULL,
    afiliacao character varying(200) NOT NULL,
    numero numeric(10,0) NOT NULL
);


ALTER TABLE eventos.autor_de_artigo OWNER TO bd2019;

--
-- TOC entry 207 (class 1259 OID 31270)
-- Name: beneficio_patrocinio; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.beneficio_patrocinio (
    id_taxa numeric(10,0) NOT NULL,
    beneficio character varying(150) NOT NULL
);


ALTER TABLE eventos.beneficio_patrocinio OWNER TO bd2019;

--
-- TOC entry 208 (class 1259 OID 31275)
-- Name: certificado; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.certificado (
    numero numeric(10,0) DEFAULT nextval('eventos.id_area_sequencia'::regclass) NOT NULL,
    tipo character(1) NOT NULL
);


ALTER TABLE eventos.certificado OWNER TO bd2019;

--
-- TOC entry 263 (class 1259 OID 39424)
-- Name: certificado_seq; Type: SEQUENCE; Schema: eventos; Owner: bd2019
--

CREATE SEQUENCE eventos.certificado_seq
    START WITH 5
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE eventos.certificado_seq OWNER TO bd2019;

--
-- TOC entry 209 (class 1259 OID 31280)
-- Name: concurso; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.concurso (
    codigo_da_atividade numeric(10,0) NOT NULL,
    tema character varying(150) NOT NULL
);


ALTER TABLE eventos.concurso OWNER TO bd2019;

--
-- TOC entry 267 (class 1259 OID 46104)
-- Name: conta_pagar_seq; Type: SEQUENCE; Schema: eventos; Owner: bd2019
--

CREATE SEQUENCE eventos.conta_pagar_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE eventos.conta_pagar_seq OWNER TO bd2019;

--
-- TOC entry 210 (class 1259 OID 31285)
-- Name: conta_a_pagar; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.conta_a_pagar (
    id numeric(10,0) DEFAULT nextval('eventos.conta_pagar_seq'::regclass) NOT NULL,
    numero_nota numeric(20,0) NOT NULL,
    descricao character varying(400) NOT NULL,
    nome character varying(150) NOT NULL,
    edicao numeric(150,0) NOT NULL,
    data_pgto date
);


ALTER TABLE eventos.conta_a_pagar OWNER TO bd2019;

--
-- TOC entry 266 (class 1259 OID 46089)
-- Name: conta_receber_seq; Type: SEQUENCE; Schema: eventos; Owner: bd2019
--

CREATE SEQUENCE eventos.conta_receber_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE eventos.conta_receber_seq OWNER TO bd2019;

--
-- TOC entry 211 (class 1259 OID 31295)
-- Name: conta_a_receber; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.conta_a_receber (
    id numeric(10,0) DEFAULT nextval('eventos.conta_receber_seq'::regclass) NOT NULL,
    numero_nota numeric(20,0) NOT NULL,
    descricao character varying(400) NOT NULL,
    nome character varying(150) NOT NULL,
    edicao numeric(150,0) NOT NULL,
    data_pgto date
);


ALTER TABLE eventos.conta_a_receber OWNER TO bd2019;

--
-- TOC entry 212 (class 1259 OID 31305)
-- Name: emite_certificado; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.emite_certificado (
    numero numeric(10,0) DEFAULT currval('eventos.id_area_sequencia'::regclass) NOT NULL,
    data_de_emissao date DEFAULT CURRENT_DATE NOT NULL,
    cpf_corpo numeric(9,0) NOT NULL,
    cpf_controle character(2) NOT NULL,
    nome character varying(150) NOT NULL,
    edicao numeric(150,0) NOT NULL
);


ALTER TABLE eventos.emite_certificado OWNER TO bd2019;

--
-- TOC entry 213 (class 1259 OID 31310)
-- Name: entidade; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.entidade (
    cnp_corpo numeric(9,0) NOT NULL,
    cnp_filial numeric(4,0) NOT NULL,
    cnp_controle numeric(2,0) NOT NULL,
    razao_social character varying(120) NOT NULL,
    end_logradouro character varying(80) NOT NULL,
    end_cidade character varying(80) NOT NULL,
    end_estado character(2) NOT NULL,
    end_cep numeric(8,0) NOT NULL
);


ALTER TABLE eventos.entidade OWNER TO bd2019;

--
-- TOC entry 214 (class 1259 OID 31315)
-- Name: equipamento; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.equipamento (
    id_equ numeric(10,0) NOT NULL,
    nome_equipamento character(1) NOT NULL,
    tipo character varying(30) NOT NULL
);


ALTER TABLE eventos.equipamento OWNER TO bd2019;

--
-- TOC entry 215 (class 1259 OID 31322)
-- Name: equipe; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.equipe (
    id_equipe numeric(6,0) NOT NULL,
    nome character(10) NOT NULL
);


ALTER TABLE eventos.equipe OWNER TO bd2019;

--
-- TOC entry 216 (class 1259 OID 31327)
-- Name: estoca; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.estoca (
    id_est numeric(10,0) NOT NULL,
    cod_produto numeric(9,0) NOT NULL,
    cnp_corpo numeric(1,0) NOT NULL,
    cnp_filial numeric(4,0) NOT NULL,
    cnp_controle character(2) NOT NULL,
    quantidade numeric(10,0) NOT NULL,
    data_hora date NOT NULL
);


ALTER TABLE eventos.estoca OWNER TO bd2019;

--
-- TOC entry 217 (class 1259 OID 31332)
-- Name: evento; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.evento (
    nome character varying(150) NOT NULL,
    edicao numeric(3,0) NOT NULL,
    tema character varying(150) NOT NULL,
    data_hora_inicio date NOT NULL,
    data_hora_fim date NOT NULL,
    id_local numeric(10,0) NOT NULL
);


ALTER TABLE eventos.evento OWNER TO bd2019;

--
-- TOC entry 218 (class 1259 OID 31337)
-- Name: fornece; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.fornece (
    cnp_corpo numeric(1,0) NOT NULL,
    cnp_filial numeric(4,0) NOT NULL,
    cnp_controle character(2) NOT NULL,
    codigo numeric(9,0) NOT NULL
);


ALTER TABLE eventos.fornece OWNER TO bd2019;

--
-- TOC entry 219 (class 1259 OID 31342)
-- Name: fornecedor; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.fornecedor (
    cnp_corpo numeric(1,0) NOT NULL,
    cnp_filial numeric(4,0) NOT NULL,
    cnp_controle character(2) NOT NULL,
    nome character varying(150) NOT NULL,
    end_logradouro character varying(80) NOT NULL,
    end_cidade character varying(80) NOT NULL,
    end_uf character(2) NOT NULL,
    end_cep numeric(8,0) NOT NULL
);


ALTER TABLE eventos.fornecedor OWNER TO bd2019;

--
-- TOC entry 268 (class 1259 OID 46113)
-- Name: inscricao_seq; Type: SEQUENCE; Schema: eventos; Owner: bd2019
--

CREATE SEQUENCE eventos.inscricao_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE eventos.inscricao_seq OWNER TO bd2019;

--
-- TOC entry 220 (class 1259 OID 31347)
-- Name: inscricao; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.inscricao (
    n_inscricao numeric(10,0) DEFAULT nextval('eventos.inscricao_seq'::regclass) NOT NULL,
    numero_nota numeric(20,0) NOT NULL,
    id_taxa_ins numeric(20,0) NOT NULL,
    desconto numeric(5,2) NOT NULL,
    cpf_corpo numeric(9,0) NOT NULL,
    cpf_controle character(2) NOT NULL,
    nome character varying(150) NOT NULL,
    edicao numeric(150,0) NOT NULL,
    forma_de_pagamento character(10) NOT NULL,
    data_de_inscricao date
);


ALTER TABLE eventos.inscricao OWNER TO bd2019;

--
-- TOC entry 221 (class 1259 OID 31352)
-- Name: juiz; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.juiz (
    cpf_corpo numeric(9,0) NOT NULL,
    cpf_controle character(2) NOT NULL
);


ALTER TABLE eventos.juiz OWNER TO bd2019;

--
-- TOC entry 222 (class 1259 OID 31357)
-- Name: julga; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.julga (
    codigo_da_atividade numeric(10,0) NOT NULL,
    cpf_corpo numeric(9,0) NOT NULL,
    cpf_controle character(2) NOT NULL
);


ALTER TABLE eventos.julga OWNER TO bd2019;

--
-- TOC entry 223 (class 1259 OID 31362)
-- Name: local; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.local (
    id_local numeric(10,0) NOT NULL,
    nome character varying(150) NOT NULL,
    capacidade numeric(10,0) NOT NULL,
    qualidade numeric(3,0) NOT NULL,
    end_logradouro character varying(80) NOT NULL,
    end_cidade character varying(80) NOT NULL,
    end_estado character(2) NOT NULL,
    end_cep numeric(11,0) NOT NULL,
    end_numero character varying(10) NOT NULL
);


ALTER TABLE eventos.local OWNER TO bd2019;

--
-- TOC entry 224 (class 1259 OID 31367)
-- Name: lojista; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.lojista (
    nome character varying(250) NOT NULL,
    matricula character(6) NOT NULL,
    cpf_corpo numeric(9,0) NOT NULL,
    cpf_controle character(2) NOT NULL,
    cnp_corpo numeric(9,0) NOT NULL,
    cnp_filial numeric(4,0) NOT NULL,
    cnp_controle character(2) NOT NULL
);


ALTER TABLE eventos.lojista OWNER TO bd2019;

--
-- TOC entry 225 (class 1259 OID 31372)
-- Name: membro_do_comite; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.membro_do_comite (
    cpf_corpo numeric(9,0) NOT NULL,
    cpf_controle character(2) NOT NULL
);


ALTER TABLE eventos.membro_do_comite OWNER TO bd2019;

--
-- TOC entry 226 (class 1259 OID 31377)
-- Name: minicurriculo_autor; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.minicurriculo_autor (
    cpf_corpo numeric(9,0) NOT NULL,
    cpf_controle character(2) NOT NULL,
    minicurriculo_autor character varying(300) NOT NULL
);


ALTER TABLE eventos.minicurriculo_autor OWNER TO bd2019;

--
-- TOC entry 227 (class 1259 OID 31382)
-- Name: minicurriculo_palestrante; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.minicurriculo_palestrante (
    cpf_corpo numeric(9,0) NOT NULL,
    cpf_controle character(2) NOT NULL,
    minicurriculo_palestrante character varying(300) NOT NULL
);


ALTER TABLE eventos.minicurriculo_palestrante OWNER TO bd2019;

--
-- TOC entry 228 (class 1259 OID 31387)
-- Name: ministrante_de_tutorial; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.ministrante_de_tutorial (
    cpf_corpo numeric(9,0) NOT NULL,
    cpf_controle character(2) NOT NULL
);


ALTER TABLE eventos.ministrante_de_tutorial OWNER TO bd2019;

--
-- TOC entry 265 (class 1259 OID 46077)
-- Name: nota_id_seq; Type: SEQUENCE; Schema: eventos; Owner: bd2019
--

CREATE SEQUENCE eventos.nota_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE eventos.nota_id_seq OWNER TO bd2019;

--
-- TOC entry 229 (class 1259 OID 31392)
-- Name: nota_fiscal; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.nota_fiscal (
    numero_nota numeric(20,0) DEFAULT nextval('eventos.nota_id_seq'::regclass) NOT NULL,
    cnp_corpo numeric(9,0) NOT NULL,
    cnp_filial numeric(4,0) NOT NULL,
    cnp_controle character(2) NOT NULL,
    data_emissao date NOT NULL,
    valor numeric(15,2) NOT NULL
);


ALTER TABLE eventos.nota_fiscal OWNER TO bd2019;

--
-- TOC entry 230 (class 1259 OID 31397)
-- Name: organiza; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.organiza (
    id_equipe numeric(6,0) NOT NULL,
    nome character varying(150) NOT NULL,
    edicao numeric(150,0) NOT NULL
);


ALTER TABLE eventos.organiza OWNER TO bd2019;

--
-- TOC entry 231 (class 1259 OID 31402)
-- Name: organizador; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.organizador (
    pos_id_equipe numeric(6,0),
    nome character varying(250) NOT NULL,
    cpf_corpo numeric(9,0) NOT NULL,
    cpf_controle character(2) NOT NULL,
    matricula numeric(5,0) NOT NULL,
    id_equipe numeric(6,0) NOT NULL
);


ALTER TABLE eventos.organizador OWNER TO bd2019;

--
-- TOC entry 232 (class 1259 OID 31407)
-- Name: palestra; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.palestra (
    codigo_da_atividade numeric(10,0) NOT NULL,
    tema character varying(50)
);


ALTER TABLE eventos.palestra OWNER TO bd2019;

--
-- TOC entry 233 (class 1259 OID 31412)
-- Name: palestrante; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.palestrante (
    cpf_corpo numeric(9,0) NOT NULL,
    cpf_controle character(2) NOT NULL,
    afiliacao character varying(20) NOT NULL,
    codigo_da_atividade numeric(10,0) NOT NULL
);


ALTER TABLE eventos.palestrante OWNER TO bd2019;

--
-- TOC entry 255 (class 1259 OID 31527)
-- Name: participa_de; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.participa_de (
    codigo_da_atividade numeric(10,0) NOT NULL,
    cpf_corpo numeric(9,0) NOT NULL,
    cpf_controle character(2) NOT NULL
);


ALTER TABLE eventos.participa_de OWNER TO bd2019;

--
-- TOC entry 234 (class 1259 OID 31417)
-- Name: participante; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.participante (
    cpf_corpo numeric(9,0) NOT NULL,
    cpf_controle character(2) NOT NULL,
    nome character varying(250) NOT NULL,
    cidade_origem character varying(40) NOT NULL
);


ALTER TABLE eventos.participante OWNER TO bd2019;

--
-- TOC entry 235 (class 1259 OID 31422)
-- Name: participante_de_reuniao; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.participante_de_reuniao (
    cpf_corpo numeric(9,0) NOT NULL,
    cpf_controle character(2) NOT NULL
);


ALTER TABLE eventos.participante_de_reuniao OWNER TO bd2019;

--
-- TOC entry 236 (class 1259 OID 31427)
-- Name: patrocina; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.patrocina (
    numero_nota numeric(20,0) NOT NULL,
    cnp_corpo numeric(9,0) NOT NULL,
    cnp_filial numeric(4,0) NOT NULL,
    cnp_controle numeric(2,0) NOT NULL,
    nome character varying(150) NOT NULL,
    edicao numeric(150,0) NOT NULL,
    id_taxa numeric(10,0) NOT NULL
);


ALTER TABLE eventos.patrocina OWNER TO bd2019;

--
-- TOC entry 237 (class 1259 OID 31432)
-- Name: pessoas_responsaveis; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.pessoas_responsaveis (
    cnp_corpo numeric(9,0) NOT NULL,
    cnp_filial numeric(4,0) NOT NULL,
    cnp_controle numeric(2,0) NOT NULL,
    pessoas_responsaveis character varying(250) NOT NULL
);


ALTER TABLE eventos.pessoas_responsaveis OWNER TO bd2019;

--
-- TOC entry 238 (class 1259 OID 31437)
-- Name: possui; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.possui (
    id_area numeric(10,0) NOT NULL,
    quantidade numeric(10,0) NOT NULL,
    id_equ numeric(10,0) NOT NULL
);


ALTER TABLE eventos.possui OWNER TO bd2019;

--
-- TOC entry 239 (class 1259 OID 31442)
-- Name: precisa_de; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.precisa_de (
    id_pre numeric(10,0) NOT NULL,
    id_equ numeric(10,0) NOT NULL,
    quantidade numeric(10,0) NOT NULL,
    codigo_da_atividade numeric(10,0) NOT NULL
);


ALTER TABLE eventos.precisa_de OWNER TO bd2019;

--
-- TOC entry 240 (class 1259 OID 31449)
-- Name: premio; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.premio (
    codigo_da_atividade numeric(10,0) NOT NULL,
    colocacao numeric(5,0) NOT NULL,
    tipo character varying(50) NOT NULL
);


ALTER TABLE eventos.premio OWNER TO bd2019;

--
-- TOC entry 241 (class 1259 OID 31454)
-- Name: produto; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.produto (
    codigo numeric(9,0) NOT NULL,
    nome character(20) NOT NULL,
    tipo character(1) NOT NULL,
    valor_un numeric(6,2) NOT NULL
);


ALTER TABLE eventos.produto OWNER TO bd2019;

--
-- TOC entry 242 (class 1259 OID 31459)
-- Name: promove_atividade; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.promove_atividade (
    codigo_da_atividade numeric(10,0) NOT NULL,
    cnp_corpo numeric(9,0) NOT NULL,
    cnp_filial numeric(4,0) NOT NULL,
    cnp_controle numeric(2,0) NOT NULL
);


ALTER TABLE eventos.promove_atividade OWNER TO bd2019;

--
-- TOC entry 243 (class 1259 OID 31464)
-- Name: promove_evento; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.promove_evento (
    cnp_corpo numeric(9,0) NOT NULL,
    cnp_filial numeric(4,0) NOT NULL,
    cnp_controle numeric(2,0) NOT NULL,
    nome character varying(150) NOT NULL,
    edicao numeric(150,0) NOT NULL
);


ALTER TABLE eventos.promove_evento OWNER TO bd2019;

--
-- TOC entry 244 (class 1259 OID 31469)
-- Name: realiza; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.realiza (
    cnp_corpo numeric(9,0) NOT NULL,
    cnp_filial numeric(4,0) NOT NULL,
    cnp_controle numeric(2,0) NOT NULL,
    nome character varying(150) NOT NULL,
    edicao numeric(150,0) NOT NULL
);


ALTER TABLE eventos.realiza OWNER TO bd2019;

--
-- TOC entry 245 (class 1259 OID 31474)
-- Name: realizada_em; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.realizada_em (
    cod_atividade numeric(10,0) NOT NULL,
    id_area numeric(10,0) NOT NULL
);


ALTER TABLE eventos.realizada_em OWNER TO bd2019;

--
-- TOC entry 246 (class 1259 OID 31479)
-- Name: regra; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.regra (
    codigo_da_atividade numeric(10,0) NOT NULL,
    regra character varying(6000) NOT NULL
);


ALTER TABLE eventos.regra OWNER TO bd2019;

--
-- TOC entry 247 (class 1259 OID 31487)
-- Name: responsavel_por_sessao; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.responsavel_por_sessao (
    cpf_corpo numeric(9,0) NOT NULL,
    cpf_controle character(2) NOT NULL,
    codigo_da_atividade numeric(10,0) NOT NULL
);


ALTER TABLE eventos.responsavel_por_sessao OWNER TO bd2019;

--
-- TOC entry 248 (class 1259 OID 31492)
-- Name: reuniao; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.reuniao (
    codigo_da_atividade numeric(10,0) NOT NULL,
    objetivo character varying(250) NOT NULL
);


ALTER TABLE eventos.reuniao OWNER TO bd2019;

--
-- TOC entry 249 (class 1259 OID 31497)
-- Name: seleciona; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.seleciona (
    cpf_corpo numeric(9,0) NOT NULL,
    cpf_controle character(2) NOT NULL,
    numero numeric(10,0) NOT NULL
);


ALTER TABLE eventos.seleciona OWNER TO bd2019;

--
-- TOC entry 250 (class 1259 OID 31502)
-- Name: sessao_de_artigo; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.sessao_de_artigo (
    codigo_da_atividade numeric(10,0) NOT NULL,
    numero_da_sessao numeric(2,0) NOT NULL,
    nome_de_sessao character varying(250) NOT NULL
);


ALTER TABLE eventos.sessao_de_artigo OWNER TO bd2019;

--
-- TOC entry 251 (class 1259 OID 31507)
-- Name: stand; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.stand (
    nome character varying(250) NOT NULL,
    cnp_corpo numeric(9,0) NOT NULL,
    cnp_filial numeric(4,0) NOT NULL,
    cnp_controle character(2) NOT NULL,
    tipo character varying(10) NOT NULL,
    var_nome character varying(150) NOT NULL,
    var_edicao numeric(150,0) NOT NULL
);


ALTER TABLE eventos.stand OWNER TO bd2019;

--
-- TOC entry 252 (class 1259 OID 31512)
-- Name: taxa_de_patrocinio; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.taxa_de_patrocinio (
    id_taxa numeric(10,0) NOT NULL,
    categoria character(1) NOT NULL,
    valor_minimo numeric(15,2) NOT NULL,
    nome character varying(150) NOT NULL,
    edicao numeric(3,0) NOT NULL
);


ALTER TABLE eventos.taxa_de_patrocinio OWNER TO bd2019;

--
-- TOC entry 269 (class 1259 OID 46119)
-- Name: taxa_inscricao_seq; Type: SEQUENCE; Schema: eventos; Owner: bd2019
--

CREATE SEQUENCE eventos.taxa_inscricao_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE eventos.taxa_inscricao_seq OWNER TO bd2019;

--
-- TOC entry 253 (class 1259 OID 31517)
-- Name: taxa_inscricao; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.taxa_inscricao (
    id_taxa_ins numeric(20,0) DEFAULT nextval('eventos.taxa_inscricao_seq'::regclass) NOT NULL,
    faixa_de_inscricao character(1) NOT NULL,
    valor numeric(6,2) NOT NULL,
    nome character varying(150) NOT NULL,
    edicao numeric(150,0) NOT NULL
);


ALTER TABLE eventos.taxa_inscricao OWNER TO bd2019;

--
-- TOC entry 254 (class 1259 OID 31522)
-- Name: tutorial; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.tutorial (
    codigo_da_atividade numeric(10,0) NOT NULL,
    tema character varying(250) NOT NULL,
    publico_alvo character varying(150) NOT NULL,
    valor_inscricao numeric(6,0) NOT NULL,
    cpf_corpo numeric(9,0) NOT NULL,
    cpf_controle character(2) NOT NULL
);


ALTER TABLE eventos.tutorial OWNER TO bd2019;

--
-- TOC entry 256 (class 1259 OID 31532)
-- Name: venda; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.venda (
    numero numeric(5,0) NOT NULL,
    numero_nota numeric(20,0) NOT NULL,
    nome_cliente character varying(250) NOT NULL,
    data_hora date NOT NULL,
    valor numeric(6,2) NOT NULL
);


ALTER TABLE eventos.venda OWNER TO bd2019;

--
-- TOC entry 257 (class 1259 OID 31539)
-- Name: vende; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.vende (
    codigo numeric(9,0) NOT NULL,
    cnp_corpo numeric(9,0) NOT NULL,
    cnp_filial numeric(4,0) NOT NULL,
    cnp_controle character(2) NOT NULL
);


ALTER TABLE eventos.vende OWNER TO bd2019;

--
-- TOC entry 258 (class 1259 OID 31544)
-- Name: vendido; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.vendido (
    codigo numeric(9,0) NOT NULL,
    numero numeric(5,0) NOT NULL,
    quantidade numeric(3,0) NOT NULL
);


ALTER TABLE eventos.vendido OWNER TO bd2019;

--
-- TOC entry 259 (class 1259 OID 31549)
-- Name: workshop; Type: TABLE; Schema: eventos; Owner: bd2019
--

CREATE TABLE eventos.workshop (
    codigo_da_atividade numeric(10,0) NOT NULL,
    tema character varying(100) NOT NULL,
    publico_alvo character varying(150) NOT NULL,
    valor_inscricao numeric(6,2) NOT NULL
);


ALTER TABLE eventos.workshop OWNER TO bd2019;

--
-- TOC entry 4723 (class 0 OID 31240)
-- Dependencies: 201
-- Data for Name: apresentado_em; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.apresentado_em (numero, codigo_da_atividade) FROM stdin;
1	3
1	25
\.


--
-- TOC entry 4724 (class 0 OID 31245)
-- Dependencies: 202
-- Data for Name: area_local; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.area_local (id_area, id_local, nome_da_area, capacidade) FROM stdin;
1	1	Auditório Verde	150
2	1	Auditório Vermelho	150
3	1	Auditório Azul	300
4	2	Setor A	1000
5	2	Setor B	1000
\.


--
-- TOC entry 4725 (class 0 OID 31250)
-- Dependencies: 203
-- Data for Name: artigo; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.artigo (tipo, editora, numero, nome) FROM stdin;
Saúde	Editora ABC	3	Crimes no setor de Enfermagem
Programação	Editora DEF	4	Otimizando algoritmos em aplicações Java
Engenharia	Editora Z	5	Engenharia de Vidros e seus desafios
Arduino	Editora ABC	1	Passos em direção à Inteligência Artificial
Inteligência Artificial	Editora DEF	2	Inteligência Artificial Distribuída
\.


--
-- TOC entry 4726 (class 0 OID 31255)
-- Dependencies: 204
-- Data for Name: atividade; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.atividade (codigo_da_atividade, nome, data_hora_inicio, data_hora_fim, capacidade_minima, workshop, tutorial, sessao_de_artigo, reuniao, palestra, concurso, atividade_social, pos_nome, pos_edicao) FROM stdin;
4	Curso de Primeiros Socorros	2019-05-12 08:00:00	2019-05-12 12:00:00	50	\N	1	\N	\N	\N	\N	\N	Semana de Enfermagem	27
5	Boas Práticas de Programação	2019-05-12 10:00:00	2019-05-12 12:00:00	30	\N	1	\N	\N	\N	\N	\N	Semana de SI	9
6	Internet das Coisas	2019-10-21 10:00:00	2019-10-21 12:00:00	30	\N	1	\N	\N	\N	\N	\N	Semana da Engenharia Elétrica	7
7	Almoço da Semana de LZT	2019-09-09 12:00:00	2019-09-09 14:00:00	30	\N	\N	\N	\N	\N	\N	1	Semana de Lazer e Turismo	7
9	Abertura da CC12	2019-08-12 08:00:00	2019-08-12 09:00:00	1000	\N	\N	\N	\N	\N	\N	1	Campus Party	12
8	Almoço da Semana de SI	2019-09-09 12:00:00	2019-09-09 14:00:00	30	\N	\N	\N	\N	\N	\N	1	Semana de SI	9
11	Encerramento	2019-08-12 21:00:00	2019-08-12 22:00:00	200	\N	\N	\N	\N	\N	\N	1	Semana de SI	9
10	Confraternização dos Resgatadores de ETs	2019-12-01 08:00:00	2019-12-01 12:00:00	500	\N	\N	\N	\N	\N	\N	1	Resgate do ET de Varginha	2
12	Workshop do PPgSI	2019-08-15 16:00:00	2019-08-15 18:00:00	100	1	\N	\N	\N	\N	\N	\N	Semana de SI	9
13	Workshop de Arduino	2019-10-21 14:00:00	2019-10-21 18:00:00	150	1	\N	\N	\N	\N	\N	\N	Semana da Engenharia Elétrica	7
14	Workshop de Construção de Drones	2019-10-22 14:00:00	2019-10-22 18:00:00	150	1	\N	\N	\N	\N	\N	\N	Semana da Engenharia Elétrica	7
15	Confecção de Ferramentas	2019-12-01 09:00:00	2019-12-01 12:00:00	1000	1	\N	\N	\N	\N	\N	\N	Resgate do ET de Varginha	2
19	Interação com Brinquedos Inteligentes	2019-09-12 09:00:00	2019-09-12 12:00:00	10	1	\N	\N	\N	\N	\N	\N	Semana de Lazer e Turismo	7
22	Qualidade do tratamento de Idosos	2019-09-13 08:00:00	2019-09-13 10:00:00	150	\N	\N	\N	\N	1	\N	\N	Semana de Enfermagem	27
23	Desafios na escalabilidade de aplicações modernas	2019-08-15 08:00:00	2019-08-15 10:00:00	300	\N	\N	\N	\N	1	\N	\N	Semana de SI	9
24	Como se comunicar com extraterrestres de forma efetiva	2019-12-01 13:00:00	2019-12-01 15:00:00	200	\N	\N	\N	\N	1	\N	\N	Resgate do ET de Varginha	2
21	Influência das mídias digitais no Turismo	2019-09-14 08:00:00	2019-09-14 10:00:00	150	\N	\N	\N	\N	1	\N	\N	Semana de Lazer e Turismo	7
20	Turismo Ecológico no Brasil	2019-09-13 08:00:00	2019-09-13 10:00:00	100	\N	\N	\N	\N	1	\N	\N	Semana de Lazer e Turismo	7
3	Arduino: Um equipamento barato e multiuso para laboratórios	2019-08-12 08:00:00	2019-08-12 10:00:00	50	\N	\N	1	\N	\N	\N	\N	Semana de SI	9
25	Arduino: Um equipamento barato e multiuso para laboratórios	2019-08-13 08:00:00	2019-08-13 10:00:00	50	\N	\N	1	\N	\N	\N	\N	Semana da Engenharia Elétrica	7
26	Batalha de Rimas do Campus Party	2019-06-01 11:00:00	2019-06-01 16:00:00	500	\N	\N	\N	\N	\N	1	\N	Campus Party	12
27	Show de Talentos SSI	2019-08-12 14:00:00	2019-08-12 20:00:00	300	\N	\N	\N	\N	\N	1	\N	Semana de SI	9
\.


--
-- TOC entry 4727 (class 0 OID 31260)
-- Dependencies: 205
-- Data for Name: atividade_social; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.atividade_social (codigo_da_atividade, tipo, valor_convite) FROM stdin;
10	Confraternização	20.00
11	Confraternização	0.00
7	Confraternização	0.00
8	Exibição	10.00
9	Confraternização	2.00
\.


--
-- TOC entry 4728 (class 0 OID 31265)
-- Dependencies: 206
-- Data for Name: autor_de_artigo; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.autor_de_artigo (cpf_corpo, cpf_controle, afiliacao, numero) FROM stdin;
\.


--
-- TOC entry 4729 (class 0 OID 31270)
-- Dependencies: 207
-- Data for Name: beneficio_patrocinio; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.beneficio_patrocinio (id_taxa, beneficio) FROM stdin;
\.


--
-- TOC entry 4730 (class 0 OID 31275)
-- Dependencies: 208
-- Data for Name: certificado; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.certificado (numero, tipo) FROM stdin;
1	A
2	B
3	A
4	B
11	C
19	C
\.


--
-- TOC entry 4731 (class 0 OID 31280)
-- Dependencies: 209
-- Data for Name: concurso; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.concurso (codigo_da_atividade, tema) FROM stdin;
26	Rap
27	Geral
\.


--
-- TOC entry 4732 (class 0 OID 31285)
-- Dependencies: 210
-- Data for Name: conta_a_pagar; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.conta_a_pagar (id, numero_nota, descricao, nome, edicao, data_pgto) FROM stdin;
1	7	Aluguel Equipamentos	Semana de Lazer e Turismo	7	2020-12-01
3	8	Aluguel Equipamentos	Semana de SI	9	2020-07-01
5	9	Aluguel Equipamentos	Semana da Engenharia Elétrica	7	2020-02-01
7	10	Aluguel Equipamentos	Semana de Enfermagem	27	2019-12-01
8	11	Ambulância	Resgate do ET de Varginha	2	2019-01-01
\.


--
-- TOC entry 4733 (class 0 OID 31295)
-- Dependencies: 211
-- Data for Name: conta_a_receber; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.conta_a_receber (id, numero_nota, descricao, nome, edicao, data_pgto) FROM stdin;
1	3	Patrocínio Google	Campus Party	12	2019-11-10
3	2	Patrocínio Nubank	Campus Party	12	2019-12-01
4	4	Patrocínio Governo	Campus Party	12	2019-12-01
5	5	Venda de produtos dia 10	Campus Party	12	2019-12-10
6	6	Venda de produtos dia 11	Campus Party	12	2019-12-11
\.


--
-- TOC entry 4734 (class 0 OID 31305)
-- Dependencies: 212
-- Data for Name: emite_certificado; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.emite_certificado (numero, data_de_emissao, cpf_corpo, cpf_controle, nome, edicao) FROM stdin;
1	2019-08-15	388476388	10	Semana de SI	9
3	2019-11-10	384158408	02	Semana de SI	9
4	2019-11-10	384158408	02	Campus Party	12
11	2019-11-22	141	41	Semana de SI	9
19	2019-11-22	141	41	Semana de SI	9
\.


--
-- TOC entry 4735 (class 0 OID 31310)
-- Dependencies: 213
-- Data for Name: entidade; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.entidade (cnp_corpo, cnp_filial, cnp_controle, razao_social, end_logradouro, end_cidade, end_estado, end_cep) FROM stdin;
63025530	101	77	Agência USP de Inovação	Avenida Torres De Oliveira, 76	São Paulo	SP	5347902
6990590	1	23	Google Brasil	Avenida Brigadeiro Faria Lima, 3477	São Paulo	SP	4538133
13347016	1	17	Facebook Brasil	Rua Leopoldo Couto de Magalhães Junior, 700	São Paulo	SP	4542000
111222333	1	66	Pastelaria do Mário	Rua Augusta, 1000	São Paulo	SP	12345678
444555666	1	99	Padaria Nossa Senhora do Cinco Bola	Avenida Luz no Fim do Túnel, 5	Belo Horizonte	MG	87654321
\.


--
-- TOC entry 4736 (class 0 OID 31315)
-- Dependencies: 214
-- Data for Name: equipamento; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.equipamento (id_equ, nome_equipamento, tipo) FROM stdin;
\.


--
-- TOC entry 4737 (class 0 OID 31322)
-- Dependencies: 215
-- Data for Name: equipe; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.equipe (id_equipe, nome) FROM stdin;
\.


--
-- TOC entry 4738 (class 0 OID 31327)
-- Dependencies: 216
-- Data for Name: estoca; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.estoca (id_est, cod_produto, cnp_corpo, cnp_filial, cnp_controle, quantidade, data_hora) FROM stdin;
\.


--
-- TOC entry 4739 (class 0 OID 31332)
-- Dependencies: 217
-- Data for Name: evento; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.evento (nome, edicao, tema, data_hora_inicio, data_hora_fim, id_local) FROM stdin;
Semana de SI	9	Sistemas de Informação	2019-08-12	2019-08-16	1
Campus Party	12	Sistemas de Informação	2019-02-12	2019-02-17	2
Semana de Enfermagem	27	Saúde	2019-05-12	2019-05-20	5
Semana da Engenharia Elétrica	7	Engenharia	2019-10-21	2019-10-25	6
Semana de Lazer e Turismo	7	Lazer e Turismo	2019-09-09	2019-09-13	1
Resgate do ET de Varginha	2	Astronomia	2019-12-01	2019-12-01	1
\.


--
-- TOC entry 4740 (class 0 OID 31337)
-- Dependencies: 218
-- Data for Name: fornece; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.fornece (cnp_corpo, cnp_filial, cnp_controle, codigo) FROM stdin;
\.


--
-- TOC entry 4741 (class 0 OID 31342)
-- Dependencies: 219
-- Data for Name: fornecedor; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.fornecedor (cnp_corpo, cnp_filial, cnp_controle, nome, end_logradouro, end_cidade, end_uf, end_cep) FROM stdin;
\.


--
-- TOC entry 4742 (class 0 OID 31347)
-- Dependencies: 220
-- Data for Name: inscricao; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.inscricao (n_inscricao, numero_nota, id_taxa_ins, desconto, cpf_corpo, cpf_controle, nome, edicao, forma_de_pagamento, data_de_inscricao) FROM stdin;
5	16	1	0.00	384158408	02	Campus Party	12	Crédito   	2019-12-30
6	17	1	0.00	388476388	10	Campus Party	12	Crédito   	2019-12-30
8	18	1	0.00	113136170	91	Campus Party	12	Crédito   	2019-12-30
7	19	1	0.00	424038268	80	Campus Party	12	Crédito   	2019-12-30
9	20	1	0.00	113136170	91	Campus Party	12	Crédito   	2019-12-30
\.


--
-- TOC entry 4743 (class 0 OID 31352)
-- Dependencies: 221
-- Data for Name: juiz; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.juiz (cpf_corpo, cpf_controle) FROM stdin;
141	41
113136170	91
897564231	10
\.


--
-- TOC entry 4744 (class 0 OID 31357)
-- Dependencies: 222
-- Data for Name: julga; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.julga (codigo_da_atividade, cpf_corpo, cpf_controle) FROM stdin;
26	141	41
27	141	41
27	113136170	91
26	897564231	10
\.


--
-- TOC entry 4745 (class 0 OID 31362)
-- Dependencies: 223
-- Data for Name: local; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.local (id_local, nome, capacidade, qualidade, end_logradouro, end_cidade, end_estado, end_cep, end_numero) FROM stdin;
1	EACH USP	1000	10	Rua Arlindo Béttio	São Paulo	SP	3828000	1000
2	Expo Center Norte	4500	8	Rua José Bernardo Pinto	São Paulo	SP	2055000	333
3	IME USP	500	9	Rua do Matão	São Paulo	SP	5508090	1010
4	Allianz Park	55000	7	Avenida Francisco Matarazzo	São Paulo	SP	5001200	1705
5	UFMG	5000	5	Avenida Presidente Antônio Carlos	Belo Horizonte	MG	31270901	6627
6	UFRJ	10000	5	Avenida Pedro Calmon	Rio de Janeiro	RJ	21941901	550
\.


--
-- TOC entry 4746 (class 0 OID 31367)
-- Dependencies: 224
-- Data for Name: lojista; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.lojista (nome, matricula, cpf_corpo, cpf_controle, cnp_corpo, cnp_filial, cnp_controle) FROM stdin;
\.


--
-- TOC entry 4747 (class 0 OID 31372)
-- Dependencies: 225
-- Data for Name: membro_do_comite; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.membro_do_comite (cpf_corpo, cpf_controle) FROM stdin;
\.


--
-- TOC entry 4748 (class 0 OID 31377)
-- Dependencies: 226
-- Data for Name: minicurriculo_autor; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.minicurriculo_autor (cpf_corpo, cpf_controle, minicurriculo_autor) FROM stdin;
\.


--
-- TOC entry 4749 (class 0 OID 31382)
-- Dependencies: 227
-- Data for Name: minicurriculo_palestrante; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.minicurriculo_palestrante (cpf_corpo, cpf_controle, minicurriculo_palestrante) FROM stdin;
\.


--
-- TOC entry 4750 (class 0 OID 31387)
-- Dependencies: 228
-- Data for Name: ministrante_de_tutorial; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.ministrante_de_tutorial (cpf_corpo, cpf_controle) FROM stdin;
\.


--
-- TOC entry 4751 (class 0 OID 31392)
-- Dependencies: 229
-- Data for Name: nota_fiscal; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.nota_fiscal (numero_nota, cnp_corpo, cnp_filial, cnp_controle, data_emissao, valor) FROM stdin;
1	123456789	1	12	2019-10-30	50.00
3	456456456	7	89	2019-12-30	100000.00
2	123123123	4	56	2019-11-30	50000.00
4	789789789	1	23	2019-12-30	20000.00
5	777888999	1	23	2019-12-30	20000.00
6	111222333	4	56	2019-12-30	30000.00
9	123456789	1	12	2019-12-30	2500.00
10	123456789	1	12	2019-12-30	500.00
11	456456456	7	89	2019-12-30	300.00
12	456456456	7	89	2019-12-30	300.00
13	123123123	4	56	2019-12-30	1000.00
14	123123123	4	56	2019-12-30	2000.00
15	444555666	7	89	2019-12-30	2000.00
7	444555666	7	89	2019-12-30	4000.00
8	123456789	1	12	2019-12-30	4000.00
16	121343565	7	89	2019-12-30	50.00
17	121343565	7	89	2019-12-30	50.00
18	121343565	7	89	2019-12-30	50.00
19	121343565	7	89	2019-12-30	70.00
20	121343565	7	89	2019-12-30	70.00
21	121343565	7	89	2019-12-30	100.00
22	121343565	7	89	2019-12-30	100.00
23	121343565	7	89	2019-12-30	100.00
24	121343565	7	89	2019-12-30	100.00
25	121343565	7	89	2019-12-30	100.00
26	121343565	7	89	2019-12-30	120.00
27	121343565	7	89	2019-12-30	120.00
28	121343565	7	89	2019-12-30	120.00
29	121343565	7	89	2019-12-30	120.00
30	999888777	1	96	2019-12-30	1000.00
31	666555444	1	32	2019-12-30	55555.00
32	63025530	101	77	2019-12-30	2000.00
33	6990590	1	23	2019-12-30	2000.00
35	13347016	1	17	2019-12-30	5000.00
\.


--
-- TOC entry 4752 (class 0 OID 31397)
-- Dependencies: 230
-- Data for Name: organiza; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.organiza (id_equipe, nome, edicao) FROM stdin;
\.


--
-- TOC entry 4753 (class 0 OID 31402)
-- Dependencies: 231
-- Data for Name: organizador; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.organizador (pos_id_equipe, nome, cpf_corpo, cpf_controle, matricula, id_equipe) FROM stdin;
\.


--
-- TOC entry 4754 (class 0 OID 31407)
-- Dependencies: 232
-- Data for Name: palestra; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.palestra (codigo_da_atividade, tema) FROM stdin;
20	Meio Ambiente
22	Gerontologia
23	Sistemas de Informação
24	Astronomia
\.


--
-- TOC entry 4755 (class 0 OID 31412)
-- Dependencies: 233
-- Data for Name: palestrante; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.palestrante (cpf_corpo, cpf_controle, afiliacao, codigo_da_atividade) FROM stdin;
\.


--
-- TOC entry 4777 (class 0 OID 31527)
-- Dependencies: 255
-- Data for Name: participa_de; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.participa_de (codigo_da_atividade, cpf_corpo, cpf_controle) FROM stdin;
\.


--
-- TOC entry 4756 (class 0 OID 31417)
-- Dependencies: 234
-- Data for Name: participante; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.participante (cpf_corpo, cpf_controle, nome, cidade_origem) FROM stdin;
388476388	10	Rafael Braz	São Paulo
451042358	66	Bianca Lima	São Paulo
141	41	Machado de Assis	Rio de Janeiro
384158408	02	Renan Nakazawa	São Paulo
424038268	80	Otávio Hideki Higa	São Paulo
113136170	91	Arnold Schwarzenegger	Curitiba
897564231	10	João Gordo	São Paulo
231564897	10	João da Silva	São Paulo
356897478	90	Horácio García	Manaus
228550845	87	Abner Roberto de Jesus	Salvador
304742523	49	Glória Pires	Rio de Janeiro
842795835	20	Fernanda Montenegro	Rio de Janeiro
359065503	94	Marina Ruy Barbosa	Rio de Janeiro
413278854	02	Maria da Graça Meneghel	Santa Rosa
740225882	64	Antônio de Carvalho Barbosa	Arapongas
517004879	96	Fausto Corrêa da Silva	Porto Ferreira
279553443	48	Senor Abravanel	Rio de Janeiro
413278854	22	Bruno Gagliasso Marques	Rio de Janeiro
789109550	74	Agatha Cerqueira Pereira Moreira	Olária
551273910	51	Tarcísio Pereira de Magalhães Sobrinho	São Paulo
888631559	84	Taís Bianca Gama de Araújo Ramos	Rio de Janeiro
721384313	99	Joâo da Silva	Porto Alegre
743470408	62	Joâo da Silva Santos	São Paulo
703364194	54	Joâo da Silva	São Paulo
323943218	23	José Mayer Drumond Araujo	Jaraguaçu
845886898	80	Maria de Lourdes da Silveira Mäder	Rio de Janeiro
291189376	08	Reynaldo Cisotto Gianecchini Júnior	Birigui
157622128	37	Bruna Reis Maia	Duque de Caxias
328973082	62	Adriana Esteves Agostinho Brichta	Rio de Janeiro
656282100	91	Pedro Cardoso Martins Moreira	Campinas
698302853	47	Grazielli Massafera	Jacarézinho
892178395	40	Elisabeth Maria Silva de Faria	Curitiba
974831144	89	Marco Fábio Maldonado Pigossi	São Paulo
997033890	22	Camila Tavares de Queiroz Toledo	Ribeirão Preto
100321009	11	Luiz de Queiroz	Piracicaba
828727485	24	Marco Antônio Barroso Nanini	Recife
322766593	13	Vitória Longaray Strada	Porto Alegre
640734598	25	Caroline Paola Oliveira da Silva	São Paulo
292900020	53	Jonathan Azevedo	Rio de Janeiro
604844755	81	Paulo Sérgio Betti	Rafard
508457362	58	Pedro Carvalho	João Pessoa
805143301	71	Regina Blois Duarte	Franca
292910020	53	Thiago Ribeiro Lacerda	Rio de Janeiro
387878345	70	Maria Carolina Álvares Ferraz	Morrinhos
104625436	61	Marcello Couto Antony de Farias	Goiânia
244949465	19	Klebber Toledo Queiroz	Bom Jesus dos Perdões
870168067	17	Flávia Alessandra Martins da Costa	Arraial do Cabo
371779175	27	Murilo Benício Ribeiro	Niterói
126381536	53	Rômulo Aranha Estrela	São Luís
561346319	12	José Pereira de Abreu Júnior	Santa Rita do Passa Quatro
\.


--
-- TOC entry 4757 (class 0 OID 31422)
-- Dependencies: 235
-- Data for Name: participante_de_reuniao; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.participante_de_reuniao (cpf_corpo, cpf_controle) FROM stdin;
\.


--
-- TOC entry 4758 (class 0 OID 31427)
-- Dependencies: 236
-- Data for Name: patrocina; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.patrocina (numero_nota, cnp_corpo, cnp_filial, cnp_controle, nome, edicao, id_taxa) FROM stdin;
30	111222333	1	66	Campus Party	12	11201
31	444555666	1	99	Campus Party	12	11205
32	63025530	101	77	Campus Party	12	11202
32	6990590	1	23	Campus Party	12	11203
35	13347016	1	17	Campus Party	12	11204
\.


--
-- TOC entry 4759 (class 0 OID 31432)
-- Dependencies: 237
-- Data for Name: pessoas_responsaveis; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.pessoas_responsaveis (cnp_corpo, cnp_filial, cnp_controle, pessoas_responsaveis) FROM stdin;
\.


--
-- TOC entry 4760 (class 0 OID 31437)
-- Dependencies: 238
-- Data for Name: possui; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.possui (id_area, quantidade, id_equ) FROM stdin;
\.


--
-- TOC entry 4761 (class 0 OID 31442)
-- Dependencies: 239
-- Data for Name: precisa_de; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.precisa_de (id_pre, id_equ, quantidade, codigo_da_atividade) FROM stdin;
\.


--
-- TOC entry 4762 (class 0 OID 31449)
-- Dependencies: 240
-- Data for Name: premio; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.premio (codigo_da_atividade, colocacao, tipo) FROM stdin;
\.


--
-- TOC entry 4763 (class 0 OID 31454)
-- Dependencies: 241
-- Data for Name: produto; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.produto (codigo, nome, tipo, valor_un) FROM stdin;
\.


--
-- TOC entry 4764 (class 0 OID 31459)
-- Dependencies: 242
-- Data for Name: promove_atividade; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.promove_atividade (codigo_da_atividade, cnp_corpo, cnp_filial, cnp_controle) FROM stdin;
\.


--
-- TOC entry 4765 (class 0 OID 31464)
-- Dependencies: 243
-- Data for Name: promove_evento; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.promove_evento (cnp_corpo, cnp_filial, cnp_controle, nome, edicao) FROM stdin;
63025530	101	77	Semana de SI	9
6990590	1	23	Semana de SI	9
6990590	1	23	Semana da Engenharia Elétrica	7
13347016	1	17	Campus Party	12
444555666	1	99	Semana de Enfermagem	27
\.


--
-- TOC entry 4766 (class 0 OID 31469)
-- Dependencies: 244
-- Data for Name: realiza; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.realiza (cnp_corpo, cnp_filial, cnp_controle, nome, edicao) FROM stdin;
63025530	101	77	Semana de SI	9
63025530	101	77	Semana de Lazer e Turismo	7
111222333	1	66	Resgate do ET de Varginha	2
444555666	1	99	Resgate do ET de Varginha	2
444555666	1	99	Semana da Engenharia Elétrica	7
\.


--
-- TOC entry 4767 (class 0 OID 31474)
-- Dependencies: 245
-- Data for Name: realizada_em; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.realizada_em (cod_atividade, id_area) FROM stdin;
\.


--
-- TOC entry 4768 (class 0 OID 31479)
-- Dependencies: 246
-- Data for Name: regra; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.regra (codigo_da_atividade, regra) FROM stdin;
\.


--
-- TOC entry 4769 (class 0 OID 31487)
-- Dependencies: 247
-- Data for Name: responsavel_por_sessao; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.responsavel_por_sessao (cpf_corpo, cpf_controle, codigo_da_atividade) FROM stdin;
\.


--
-- TOC entry 4770 (class 0 OID 31492)
-- Dependencies: 248
-- Data for Name: reuniao; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.reuniao (codigo_da_atividade, objetivo) FROM stdin;
\.


--
-- TOC entry 4771 (class 0 OID 31497)
-- Dependencies: 249
-- Data for Name: seleciona; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.seleciona (cpf_corpo, cpf_controle, numero) FROM stdin;
\.


--
-- TOC entry 4772 (class 0 OID 31502)
-- Dependencies: 250
-- Data for Name: sessao_de_artigo; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.sessao_de_artigo (codigo_da_atividade, numero_da_sessao, nome_de_sessao) FROM stdin;
3	1	Introdução
25	2	Visão Geral
\.


--
-- TOC entry 4773 (class 0 OID 31507)
-- Dependencies: 251
-- Data for Name: stand; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.stand (nome, cnp_corpo, cnp_filial, cnp_controle, tipo, var_nome, var_edicao) FROM stdin;
\.


--
-- TOC entry 4774 (class 0 OID 31512)
-- Dependencies: 252
-- Data for Name: taxa_de_patrocinio; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.taxa_de_patrocinio (id_taxa, categoria, valor_minimo, nome, edicao) FROM stdin;
11205	5	20000.00	Campus Party	12
11201	1	1000.00	Campus Party	12
11202	2	2000.00	Campus Party	12
11203	3	5000.00	Campus Party	12
11204	4	10000.00	Campus Party	12
20901	1	100.00	Semana de SI	9
20902	2	300.00	Semana de SI	9
\.


--
-- TOC entry 4775 (class 0 OID 31517)
-- Dependencies: 253
-- Data for Name: taxa_inscricao; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.taxa_inscricao (id_taxa_ins, faixa_de_inscricao, valor, nome, edicao) FROM stdin;
27	a	27.00	Semana de SI	9
1	1	50.00	Campus Party	12
2	2	60.00	Campus Party	12
3	3	70.00	Campus Party	12
4	4	100.00	Campus Party	12
5	5	120.00	Campus Party	12
\.


--
-- TOC entry 4776 (class 0 OID 31522)
-- Dependencies: 254
-- Data for Name: tutorial; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.tutorial (codigo_da_atividade, tema, publico_alvo, valor_inscricao, cpf_corpo, cpf_controle) FROM stdin;
\.


--
-- TOC entry 4778 (class 0 OID 31532)
-- Dependencies: 256
-- Data for Name: venda; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.venda (numero, numero_nota, nome_cliente, data_hora, valor) FROM stdin;
\.


--
-- TOC entry 4779 (class 0 OID 31539)
-- Dependencies: 257
-- Data for Name: vende; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.vende (codigo, cnp_corpo, cnp_filial, cnp_controle) FROM stdin;
\.


--
-- TOC entry 4780 (class 0 OID 31544)
-- Dependencies: 258
-- Data for Name: vendido; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.vendido (codigo, numero, quantidade) FROM stdin;
\.


--
-- TOC entry 4781 (class 0 OID 31549)
-- Dependencies: 259
-- Data for Name: workshop; Type: TABLE DATA; Schema: eventos; Owner: bd2019
--

COPY eventos.workshop (codigo_da_atividade, tema, publico_alvo, valor_inscricao) FROM stdin;
12	Geral	Pós-Graduandos	0.00
13	Robótica	Todos	0.00
14	Robótica	Todos	0.00
15	Astronomia	Todos	10.00
19	Brinquedos	Todos	0.00
\.


--
-- TOC entry 4795 (class 0 OID 0)
-- Dependencies: 264
-- Name: atividade_seq; Type: SEQUENCE SET; Schema: eventos; Owner: bd2019
--

SELECT pg_catalog.setval('eventos.atividade_seq', 25, true);


--
-- TOC entry 4796 (class 0 OID 0)
-- Dependencies: 263
-- Name: certificado_seq; Type: SEQUENCE SET; Schema: eventos; Owner: bd2019
--

SELECT pg_catalog.setval('eventos.certificado_seq', 5, false);


--
-- TOC entry 4797 (class 0 OID 0)
-- Dependencies: 267
-- Name: conta_pagar_seq; Type: SEQUENCE SET; Schema: eventos; Owner: bd2019
--

SELECT pg_catalog.setval('eventos.conta_pagar_seq', 8, true);


--
-- TOC entry 4798 (class 0 OID 0)
-- Dependencies: 266
-- Name: conta_receber_seq; Type: SEQUENCE SET; Schema: eventos; Owner: bd2019
--

SELECT pg_catalog.setval('eventos.conta_receber_seq', 8, true);


--
-- TOC entry 4799 (class 0 OID 0)
-- Dependencies: 262
-- Name: id_area_sequencia; Type: SEQUENCE SET; Schema: eventos; Owner: bd2019
--

SELECT pg_catalog.setval('eventos.id_area_sequencia', 19, true);


--
-- TOC entry 4800 (class 0 OID 0)
-- Dependencies: 268
-- Name: inscricao_seq; Type: SEQUENCE SET; Schema: eventos; Owner: bd2019
--

SELECT pg_catalog.setval('eventos.inscricao_seq', 9, true);


--
-- TOC entry 4801 (class 0 OID 0)
-- Dependencies: 265
-- Name: nota_id_seq; Type: SEQUENCE SET; Schema: eventos; Owner: bd2019
--

SELECT pg_catalog.setval('eventos.nota_id_seq', 35, true);


--
-- TOC entry 4802 (class 0 OID 0)
-- Dependencies: 269
-- Name: taxa_inscricao_seq; Type: SEQUENCE SET; Schema: eventos; Owner: bd2019
--

SELECT pg_catalog.setval('eventos.taxa_inscricao_seq', 5, true);


--
-- TOC entry 4361 (class 2606 OID 31264)
-- Name: atividade_social fkati_ati_id; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.atividade_social
    ADD CONSTRAINT fkati_ati_id PRIMARY KEY (codigo_da_atividade);


--
-- TOC entry 4371 (class 2606 OID 31284)
-- Name: concurso fkati_con_id; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.concurso
    ADD CONSTRAINT fkati_con_id PRIMARY KEY (codigo_da_atividade);


--
-- TOC entry 4439 (class 2606 OID 31411)
-- Name: palestra fkati_pal_id; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.palestra
    ADD CONSTRAINT fkati_pal_id PRIMARY KEY (codigo_da_atividade);


--
-- TOC entry 4487 (class 2606 OID 31496)
-- Name: reuniao fkati_reu_id; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.reuniao
    ADD CONSTRAINT fkati_reu_id PRIMARY KEY (codigo_da_atividade);


--
-- TOC entry 4492 (class 2606 OID 31506)
-- Name: sessao_de_artigo fkati_ses_id; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.sessao_de_artigo
    ADD CONSTRAINT fkati_ses_id PRIMARY KEY (codigo_da_atividade);


--
-- TOC entry 4503 (class 2606 OID 31526)
-- Name: tutorial fkati_tut_id; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.tutorial
    ADD CONSTRAINT fkati_tut_id PRIMARY KEY (codigo_da_atividade);


--
-- TOC entry 4520 (class 2606 OID 31553)
-- Name: workshop fkati_wor_id; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.workshop
    ADD CONSTRAINT fkati_wor_id PRIMARY KEY (codigo_da_atividade);


--
-- TOC entry 4383 (class 2606 OID 31309)
-- Name: emite_certificado fkemi_cer_id; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.emite_certificado
    ADD CONSTRAINT fkemi_cer_id PRIMARY KEY (numero);


--
-- TOC entry 4510 (class 2606 OID 31538)
-- Name: venda fkemite_nota_id; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.venda
    ADD CONSTRAINT fkemite_nota_id UNIQUE (numero_nota);


--
-- TOC entry 4373 (class 2606 OID 31294)
-- Name: conta_a_pagar fkemite_nota_pagamento_id; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.conta_a_pagar
    ADD CONSTRAINT fkemite_nota_pagamento_id UNIQUE (numero_nota);


--
-- TOC entry 4378 (class 2606 OID 31304)
-- Name: conta_a_receber fkemite_nota_recibo_id; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.conta_a_receber
    ADD CONSTRAINT fkemite_nota_recibo_id UNIQUE (numero_nota);


--
-- TOC entry 4363 (class 2606 OID 31269)
-- Name: autor_de_artigo fkpar_aut_id; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.autor_de_artigo
    ADD CONSTRAINT fkpar_aut_id PRIMARY KEY (cpf_corpo, cpf_controle);


--
-- TOC entry 4413 (class 2606 OID 31356)
-- Name: juiz fkpar_jui_id; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.juiz
    ADD CONSTRAINT fkpar_jui_id PRIMARY KEY (cpf_corpo, cpf_controle);


--
-- TOC entry 4423 (class 2606 OID 31376)
-- Name: membro_do_comite fkpar_mem_id; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.membro_do_comite
    ADD CONSTRAINT fkpar_mem_id PRIMARY KEY (cpf_corpo, cpf_controle);


--
-- TOC entry 4429 (class 2606 OID 31391)
-- Name: ministrante_de_tutorial fkpar_min_id; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.ministrante_de_tutorial
    ADD CONSTRAINT fkpar_min_id PRIMARY KEY (cpf_corpo, cpf_controle);


--
-- TOC entry 4442 (class 2606 OID 31416)
-- Name: palestrante fkpar_pal_id; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.palestrante
    ADD CONSTRAINT fkpar_pal_id PRIMARY KEY (cpf_corpo, cpf_controle);


--
-- TOC entry 4446 (class 2606 OID 31426)
-- Name: participante_de_reuniao fkpar_par_id; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.participante_de_reuniao
    ADD CONSTRAINT fkpar_par_id PRIMARY KEY (cpf_corpo, cpf_controle);


--
-- TOC entry 4484 (class 2606 OID 31491)
-- Name: responsavel_por_sessao fkpar_res_id; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.responsavel_por_sessao
    ADD CONSTRAINT fkpar_res_id PRIMARY KEY (cpf_corpo, cpf_controle);


--
-- TOC entry 4456 (class 2606 OID 31441)
-- Name: possui fkpos_are; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.possui
    ADD CONSTRAINT fkpos_are PRIMARY KEY (id_area, id_equ);


--
-- TOC entry 4437 (class 2606 OID 31406)
-- Name: organizador fkpossui_responsavel_id; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.organizador
    ADD CONSTRAINT fkpossui_responsavel_id UNIQUE (pos_id_equipe);


--
-- TOC entry 4461 (class 2606 OID 31448)
-- Name: precisa_de fkpre_equ_id; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.precisa_de
    ADD CONSTRAINT fkpre_equ_id UNIQUE (id_equ);


--
-- TOC entry 4463 (class 2606 OID 31446)
-- Name: precisa_de id; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.precisa_de
    ADD CONSTRAINT id PRIMARY KEY (id_pre);


--
-- TOC entry 4351 (class 2606 OID 31244)
-- Name: apresentado_em id_apresentado_em; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.apresentado_em
    ADD CONSTRAINT id_apresentado_em PRIMARY KEY (codigo_da_atividade, numero);


--
-- TOC entry 4354 (class 2606 OID 31249)
-- Name: area_local id_area; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.area_local
    ADD CONSTRAINT id_area PRIMARY KEY (id_area);


--
-- TOC entry 4356 (class 2606 OID 31254)
-- Name: artigo id_artigo_id; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.artigo
    ADD CONSTRAINT id_artigo_id PRIMARY KEY (numero);


--
-- TOC entry 4359 (class 2606 OID 31259)
-- Name: atividade id_atividade_id; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.atividade
    ADD CONSTRAINT id_atividade_id PRIMARY KEY (codigo_da_atividade);


--
-- TOC entry 4367 (class 2606 OID 31274)
-- Name: beneficio_patrocinio id_beneficio_pat; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.beneficio_patrocinio
    ADD CONSTRAINT id_beneficio_pat PRIMARY KEY (id_taxa, beneficio);


--
-- TOC entry 4369 (class 2606 OID 31279)
-- Name: certificado id_certificado_id; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.certificado
    ADD CONSTRAINT id_certificado_id PRIMARY KEY (numero);


--
-- TOC entry 4376 (class 2606 OID 31292)
-- Name: conta_a_pagar id_conta_a_pagar; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.conta_a_pagar
    ADD CONSTRAINT id_conta_a_pagar PRIMARY KEY (id);


--
-- TOC entry 4381 (class 2606 OID 31302)
-- Name: conta_a_receber id_conta_a_receber; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.conta_a_receber
    ADD CONSTRAINT id_conta_a_receber PRIMARY KEY (id);


--
-- TOC entry 4387 (class 2606 OID 31314)
-- Name: entidade id_entidade_id; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.entidade
    ADD CONSTRAINT id_entidade_id PRIMARY KEY (cnp_corpo, cnp_filial, cnp_controle);


--
-- TOC entry 4389 (class 2606 OID 31319)
-- Name: equipamento id_equipamento_id; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.equipamento
    ADD CONSTRAINT id_equipamento_id PRIMARY KEY (id_equ);


--
-- TOC entry 4393 (class 2606 OID 31326)
-- Name: equipe id_equipe_id; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.equipe
    ADD CONSTRAINT id_equipe_id PRIMARY KEY (id_equipe);


--
-- TOC entry 4397 (class 2606 OID 31331)
-- Name: estoca id_estoca; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.estoca
    ADD CONSTRAINT id_estoca PRIMARY KEY (id_est);


--
-- TOC entry 4400 (class 2606 OID 46168)
-- Name: evento id_evento_id; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.evento
    ADD CONSTRAINT id_evento_id PRIMARY KEY (nome, edicao);


--
-- TOC entry 4403 (class 2606 OID 31341)
-- Name: fornece id_fornece; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.fornece
    ADD CONSTRAINT id_fornece PRIMARY KEY (codigo, cnp_corpo, cnp_filial, cnp_controle);


--
-- TOC entry 4405 (class 2606 OID 31346)
-- Name: fornecedor id_fornecedor; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.fornecedor
    ADD CONSTRAINT id_fornecedor PRIMARY KEY (cnp_corpo, cnp_filial, cnp_controle);


--
-- TOC entry 4411 (class 2606 OID 31351)
-- Name: inscricao id_inscricao; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.inscricao
    ADD CONSTRAINT id_inscricao PRIMARY KEY (n_inscricao);


--
-- TOC entry 4416 (class 2606 OID 31361)
-- Name: julga id_julga; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.julga
    ADD CONSTRAINT id_julga PRIMARY KEY (codigo_da_atividade, cpf_corpo, cpf_controle);


--
-- TOC entry 4418 (class 2606 OID 31366)
-- Name: local id_local_id; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.local
    ADD CONSTRAINT id_local_id PRIMARY KEY (id_local);


--
-- TOC entry 4421 (class 2606 OID 31371)
-- Name: lojista id_lojista; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.lojista
    ADD CONSTRAINT id_lojista PRIMARY KEY (matricula);


--
-- TOC entry 4425 (class 2606 OID 31381)
-- Name: minicurriculo_autor id_minicurriculo_autor; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.minicurriculo_autor
    ADD CONSTRAINT id_minicurriculo_autor PRIMARY KEY (cpf_corpo, cpf_controle, minicurriculo_autor);


--
-- TOC entry 4427 (class 2606 OID 31386)
-- Name: minicurriculo_palestrante id_minicurriculo_palestrante; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.minicurriculo_palestrante
    ADD CONSTRAINT id_minicurriculo_palestrante PRIMARY KEY (cpf_corpo, cpf_controle, minicurriculo_palestrante);


--
-- TOC entry 4431 (class 2606 OID 31396)
-- Name: nota_fiscal id_nota_fiscal; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.nota_fiscal
    ADD CONSTRAINT id_nota_fiscal PRIMARY KEY (numero_nota);


--
-- TOC entry 4434 (class 2606 OID 31401)
-- Name: organiza id_organiza; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.organiza
    ADD CONSTRAINT id_organiza PRIMARY KEY (id_equipe, nome, edicao);


--
-- TOC entry 4444 (class 2606 OID 31421)
-- Name: participante id_participante; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.participante
    ADD CONSTRAINT id_participante PRIMARY KEY (cpf_corpo, cpf_controle);


--
-- TOC entry 4452 (class 2606 OID 31431)
-- Name: patrocina id_patrocina; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.patrocina
    ADD CONSTRAINT id_patrocina PRIMARY KEY (nome, edicao, cnp_corpo, cnp_filial, cnp_controle);


--
-- TOC entry 4454 (class 2606 OID 31436)
-- Name: pessoas_responsaveis id_pessoas_responsaveis; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.pessoas_responsaveis
    ADD CONSTRAINT id_pessoas_responsaveis PRIMARY KEY (cnp_corpo, cnp_filial, cnp_controle, pessoas_responsaveis);


--
-- TOC entry 4465 (class 2606 OID 31453)
-- Name: premio id_premio; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.premio
    ADD CONSTRAINT id_premio PRIMARY KEY (codigo_da_atividade, colocacao, tipo);


--
-- TOC entry 4467 (class 2606 OID 31458)
-- Name: produto id_produto_id; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.produto
    ADD CONSTRAINT id_produto_id PRIMARY KEY (codigo);


--
-- TOC entry 4470 (class 2606 OID 31463)
-- Name: promove_atividade id_promove_atividade; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.promove_atividade
    ADD CONSTRAINT id_promove_atividade PRIMARY KEY (codigo_da_atividade, cnp_corpo, cnp_filial, cnp_controle);


--
-- TOC entry 4473 (class 2606 OID 31468)
-- Name: promove_evento id_promove_evento; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.promove_evento
    ADD CONSTRAINT id_promove_evento PRIMARY KEY (nome, edicao, cnp_corpo, cnp_filial, cnp_controle);


--
-- TOC entry 4476 (class 2606 OID 31473)
-- Name: realiza id_realiza; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.realiza
    ADD CONSTRAINT id_realiza PRIMARY KEY (nome, edicao, cnp_corpo, cnp_filial, cnp_controle);


--
-- TOC entry 4482 (class 2606 OID 31486)
-- Name: regra id_regra; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.regra
    ADD CONSTRAINT id_regra PRIMARY KEY (codigo_da_atividade, regra);


--
-- TOC entry 4490 (class 2606 OID 31501)
-- Name: seleciona id_seleciona; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.seleciona
    ADD CONSTRAINT id_seleciona PRIMARY KEY (cpf_corpo, cpf_controle, numero);


--
-- TOC entry 4495 (class 2606 OID 31511)
-- Name: stand id_stand_id; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.stand
    ADD CONSTRAINT id_stand_id PRIMARY KEY (cnp_corpo, cnp_filial, cnp_controle);


--
-- TOC entry 4501 (class 2606 OID 31521)
-- Name: taxa_inscricao id_taxa_ins; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.taxa_inscricao
    ADD CONSTRAINT id_taxa_ins PRIMARY KEY (id_taxa_ins);


--
-- TOC entry 4512 (class 2606 OID 31536)
-- Name: venda id_venda_id; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.venda
    ADD CONSTRAINT id_venda_id PRIMARY KEY (numero);


--
-- TOC entry 4515 (class 2606 OID 31543)
-- Name: vende id_vende; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.vende
    ADD CONSTRAINT id_vende PRIMARY KEY (cnp_corpo, cnp_filial, cnp_controle, codigo);


--
-- TOC entry 4518 (class 2606 OID 31548)
-- Name: vendido id_vendido; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.vendido
    ADD CONSTRAINT id_vendido PRIMARY KEY (codigo, numero);


--
-- TOC entry 4508 (class 2606 OID 31531)
-- Name: participa_de idparticipa_de; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.participa_de
    ADD CONSTRAINT idparticipa_de PRIMARY KEY (codigo_da_atividade, cpf_corpo, cpf_controle);


--
-- TOC entry 4480 (class 2606 OID 31478)
-- Name: realizada_em idrealizada_em; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.realizada_em
    ADD CONSTRAINT idrealizada_em PRIMARY KEY (cod_atividade, id_area);


--
-- TOC entry 4498 (class 2606 OID 31516)
-- Name: taxa_de_patrocinio idtaxa_de_patrocinio; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.taxa_de_patrocinio
    ADD CONSTRAINT idtaxa_de_patrocinio PRIMARY KEY (id_taxa);


--
-- TOC entry 4391 (class 2606 OID 31321)
-- Name: equipamento sid_equipamento; Type: CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.equipamento
    ADD CONSTRAINT sid_equipamento UNIQUE (nome_equipamento);


--
-- TOC entry 4505 (class 1259 OID 31991)
-- Name: dkparticipa_de_reuniao_ind; Type: INDEX; Schema: eventos; Owner: bd2019
--

CREATE INDEX dkparticipa_de_reuniao_ind ON eventos.participa_de USING btree (codigo_da_atividade);


--
-- TOC entry 4349 (class 1259 OID 31951)
-- Name: fkapr_art_ind; Type: INDEX; Schema: eventos; Owner: bd2019
--

CREATE INDEX fkapr_art_ind ON eventos.apresentado_em USING btree (numero);


--
-- TOC entry 4440 (class 1259 OID 31972)
-- Name: fkapresenta_palestra_ind; Type: INDEX; Schema: eventos; Owner: bd2019
--

CREATE INDEX fkapresenta_palestra_ind ON eventos.palestrante USING btree (codigo_da_atividade);


--
-- TOC entry 4352 (class 1259 OID 31952)
-- Name: fkarea_local_ind; Type: INDEX; Schema: eventos; Owner: bd2019
--

CREATE INDEX fkarea_local_ind ON eventos.area_local USING btree (id_local);


--
-- TOC entry 4365 (class 1259 OID 31955)
-- Name: fkben_taxa_ind; Type: INDEX; Schema: eventos; Owner: bd2019
--

CREATE INDEX fkben_taxa_ind ON eventos.beneficio_patrocinio USING btree (id_taxa);


--
-- TOC entry 4384 (class 1259 OID 31959)
-- Name: fkemi_eve_ind; Type: INDEX; Schema: eventos; Owner: bd2019
--

CREATE INDEX fkemi_eve_ind ON eventos.emite_certificado USING btree (nome, edicao);


--
-- TOC entry 4385 (class 1259 OID 31958)
-- Name: fkemi_par_ind; Type: INDEX; Schema: eventos; Owner: bd2019
--

CREATE INDEX fkemi_par_ind ON eventos.emite_certificado USING btree (cpf_corpo, cpf_controle);


--
-- TOC entry 4394 (class 1259 OID 31961)
-- Name: fkest_for_ind; Type: INDEX; Schema: eventos; Owner: bd2019
--

CREATE INDEX fkest_for_ind ON eventos.estoca USING btree (cnp_corpo, cnp_filial, cnp_controle);


--
-- TOC entry 4395 (class 1259 OID 31960)
-- Name: fkest_pro_ind; Type: INDEX; Schema: eventos; Owner: bd2019
--

CREATE INDEX fkest_pro_ind ON eventos.estoca USING btree (cod_produto);


--
-- TOC entry 4401 (class 1259 OID 31963)
-- Name: fkfor_for_ind; Type: INDEX; Schema: eventos; Owner: bd2019
--

CREATE INDEX fkfor_for_ind ON eventos.fornece USING btree (cnp_corpo, cnp_filial, cnp_controle);


--
-- TOC entry 4406 (class 1259 OID 31965)
-- Name: fkins_eve_ind; Type: INDEX; Schema: eventos; Owner: bd2019
--

CREATE INDEX fkins_eve_ind ON eventos.inscricao USING btree (nome, edicao);


--
-- TOC entry 4407 (class 1259 OID 31964)
-- Name: fkins_par_ind; Type: INDEX; Schema: eventos; Owner: bd2019
--

CREATE INDEX fkins_par_ind ON eventos.inscricao USING btree (cpf_corpo, cpf_controle);


--
-- TOC entry 4408 (class 1259 OID 31967)
-- Name: fkinscricao_nota_ind; Type: INDEX; Schema: eventos; Owner: bd2019
--

CREATE INDEX fkinscricao_nota_ind ON eventos.inscricao USING btree (numero_nota);


--
-- TOC entry 4409 (class 1259 OID 31966)
-- Name: fkinscricao_taxa_ind; Type: INDEX; Schema: eventos; Owner: bd2019
--

CREATE INDEX fkinscricao_taxa_ind ON eventos.inscricao USING btree (id_taxa_ins);


--
-- TOC entry 4414 (class 1259 OID 31968)
-- Name: fkjul_jui_ind; Type: INDEX; Schema: eventos; Owner: bd2019
--

CREATE INDEX fkjul_jui_ind ON eventos.julga USING btree (cpf_corpo, cpf_controle);


--
-- TOC entry 4504 (class 1259 OID 31990)
-- Name: fkministra_ind; Type: INDEX; Schema: eventos; Owner: bd2019
--

CREATE INDEX fkministra_ind ON eventos.tutorial USING btree (cpf_corpo, cpf_controle);


--
-- TOC entry 4432 (class 1259 OID 31970)
-- Name: fkorg_eve_ind; Type: INDEX; Schema: eventos; Owner: bd2019
--

CREATE INDEX fkorg_eve_ind ON eventos.organiza USING btree (nome, edicao);


--
-- TOC entry 4506 (class 1259 OID 31992)
-- Name: fkparticipa_de_participante_ind; Type: INDEX; Schema: eventos; Owner: bd2019
--

CREATE INDEX fkparticipa_de_participante_ind ON eventos.participa_de USING btree (cpf_corpo, cpf_controle);


--
-- TOC entry 4447 (class 1259 OID 31974)
-- Name: fkpat_ent_ind; Type: INDEX; Schema: eventos; Owner: bd2019
--

CREATE INDEX fkpat_ent_ind ON eventos.patrocina USING btree (cnp_corpo, cnp_filial, cnp_controle);


--
-- TOC entry 4448 (class 1259 OID 31973)
-- Name: fkpat_eve_ind; Type: INDEX; Schema: eventos; Owner: bd2019
--

CREATE INDEX fkpat_eve_ind ON eventos.patrocina USING btree (nome, edicao);


--
-- TOC entry 4449 (class 1259 OID 31975)
-- Name: fkpat_nota_ind; Type: INDEX; Schema: eventos; Owner: bd2019
--

CREATE INDEX fkpat_nota_ind ON eventos.patrocina USING btree (numero_nota);


--
-- TOC entry 4450 (class 1259 OID 31976)
-- Name: fkpat_taxa_ind; Type: INDEX; Schema: eventos; Owner: bd2019
--

CREATE INDEX fkpat_taxa_ind ON eventos.patrocina USING btree (id_taxa);


--
-- TOC entry 4457 (class 1259 OID 31978)
-- Name: fkpos_area_ind; Type: INDEX; Schema: eventos; Owner: bd2019
--

CREATE INDEX fkpos_area_ind ON eventos.possui USING btree (id_area);


--
-- TOC entry 4458 (class 1259 OID 31977)
-- Name: fkpos_equ_ind; Type: INDEX; Schema: eventos; Owner: bd2019
--

CREATE INDEX fkpos_equ_ind ON eventos.possui USING btree (id_equ);


--
-- TOC entry 4357 (class 1259 OID 31953)
-- Name: fkpossui_atividades_ind; Type: INDEX; Schema: eventos; Owner: bd2019
--

CREATE INDEX fkpossui_atividades_ind ON eventos.atividade USING btree (pos_nome, pos_edicao);


--
-- TOC entry 4379 (class 1259 OID 31957)
-- Name: fkpossui_entradas_ind; Type: INDEX; Schema: eventos; Owner: bd2019
--

CREATE INDEX fkpossui_entradas_ind ON eventos.conta_a_receber USING btree (nome, edicao);


--
-- TOC entry 4435 (class 1259 OID 31971)
-- Name: fkpossui_organizador_ind; Type: INDEX; Schema: eventos; Owner: bd2019
--

CREATE INDEX fkpossui_organizador_ind ON eventos.organizador USING btree (id_equipe);


--
-- TOC entry 4374 (class 1259 OID 31956)
-- Name: fkpossui_saidas_ind; Type: INDEX; Schema: eventos; Owner: bd2019
--

CREATE INDEX fkpossui_saidas_ind ON eventos.conta_a_pagar USING btree (nome, edicao);


--
-- TOC entry 4499 (class 1259 OID 31989)
-- Name: fkpossui_taxas_ind; Type: INDEX; Schema: eventos; Owner: bd2019
--

CREATE INDEX fkpossui_taxas_ind ON eventos.taxa_inscricao USING btree (nome, edicao);


--
-- TOC entry 4459 (class 1259 OID 31979)
-- Name: fkpre_ati_ind; Type: INDEX; Schema: eventos; Owner: bd2019
--

CREATE INDEX fkpre_ati_ind ON eventos.precisa_de USING btree (codigo_da_atividade);


--
-- TOC entry 4468 (class 1259 OID 31980)
-- Name: fkpro_ent_1_ind; Type: INDEX; Schema: eventos; Owner: bd2019
--

CREATE INDEX fkpro_ent_1_ind ON eventos.promove_atividade USING btree (cnp_corpo, cnp_filial, cnp_controle);


--
-- TOC entry 4471 (class 1259 OID 31981)
-- Name: fkpro_ent_ind; Type: INDEX; Schema: eventos; Owner: bd2019
--

CREATE INDEX fkpro_ent_ind ON eventos.promove_evento USING btree (cnp_corpo, cnp_filial, cnp_controle);


--
-- TOC entry 4364 (class 1259 OID 31954)
-- Name: fkpublica_ind; Type: INDEX; Schema: eventos; Owner: bd2019
--

CREATE INDEX fkpublica_ind ON eventos.autor_de_artigo USING btree (numero);


--
-- TOC entry 4474 (class 1259 OID 31982)
-- Name: fkrea_ent_ind; Type: INDEX; Schema: eventos; Owner: bd2019
--

CREATE INDEX fkrea_ent_ind ON eventos.realiza USING btree (cnp_corpo, cnp_filial, cnp_controle);


--
-- TOC entry 4398 (class 1259 OID 31962)
-- Name: fkrealizado_em_ind; Type: INDEX; Schema: eventos; Owner: bd2019
--

CREATE INDEX fkrealizado_em_ind ON eventos.evento USING btree (id_local);


--
-- TOC entry 4477 (class 1259 OID 31984)
-- Name: fkrel_area_ind; Type: INDEX; Schema: eventos; Owner: bd2019
--

CREATE INDEX fkrel_area_ind ON eventos.realizada_em USING btree (id_area);


--
-- TOC entry 4478 (class 1259 OID 31983)
-- Name: fkrel_ativ_ind; Type: INDEX; Schema: eventos; Owner: bd2019
--

CREATE INDEX fkrel_ativ_ind ON eventos.realizada_em USING btree (cod_atividade);


--
-- TOC entry 4485 (class 1259 OID 31985)
-- Name: fkresponsavel_por_ind; Type: INDEX; Schema: eventos; Owner: bd2019
--

CREATE INDEX fkresponsavel_por_ind ON eventos.responsavel_por_sessao USING btree (codigo_da_atividade);


--
-- TOC entry 4488 (class 1259 OID 31986)
-- Name: fksel_art_ind; Type: INDEX; Schema: eventos; Owner: bd2019
--

CREATE INDEX fksel_art_ind ON eventos.seleciona USING btree (numero);


--
-- TOC entry 4496 (class 1259 OID 46234)
-- Name: fktax_pat_evento_ind; Type: INDEX; Schema: eventos; Owner: bd2019
--

CREATE INDEX fktax_pat_evento_ind ON eventos.taxa_de_patrocinio USING btree (nome, edicao);


--
-- TOC entry 4419 (class 1259 OID 31969)
-- Name: fktrabalha_ind; Type: INDEX; Schema: eventos; Owner: bd2019
--

CREATE INDEX fktrabalha_ind ON eventos.lojista USING btree (cnp_corpo, cnp_filial, cnp_controle);


--
-- TOC entry 4493 (class 1259 OID 31987)
-- Name: fkvarejo_ind; Type: INDEX; Schema: eventos; Owner: bd2019
--

CREATE INDEX fkvarejo_ind ON eventos.stand USING btree (var_nome, var_edicao);


--
-- TOC entry 4513 (class 1259 OID 31993)
-- Name: fkven_pro_1_ind; Type: INDEX; Schema: eventos; Owner: bd2019
--

CREATE INDEX fkven_pro_1_ind ON eventos.vende USING btree (codigo);


--
-- TOC entry 4516 (class 1259 OID 31994)
-- Name: fkven_ven_ind; Type: INDEX; Schema: eventos; Owner: bd2019
--

CREATE INDEX fkven_ven_ind ON eventos.vendido USING btree (numero);


--
-- TOC entry 4592 (class 2606 OID 31911)
-- Name: participa_de dkparticipa_de_reuniao_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.participa_de
    ADD CONSTRAINT dkparticipa_de_reuniao_fk FOREIGN KEY (codigo_da_atividade) REFERENCES eventos.reuniao(codigo_da_atividade);


--
-- TOC entry 4522 (class 2606 OID 31559)
-- Name: apresentado_em fkapr_art_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.apresentado_em
    ADD CONSTRAINT fkapr_art_fk FOREIGN KEY (numero) REFERENCES eventos.artigo(numero);


--
-- TOC entry 4521 (class 2606 OID 31554)
-- Name: apresentado_em fkapr_ses; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.apresentado_em
    ADD CONSTRAINT fkapr_ses FOREIGN KEY (codigo_da_atividade) REFERENCES eventos.sessao_de_artigo(codigo_da_atividade);


--
-- TOC entry 4560 (class 2606 OID 31751)
-- Name: palestrante fkapresenta_palestra_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.palestrante
    ADD CONSTRAINT fkapresenta_palestra_fk FOREIGN KEY (codigo_da_atividade) REFERENCES eventos.palestra(codigo_da_atividade);


--
-- TOC entry 4523 (class 2606 OID 31564)
-- Name: area_local fkarea_local_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.area_local
    ADD CONSTRAINT fkarea_local_fk FOREIGN KEY (id_local) REFERENCES eventos.local(id_local);


--
-- TOC entry 4525 (class 2606 OID 31575)
-- Name: atividade_social fkati_ati_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.atividade_social
    ADD CONSTRAINT fkati_ati_fk FOREIGN KEY (codigo_da_atividade) REFERENCES eventos.atividade(codigo_da_atividade);


--
-- TOC entry 4529 (class 2606 OID 31595)
-- Name: concurso fkati_con_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.concurso
    ADD CONSTRAINT fkati_con_fk FOREIGN KEY (codigo_da_atividade) REFERENCES eventos.atividade(codigo_da_atividade);


--
-- TOC entry 4558 (class 2606 OID 31741)
-- Name: palestra fkati_pal_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.palestra
    ADD CONSTRAINT fkati_pal_fk FOREIGN KEY (codigo_da_atividade) REFERENCES eventos.atividade(codigo_da_atividade);


--
-- TOC entry 4583 (class 2606 OID 31866)
-- Name: reuniao fkati_reu_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.reuniao
    ADD CONSTRAINT fkati_reu_fk FOREIGN KEY (codigo_da_atividade) REFERENCES eventos.atividade(codigo_da_atividade);


--
-- TOC entry 4586 (class 2606 OID 31881)
-- Name: sessao_de_artigo fkati_ses_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.sessao_de_artigo
    ADD CONSTRAINT fkati_ses_fk FOREIGN KEY (codigo_da_atividade) REFERENCES eventos.atividade(codigo_da_atividade);


--
-- TOC entry 4590 (class 2606 OID 31901)
-- Name: tutorial fkati_tut_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.tutorial
    ADD CONSTRAINT fkati_tut_fk FOREIGN KEY (codigo_da_atividade) REFERENCES eventos.atividade(codigo_da_atividade);


--
-- TOC entry 4599 (class 2606 OID 31946)
-- Name: workshop fkati_wor_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.workshop
    ADD CONSTRAINT fkati_wor_fk FOREIGN KEY (codigo_da_atividade) REFERENCES eventos.atividade(codigo_da_atividade);


--
-- TOC entry 4551 (class 2606 OID 31706)
-- Name: minicurriculo_autor fkaut_min; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.minicurriculo_autor
    ADD CONSTRAINT fkaut_min FOREIGN KEY (cpf_corpo, cpf_controle) REFERENCES eventos.autor_de_artigo(cpf_corpo, cpf_controle);


--
-- TOC entry 4528 (class 2606 OID 31590)
-- Name: beneficio_patrocinio fkben_taxa_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.beneficio_patrocinio
    ADD CONSTRAINT fkben_taxa_fk FOREIGN KEY (id_taxa) REFERENCES eventos.taxa_de_patrocinio(id_taxa);


--
-- TOC entry 4571 (class 2606 OID 31806)
-- Name: premio fkcon_pre; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.premio
    ADD CONSTRAINT fkcon_pre FOREIGN KEY (codigo_da_atividade) REFERENCES eventos.concurso(codigo_da_atividade);


--
-- TOC entry 4580 (class 2606 OID 31851)
-- Name: regra fkcon_reg; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.regra
    ADD CONSTRAINT fkcon_reg FOREIGN KEY (codigo_da_atividade) REFERENCES eventos.concurso(codigo_da_atividade);


--
-- TOC entry 4534 (class 2606 OID 31631)
-- Name: emite_certificado fkemi_cer_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.emite_certificado
    ADD CONSTRAINT fkemi_cer_fk FOREIGN KEY (numero) REFERENCES eventos.certificado(numero);


--
-- TOC entry 4535 (class 2606 OID 46184)
-- Name: emite_certificado fkemi_eve_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.emite_certificado
    ADD CONSTRAINT fkemi_eve_fk FOREIGN KEY (nome, edicao) REFERENCES eventos.evento(nome, edicao);


--
-- TOC entry 4536 (class 2606 OID 31621)
-- Name: emite_certificado fkemi_par_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.emite_certificado
    ADD CONSTRAINT fkemi_par_fk FOREIGN KEY (cpf_corpo, cpf_controle) REFERENCES eventos.participante(cpf_corpo, cpf_controle);


--
-- TOC entry 4594 (class 2606 OID 31921)
-- Name: venda fkemite_nota_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.venda
    ADD CONSTRAINT fkemite_nota_fk FOREIGN KEY (numero_nota) REFERENCES eventos.nota_fiscal(numero_nota);


--
-- TOC entry 4531 (class 2606 OID 31606)
-- Name: conta_a_pagar fkemite_nota_pagamento_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.conta_a_pagar
    ADD CONSTRAINT fkemite_nota_pagamento_fk FOREIGN KEY (numero_nota) REFERENCES eventos.nota_fiscal(numero_nota);


--
-- TOC entry 4533 (class 2606 OID 31616)
-- Name: conta_a_receber fkemite_nota_recibo_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.conta_a_receber
    ADD CONSTRAINT fkemite_nota_recibo_fk FOREIGN KEY (numero_nota) REFERENCES eventos.nota_fiscal(numero_nota);


--
-- TOC entry 4566 (class 2606 OID 31781)
-- Name: pessoas_responsaveis fkent_pes; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.pessoas_responsaveis
    ADD CONSTRAINT fkent_pes FOREIGN KEY (cnp_corpo, cnp_filial, cnp_controle) REFERENCES eventos.entidade(cnp_corpo, cnp_filial, cnp_controle);


--
-- TOC entry 4538 (class 2606 OID 31641)
-- Name: estoca fkest_for_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.estoca
    ADD CONSTRAINT fkest_for_fk FOREIGN KEY (cnp_corpo, cnp_filial, cnp_controle) REFERENCES eventos.fornecedor(cnp_corpo, cnp_filial, cnp_controle);


--
-- TOC entry 4537 (class 2606 OID 31636)
-- Name: estoca fkest_pro_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.estoca
    ADD CONSTRAINT fkest_pro_fk FOREIGN KEY (cod_produto) REFERENCES eventos.produto(codigo);


--
-- TOC entry 4541 (class 2606 OID 31656)
-- Name: fornece fkfor_for_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.fornece
    ADD CONSTRAINT fkfor_for_fk FOREIGN KEY (cnp_corpo, cnp_filial, cnp_controle) REFERENCES eventos.fornecedor(cnp_corpo, cnp_filial, cnp_controle);


--
-- TOC entry 4540 (class 2606 OID 31651)
-- Name: fornece fkfor_pro; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.fornece
    ADD CONSTRAINT fkfor_pro FOREIGN KEY (codigo) REFERENCES eventos.produto(codigo);


--
-- TOC entry 4545 (class 2606 OID 46189)
-- Name: inscricao fkins_eve_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.inscricao
    ADD CONSTRAINT fkins_eve_fk FOREIGN KEY (nome, edicao) REFERENCES eventos.evento(nome, edicao);


--
-- TOC entry 4542 (class 2606 OID 31661)
-- Name: inscricao fkins_par_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.inscricao
    ADD CONSTRAINT fkins_par_fk FOREIGN KEY (cpf_corpo, cpf_controle) REFERENCES eventos.participante(cpf_corpo, cpf_controle);


--
-- TOC entry 4544 (class 2606 OID 31676)
-- Name: inscricao fkinscricao_nota_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.inscricao
    ADD CONSTRAINT fkinscricao_nota_fk FOREIGN KEY (numero_nota) REFERENCES eventos.nota_fiscal(numero_nota);


--
-- TOC entry 4543 (class 2606 OID 31671)
-- Name: inscricao fkinscricao_taxa_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.inscricao
    ADD CONSTRAINT fkinscricao_taxa_fk FOREIGN KEY (id_taxa_ins) REFERENCES eventos.taxa_inscricao(id_taxa_ins);


--
-- TOC entry 4548 (class 2606 OID 31691)
-- Name: julga fkjul_con; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.julga
    ADD CONSTRAINT fkjul_con FOREIGN KEY (codigo_da_atividade) REFERENCES eventos.concurso(codigo_da_atividade);


--
-- TOC entry 4547 (class 2606 OID 31686)
-- Name: julga fkjul_jui_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.julga
    ADD CONSTRAINT fkjul_jui_fk FOREIGN KEY (cpf_corpo, cpf_controle) REFERENCES eventos.juiz(cpf_corpo, cpf_controle);


--
-- TOC entry 4591 (class 2606 OID 31906)
-- Name: tutorial fkministra_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.tutorial
    ADD CONSTRAINT fkministra_fk FOREIGN KEY (cpf_corpo, cpf_controle) REFERENCES eventos.ministrante_de_tutorial(cpf_corpo, cpf_controle);


--
-- TOC entry 4554 (class 2606 OID 31726)
-- Name: organiza fkorg_equ; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.organiza
    ADD CONSTRAINT fkorg_equ FOREIGN KEY (id_equipe) REFERENCES eventos.equipe(id_equipe);


--
-- TOC entry 4555 (class 2606 OID 46194)
-- Name: organiza fkorg_eve_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.organiza
    ADD CONSTRAINT fkorg_eve_fk FOREIGN KEY (nome, edicao) REFERENCES eventos.evento(nome, edicao);


--
-- TOC entry 4552 (class 2606 OID 31711)
-- Name: minicurriculo_palestrante fkpal_min; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.minicurriculo_palestrante
    ADD CONSTRAINT fkpal_min FOREIGN KEY (cpf_corpo, cpf_controle) REFERENCES eventos.palestrante(cpf_corpo, cpf_controle);


--
-- TOC entry 4527 (class 2606 OID 31585)
-- Name: autor_de_artigo fkpar_aut_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.autor_de_artigo
    ADD CONSTRAINT fkpar_aut_fk FOREIGN KEY (cpf_corpo, cpf_controle) REFERENCES eventos.participante(cpf_corpo, cpf_controle);


--
-- TOC entry 4546 (class 2606 OID 31681)
-- Name: juiz fkpar_jui_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.juiz
    ADD CONSTRAINT fkpar_jui_fk FOREIGN KEY (cpf_corpo, cpf_controle) REFERENCES eventos.participante(cpf_corpo, cpf_controle);


--
-- TOC entry 4550 (class 2606 OID 31701)
-- Name: membro_do_comite fkpar_mem_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.membro_do_comite
    ADD CONSTRAINT fkpar_mem_fk FOREIGN KEY (cpf_corpo, cpf_controle) REFERENCES eventos.participante(cpf_corpo, cpf_controle);


--
-- TOC entry 4553 (class 2606 OID 31716)
-- Name: ministrante_de_tutorial fkpar_min_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.ministrante_de_tutorial
    ADD CONSTRAINT fkpar_min_fk FOREIGN KEY (cpf_corpo, cpf_controle) REFERENCES eventos.participante(cpf_corpo, cpf_controle);


--
-- TOC entry 4559 (class 2606 OID 31746)
-- Name: palestrante fkpar_pal_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.palestrante
    ADD CONSTRAINT fkpar_pal_fk FOREIGN KEY (cpf_corpo, cpf_controle) REFERENCES eventos.participante(cpf_corpo, cpf_controle);


--
-- TOC entry 4561 (class 2606 OID 31756)
-- Name: participante_de_reuniao fkpar_par_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.participante_de_reuniao
    ADD CONSTRAINT fkpar_par_fk FOREIGN KEY (cpf_corpo, cpf_controle) REFERENCES eventos.participante(cpf_corpo, cpf_controle);


--
-- TOC entry 4581 (class 2606 OID 31856)
-- Name: responsavel_por_sessao fkpar_res_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.responsavel_por_sessao
    ADD CONSTRAINT fkpar_res_fk FOREIGN KEY (cpf_corpo, cpf_controle) REFERENCES eventos.participante(cpf_corpo, cpf_controle);


--
-- TOC entry 4593 (class 2606 OID 31916)
-- Name: participa_de fkparticipa_de_participante_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.participa_de
    ADD CONSTRAINT fkparticipa_de_participante_fk FOREIGN KEY (cpf_corpo, cpf_controle) REFERENCES eventos.participante_de_reuniao(cpf_corpo, cpf_controle);


--
-- TOC entry 4562 (class 2606 OID 31766)
-- Name: patrocina fkpat_ent_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.patrocina
    ADD CONSTRAINT fkpat_ent_fk FOREIGN KEY (cnp_corpo, cnp_filial, cnp_controle) REFERENCES eventos.entidade(cnp_corpo, cnp_filial, cnp_controle);


--
-- TOC entry 4565 (class 2606 OID 46199)
-- Name: patrocina fkpat_eve_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.patrocina
    ADD CONSTRAINT fkpat_eve_fk FOREIGN KEY (nome, edicao) REFERENCES eventos.evento(nome, edicao);


--
-- TOC entry 4563 (class 2606 OID 31771)
-- Name: patrocina fkpat_nota_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.patrocina
    ADD CONSTRAINT fkpat_nota_fk FOREIGN KEY (numero_nota) REFERENCES eventos.nota_fiscal(numero_nota);


--
-- TOC entry 4564 (class 2606 OID 31776)
-- Name: patrocina fkpat_taxa_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.patrocina
    ADD CONSTRAINT fkpat_taxa_fk FOREIGN KEY (id_taxa) REFERENCES eventos.taxa_de_patrocinio(id_taxa);


--
-- TOC entry 4568 (class 2606 OID 31791)
-- Name: possui fkpos_area_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.possui
    ADD CONSTRAINT fkpos_area_fk FOREIGN KEY (id_area) REFERENCES eventos.area_local(id_area);


--
-- TOC entry 4567 (class 2606 OID 31786)
-- Name: possui fkpos_equ_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.possui
    ADD CONSTRAINT fkpos_equ_fk FOREIGN KEY (id_equ) REFERENCES eventos.equipamento(id_equ);


--
-- TOC entry 4524 (class 2606 OID 46169)
-- Name: atividade fkpossui_atividades_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.atividade
    ADD CONSTRAINT fkpossui_atividades_fk FOREIGN KEY (pos_nome, pos_edicao) REFERENCES eventos.evento(nome, edicao);


--
-- TOC entry 4532 (class 2606 OID 46179)
-- Name: conta_a_receber fkpossui_entradas_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.conta_a_receber
    ADD CONSTRAINT fkpossui_entradas_fk FOREIGN KEY (nome, edicao) REFERENCES eventos.evento(nome, edicao);


--
-- TOC entry 4556 (class 2606 OID 31731)
-- Name: organizador fkpossui_organizador_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.organizador
    ADD CONSTRAINT fkpossui_organizador_fk FOREIGN KEY (id_equipe) REFERENCES eventos.equipe(id_equipe);


--
-- TOC entry 4557 (class 2606 OID 31736)
-- Name: organizador fkpossui_responsavel_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.organizador
    ADD CONSTRAINT fkpossui_responsavel_fk FOREIGN KEY (pos_id_equipe) REFERENCES eventos.equipe(id_equipe);


--
-- TOC entry 4530 (class 2606 OID 46174)
-- Name: conta_a_pagar fkpossui_saidas_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.conta_a_pagar
    ADD CONSTRAINT fkpossui_saidas_fk FOREIGN KEY (nome, edicao) REFERENCES eventos.evento(nome, edicao);


--
-- TOC entry 4589 (class 2606 OID 46224)
-- Name: taxa_inscricao fkpossui_taxas_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.taxa_inscricao
    ADD CONSTRAINT fkpossui_taxas_fk FOREIGN KEY (nome, edicao) REFERENCES eventos.evento(nome, edicao);


--
-- TOC entry 4569 (class 2606 OID 31796)
-- Name: precisa_de fkpre_ati_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.precisa_de
    ADD CONSTRAINT fkpre_ati_fk FOREIGN KEY (codigo_da_atividade) REFERENCES eventos.atividade(codigo_da_atividade);


--
-- TOC entry 4570 (class 2606 OID 31801)
-- Name: precisa_de fkpre_equ_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.precisa_de
    ADD CONSTRAINT fkpre_equ_fk FOREIGN KEY (id_equ) REFERENCES eventos.equipamento(id_equ);


--
-- TOC entry 4573 (class 2606 OID 31816)
-- Name: promove_atividade fkpro_ati; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.promove_atividade
    ADD CONSTRAINT fkpro_ati FOREIGN KEY (codigo_da_atividade) REFERENCES eventos.atividade(codigo_da_atividade);


--
-- TOC entry 4572 (class 2606 OID 31811)
-- Name: promove_atividade fkpro_ent_1_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.promove_atividade
    ADD CONSTRAINT fkpro_ent_1_fk FOREIGN KEY (cnp_corpo, cnp_filial, cnp_controle) REFERENCES eventos.entidade(cnp_corpo, cnp_filial, cnp_controle);


--
-- TOC entry 4574 (class 2606 OID 31826)
-- Name: promove_evento fkpro_ent_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.promove_evento
    ADD CONSTRAINT fkpro_ent_fk FOREIGN KEY (cnp_corpo, cnp_filial, cnp_controle) REFERENCES eventos.entidade(cnp_corpo, cnp_filial, cnp_controle);


--
-- TOC entry 4575 (class 2606 OID 46204)
-- Name: promove_evento fkpro_eve; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.promove_evento
    ADD CONSTRAINT fkpro_eve FOREIGN KEY (nome, edicao) REFERENCES eventos.evento(nome, edicao);


--
-- TOC entry 4526 (class 2606 OID 31580)
-- Name: autor_de_artigo fkpublica_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.autor_de_artigo
    ADD CONSTRAINT fkpublica_fk FOREIGN KEY (numero) REFERENCES eventos.artigo(numero);


--
-- TOC entry 4576 (class 2606 OID 31836)
-- Name: realiza fkrea_ent_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.realiza
    ADD CONSTRAINT fkrea_ent_fk FOREIGN KEY (cnp_corpo, cnp_filial, cnp_controle) REFERENCES eventos.entidade(cnp_corpo, cnp_filial, cnp_controle);


--
-- TOC entry 4577 (class 2606 OID 46209)
-- Name: realiza fkrea_eve; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.realiza
    ADD CONSTRAINT fkrea_eve FOREIGN KEY (nome, edicao) REFERENCES eventos.evento(nome, edicao);


--
-- TOC entry 4539 (class 2606 OID 31646)
-- Name: evento fkrealizado_em_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.evento
    ADD CONSTRAINT fkrealizado_em_fk FOREIGN KEY (id_local) REFERENCES eventos.local(id_local);


--
-- TOC entry 4579 (class 2606 OID 31846)
-- Name: realizada_em fkrel_area_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.realizada_em
    ADD CONSTRAINT fkrel_area_fk FOREIGN KEY (id_area) REFERENCES eventos.area_local(id_area);


--
-- TOC entry 4578 (class 2606 OID 31841)
-- Name: realizada_em fkrel_ativ_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.realizada_em
    ADD CONSTRAINT fkrel_ativ_fk FOREIGN KEY (cod_atividade) REFERENCES eventos.atividade(codigo_da_atividade);


--
-- TOC entry 4582 (class 2606 OID 31861)
-- Name: responsavel_por_sessao fkresponsavel_por_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.responsavel_por_sessao
    ADD CONSTRAINT fkresponsavel_por_fk FOREIGN KEY (codigo_da_atividade) REFERENCES eventos.sessao_de_artigo(codigo_da_atividade);


--
-- TOC entry 4584 (class 2606 OID 31871)
-- Name: seleciona fksel_art_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.seleciona
    ADD CONSTRAINT fksel_art_fk FOREIGN KEY (numero) REFERENCES eventos.artigo(numero);


--
-- TOC entry 4585 (class 2606 OID 31876)
-- Name: seleciona fksel_mem; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.seleciona
    ADD CONSTRAINT fksel_mem FOREIGN KEY (cpf_corpo, cpf_controle) REFERENCES eventos.membro_do_comite(cpf_corpo, cpf_controle);


--
-- TOC entry 4588 (class 2606 OID 46235)
-- Name: taxa_de_patrocinio fktax_pat_evento_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.taxa_de_patrocinio
    ADD CONSTRAINT fktax_pat_evento_fk FOREIGN KEY (nome, edicao) REFERENCES eventos.evento(nome, edicao);


--
-- TOC entry 4549 (class 2606 OID 31696)
-- Name: lojista fktrabalha_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.lojista
    ADD CONSTRAINT fktrabalha_fk FOREIGN KEY (cnp_corpo, cnp_filial, cnp_controle) REFERENCES eventos.stand(cnp_corpo, cnp_filial, cnp_controle);


--
-- TOC entry 4587 (class 2606 OID 46214)
-- Name: stand fkvarejo_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.stand
    ADD CONSTRAINT fkvarejo_fk FOREIGN KEY (var_nome, var_edicao) REFERENCES eventos.evento(nome, edicao);


--
-- TOC entry 4598 (class 2606 OID 31941)
-- Name: vendido fkven_pro; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.vendido
    ADD CONSTRAINT fkven_pro FOREIGN KEY (codigo) REFERENCES eventos.produto(codigo);


--
-- TOC entry 4596 (class 2606 OID 31931)
-- Name: vende fkven_pro_1_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.vende
    ADD CONSTRAINT fkven_pro_1_fk FOREIGN KEY (codigo) REFERENCES eventos.produto(codigo);


--
-- TOC entry 4595 (class 2606 OID 31926)
-- Name: vende fkven_sta; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.vende
    ADD CONSTRAINT fkven_sta FOREIGN KEY (cnp_corpo, cnp_filial, cnp_controle) REFERENCES eventos.stand(cnp_corpo, cnp_filial, cnp_controle);


--
-- TOC entry 4597 (class 2606 OID 31936)
-- Name: vendido fkven_ven_fk; Type: FK CONSTRAINT; Schema: eventos; Owner: bd2019
--

ALTER TABLE ONLY eventos.vendido
    ADD CONSTRAINT fkven_ven_fk FOREIGN KEY (numero) REFERENCES eventos.venda(numero);


-- Completed on 2019-11-29 13:49:18

--
-- PostgreSQL database dump complete
--

