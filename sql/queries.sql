-- Listar todos os eventos que possuem uma sessão de artigo apresentada com tema "Arduino"
SELECT evt.*
FROM eventos.atividade atv
INNER JOIN eventos.evento evt ON (evt.nome=atv.pos_nome AND evt.edicao=atv.pos_edicao AND atv.sessao_de_artigo=1)
WHERE codigo_da_atividade IN (
	SELECT sessao.codigo_da_atividade
	FROM eventos.artigo artigo NATURAL JOIN eventos.apresentado_em, eventos.sessao_de_artigo sessao
	WHERE artigo.tipo LIKE '%Arduino%'
)

-- 2. Selecionar o evento com o menor valor de taxa de patrocínio
SELECT *
FROM eventos.evento ev
JOIN eventos.taxa_de_patrocinio tx ON (ev.nome=tx.nome AND ev.edicao=tx.edicao)
WHERE tx.valor_minimo <= ALL (
	SELECT valor_minimo
	FROM eventos.taxa_de_patrocinio);
	
-- 3. Listar os participantes e a quantidade de certificados que cada um possui
SELECT cpf_corpo, cpf_controle, p.nome, COUNT(numero)
FROM eventos.participante p
LEFT JOIN eventos.emite_certificado USING (cpf_controle, cpf_corpo)
GROUP BY cpf_corpo, cpf_controle ORDER BY COUNT DESC;

-- 4. Listar os eventos que possuam mais de N participantes
SELECT e.nome, e.edicao, COUNT(n_inscricao)
FROM eventos.participante
JOIN eventos.inscricao i USING (cpf_corpo, cpf_controle)
JOIN eventos.evento e ON (e.nome = i.nome AND e.edicao = i.edicao)
GROUP BY e.nome, e.edicao HAVING COUNT(n_inscricao) >= 5

-- 5. Listar todos os concursos e seus respectivos juízes
SELECT atv.nome, cc.tema, pt.nome
FROM eventos.concurso cc
JOIN eventos.julga jg ON (cc.codigo_da_atividade = jg.codigo_da_atividade)
JOIN eventos.juiz jz ON (jz.cpf_corpo = jg.cpf_corpo AND jz.cpf_controle = jg.cpf_controle)
JOIN eventos.participante pt ON (pt.cpf_corpo = jz.cpf_corpo AND pt.cpf_controle = jz.cpf_controle)
JOIN eventos.atividade atv ON (cc.codigo_da_atividade=atv.codigo_da_atividade) ORDER BY atv.nome

-- 6. Listar entidades que simultaneamente promovam e patrocinam um algum evento
SELECT * FROM eventos.entidade AS patrocinador
NATURAL JOIN eventos.patrocina
WHERE patrocinador.cnp_corpo = ANY (
	SELECT cnp_corpo FROM eventos.entidade AS promotora
	NATURAL JOIN eventos.promove_evento)