const { pool } = require('../config')

const fetchByEvent = (request, response) => {
    pool.query(`
        SELECT * FROM eventos.emite_certificado
        WHERE edicao=${request.query.edicao} AND nome=${request.query.nome}
    `, (error, results) => {
        if (error) {
            console.error(error)
            throw error
        } else {
            response.write(JSON.stringify(results.rows))
        }
        response.end()
    })
}

const fetchByType = (request, response) => {
    pool.query(`
        SELECT tipo, COUNT(numero) FROM eventos.certificado
        GROUP BY tipo ORDER BY tipo
    `, (error, results) => {
        if (error) {
            console.error(error)
            throw error
        } else {
            response.write(JSON.stringify(results.rows))
        }
        response.end()
    })
}

const insert = (request, response) => {
    pool.query(`
        INSERT INTO eventos.certificado(numero, tipo)
        VALUES (${request.query.numero}, ${request.query.tipo});

        INSERT INTO eventos.emite_certificado(
        numero, data_de_emissao, cpf_corpo, cpf_controle, nome, edicao)
        VALUES(${request.query.numero}, '${request.query.data_de_emissao}', ${request.query.cpf.substring(0,9)}, '${request.query.cpf.substring(9,11)}', '${request.query.nome}', ${request.query.edicao})
    `, (error, results) => {
        if (error) {
            console.error(error)
            throw error
        } else {
            response.write(JSON.stringify(results.rows))
        }
        response.end()
    })
}

const remove = (request, response) => {
    pool.query(`
        DELETE FROM eventos.emite_certificado WHERE numero=${request.query.numero}
        DELETE FROM eventos.certificado WHERE numero=${request.query.numero}
    `, (error, results) => {
        if (error) {
            console.error(error)
            throw error
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
    fetchByEvent,
    fetchByType,
}