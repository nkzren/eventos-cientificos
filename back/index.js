const express = require('express')
const bodyParser = require('body-parser')
const cors = require('cors')
const query = require('./queries')
const participante = require('./crud/participante') 
const evento = require('./crud/evento')
const certificado = require('./crud/emite_certificado')

const app = express()

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({
  extended: true
}))
app.use(cors())

app.route('/nameByEvt').get(query.getNameCountByEvent)
app.route('/locByPartCount').get(query.getLocationsWithNParticipants)
app.route('/certByPart').get(query.getCertificateCountByParticipant)
app.route('/sponsorMultEvt').get(query.getSponsorsMoreThanOneEvent)
app.route('/part3States').get(query.getParticipantsThreeStates)
app.route('/entPromSpons').get(query.getEntitiesPromoteAndSponsor)

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

app.route('/emite-certificado')
  .post(certificado.insert)

app.route('/emite-certificado/type')
  .get(certificado.fetchByType)

app.route('emite-certificado/event')
  .get(certificado.fetchByEvent)

app.route('/emite-certificado/:numero')
  .delete(certificado.remove)

app.listen(process.env.PORT || 3002, () => {
  console.log(`Server listening on port ${process.env.PORT || 3002}...`)
})

module.exports = app