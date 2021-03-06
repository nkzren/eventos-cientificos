const express = require('express')
const bodyParser = require('body-parser')
const cors = require('cors')
const participante = require('./crud/participante') 
const evento = require('./crud/evento')
const certificado = require('./crud/emite_certificado')

const app = express()

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({
  extended: true
}))
app.use(cors())

app.route('/local').get((request, response) => {
  pool.query(`SELECT id_local, nome FROM eventos.local ORDER BY nome`, (error, results) => {
      if (error) {
          response.status(400)
          response.write(JSON.stringify(error))
      } else {
          response.write(JSON.stringify(results.rows))
      }
      response.end()
  })
})

app.route('/participantes')
  .post(participante.insert)
  .get(participante.fetchByName)

app.route('/participantes/:cpf')
  .put(participante.update)
  .delete(participante.remove)

app.route('/eventos')
  .post(evento.insert)
  .get(evento.fetchByDate)

app.route('/eventos/:nome/:edicao')
  .put(evento.update)
  .delete(evento.remove)

app.route('/certificados')
  .post(certificado.insert)
  .get(certificado.fetchAll)

app.route('/certificados/type')
  .get(certificado.fetchByType)

app.route('/certificados/event')
  .get(certificado.fetchByEvent)

app.route('/certificados/:numero')
  .delete(certificado.remove)

app.listen(process.env.PORT || 3002, () => {
  console.log(`Server listening on port ${process.env.PORT || 3002}...`)
})

module.exports = app