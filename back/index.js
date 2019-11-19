const express = require('express')
const bodyParser = require('body-parser')
const cors = require('cors')
const query = require('./queries')
const participante = require('./crud/participante') 

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

app.route('/participante')
  .post(participante.insert)
  .get(participante.fetchByName)

app.route('/participante/:cpf')
  .put(participante.update)
  .delete(participante.remove)

app.route('/evento')

app.route('/emite_certificado')

app.listen(process.env.PORT || 3002, () => {
  console.log(`Server listening on port ${process.env.PORT || 3002}...`)
})

module.exports = app