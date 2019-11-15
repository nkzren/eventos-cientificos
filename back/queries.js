const { pool } = require('./config')


const getNameCountByEvent = (request, response) => {
    let mock = "Renan"
    pool.query(`SELECT * FROM eventos.`)
}

const getLocationsWithNParticipants = (request, response) => {
    // Pegar quantidade no request
    pool.query(
        `SELECT *
        FROM eventos.local l
        WHERE 100 <= ANY(
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
            response.end()
        } else {
            response.status(200).json(results.rows);
        }
    })
}

const getCertificateCountByParticipant = (request, response) => {
    pool.query(
        `SELECT cpf_corpo, cpf_controle, p.nome, count(numero)
        FROM eventos.participante p 
        LEFT JOIN eventos.emite_certificado using (cpf_controle, cpf_corpo)
        GROUP BY cpf_corpo, cpf_controle`,
        (error, results) => {
            if (error) {
                console.error(error)
            } else {
                response.write(JSON.stringify(results.rows))
            }
            response.end()
        });
}

module.exports = {
    getLocationsWithNParticipants,
    getCertificateCountByParticipant,
    getNameCountByEvent,
}