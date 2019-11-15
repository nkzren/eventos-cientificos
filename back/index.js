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

app
  .route('/')
  .get(query.getCertificateCountByParticipant)

app.listen(process.env.PORT || 3002, () => {
  console.log(`Server listening on port ${process.env.PORT || 3002}...`)
})

module.exports = app