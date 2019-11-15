const { pool } = require('./config')

/**
 * Lista o número de participantes com o nome selecionado em cada evento.
 */
const getNameCountByEvent = (request, response) => {
    pool.query(`
        SELECT * FROM eventos.participantes p
        WHERE p.nome LIKE '${request.query.name}%'
    `,
    (error, results) => {
        if (error) {
            console.error(error)
            response.status(500)
        } else {
            response.write(JSON.stringify(results.rows))
        }
        response.end()
    })
}

/**
 * Lista os locais que hospedaram algum evento com ao menos N participantes
 */
const getLocationsWithNParticipants = (request, response) => {
    // Pegar quantidade no request
    let n = request.query.qtdeParticipantes
    pool.query(
        `SELECT *
        FROM eventos.local l
        WHERE ${n} <= ANY(
            SELECT COUNT(*)
            FROM eventos.participante p
            JOIN eventos.inscricao i USING (cpf_corpo, cpf_controle)
            JOIN eventos.evento e ON (e.nome = i.nome AND e.edicao = i.edicao)
            WHERE e.id_local = l.id_local
            GROUP BY e.nome, e.edicao
        )`,
    (error, results) => {
        if (error) {
            console.error(error)
            response.status(500)
        } else {
            response.write(JSON.stringify(results.rows))
        }
        response.end()
    })
}

/**
 * Lista os participantes e a quantidade de certificados que cada um possui
 */
const getCertificateCountByParticipant = (request, response) => {
    pool.query(
        `SELECT cpf_corpo, cpf_controle, p.nome, count(numero)
        FROM eventos.participante p 
        LEFT JOIN eventos.emite_certificado using (cpf_controle, cpf_corpo)
        GROUP BY cpf_corpo, cpf_controle`,
        (error, results) => {
            if (error) {
                console.error(error)
                response.status(500)
            } else {
                response.write(JSON.stringify(results.rows))
            }
            response.end()
        });
}

/**
 * Lista os patrocinadores que patrocinaram mais de 1 evento
 */
const getSponsorsMoreThanOneEvent = (request, response) => {
    pool.query(`
        INSERIR QUERY
    `,
    (error, results) => {
        if (error) {
            console.error(error)
            response.status(500)
        } else {
            response.write(JSON.stringify(results.rows))
        }
        response.end()
    })
}


/**
 * Participantes que participaram de eventos em mais de 3 estados diferentes
 */
const getParticipantsThreeStates = (request, response) => {
    pool.query(`
        INSERIR QUERY
    `,
    (error, results) => {
        if (error) {
            console.error(error)
            response.status(500)
        } else {
            response.write(JSON.stringify(results.rows))
        }
        response.end()
    })
}

/**
 * Listar entidades que simultaneamente promovam e pratrocinam um algum evento
 */
const getEntitiesPromoteAndSponsor = (request, response) => {
    pool.query(`
        INSERIR QUERY
    `,
    (error, results) => {
        if (error) {
            console.error(error)
            response.status(500)
        } else {
            response.write(JSON.stringify(results.rows))
        }
        response.end()
    })
}

module.exports = {
    getLocationsWithNParticipants,
    getCertificateCountByParticipant,
    getNameCountByEvent,
    getSponsorsMoreThanOneEvent,
    getParticipantsThreeStates,
    getEntitiesPromoteAndSponsor
}