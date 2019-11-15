const express = require('express')
const bodyParser = require('body-parser')
const cors = require('cors')
const query = require('./queries')

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

app.listen(process.env.PORT || 3002, () => {
  console.log(`Server listening on port ${process.env.PORT || 3002}...`)
})

module.exports = app