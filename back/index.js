const express = require('express')
const bodyParser = require('body-parser')
const cors = require('cors')
const query = require('./queries')
const participante = require('./crud/participante')
const evento = require('./crud/evento')
const certificado = require('./crud/emite_certificado')

const app = express()

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: true }))
app.use(cors())

app.route('/nameByEvt').get(query.getNameCountByEvent)
app.route('/locByPartCount').get(query.getLocationsWithNParticipants)
app.route('/certByPart').get(query.getCertificateCountByParticipant)
app.route('/sponsorMultEvt').get(query.getSponsorsMoreThanOneEvent)
app.route('/part3States').get(query.getParticipantsThreeStates)
app.route('/entPromSpons').get(query.getEntitiesPromoteAndSponsor)

app.route('/participante')
  .post(participante.insert)
  .get(participante.fetchByName)

app.route('/participante/:cpf')
  .put(participante.update)
  .delete(participante.remove)

app.route('/evento')
  .post(evento.insert)
  .get(evento.fetchByDate)

app.route('/evento/:nome/:edicao')
  .put(evento.update)
  .delete(evento.remove)

app.route('/emite_certificado')
  .post(certificado.insert)

app.route('/emite_certificado/type')
  .get(certificado.fetchByType)

app.route('/emite_certificado/event')
  .get(certificado.fetchByEvent)

app.route('/emite_certificado/:numero')
  .delete(certificado.remove)

app.listen(process.env.PORT || 3002, () => {
  console.log(`Server listening on port ${process.env.PORT || 3002}...`)
})

module.exports = app