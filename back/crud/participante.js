const { pool } = require('../config')
const { buildQuerySet } = require('../utils')

const fetchByName = (request, response) => {
    pool.query(`SELECT * FROM eventos.participante ORDER BY nome`, (error, results) => {
        if (error) {
            response.status(400)
            response.write(JSON.stringify(error))
        } else {
            response.status(results.rows.length ? 200 : 204)
            response.write(JSON.stringify(results.rows))
        }
        response.end()
    })
}

const insert = (request, response) => {
    pool.query(`
        INSERT INTO eventos.participante(
        cpf_corpo, cpf_controle, nome, cidade_origem)
        VALUES ('${request.query.cpf.substring(0, 9)}', '${request.query.cpf.substring(9, 11)}', '${request.query.nome}', '${request.query.cidade_origem}');
    `, (error, results) => {
        if (error) {
            response.status(400)
            response.write(JSON.stringify(error))
        } else {
            response.status(201)
            response.write(JSON.stringify(results.rows))
        }
        response.end()
    })
}

const update = (request, response) => {
    pool.query(`
        UPDATE eventos.participante
        SET ${buildQuerySet(request.query)}
        WHERE cpf_corpo='${request.params.cpf.substring(0, 9) || 0}';
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
        DELETE FROM eventos.participante
        WHERE cpf_corpo='${request.params.cpf.substring(0, 9) || 0}'
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
    fetchByName
}