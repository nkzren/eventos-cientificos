const { pool } = require('../config')
const { buildQuerySet } = require('../utils')

const fetchByDate = (request, response) => {
    pool.query(`SELECT * FROM eventos.evento ORDER BY data_hora_inicio`, (error, results) => {
        if (error) {
            response.status(400)
            response.write(JSON.stringify(error))
        } else {
            response.write(JSON.stringify(results.rows))
        }
        response.end()
    })
}

const insert = (request, response) => {
    pool.query(`
        INSERT INTO eventos.evento(
        nome, edicao, tema, data_hora_inicio, data_hora_fim, id_local)
        VALUES ('${request.body.nome}', ${request.body.edicao}, '${request.body.tema}', '${request.body.data_hora_inicio}', '${request.body.data_hora_fim}', ${request.body.id_local});
    `, (error, results) => {
        if (error) {
            response.status(400)
            response.write(JSON.stringify(error))
        } else {
            response.write(JSON.stringify(results.rows))
        }
        response.end()
    })
}

const update = (request, response) => {
    pool.query(`
        UPDATE eventos.evento
        SET ${buildQuerySet(request.body)}
        WHERE edicao = ${request.params.edicao} AND nome='${request.params.nome}';
    `, (error, results) => {
        if (error) {
            response.status(400)
            response.write(JSON.stringify(error))
        } else {
            response.write(JSON.stringify(results.rows))
        }
        response.end()
    })
}

const remove = (request, response) => {
    pool.query(`
        DELETE FROM eventos.evento
        WHERE edicao='${request.params.edicao}' AND nome='${request.params.nome}'
    `, (error, results) => {
        if (error) {
            response.status(400)
            response.write(JSON.stringify(error))
        } else {
            response.write(JSON.stringify(results.rows))
        }
        response.end()
    })
}

module.exports = {
    insert,
    update,
    remove,
    fetchByDate
}