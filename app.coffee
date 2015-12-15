express = require 'express'
app = express()

kue = require('kue')
kue.app.listen(3000)
queue = kue.createQueue()


app.get '/', (request, response, next) ->

  return response.send """
  <form method="POST">
    <button type="submit">Sign Up</button>
  </form>
  """

app.post '/', (request, response, next) ->

  message = { hello: "world" }

  queue.create("email-notification", message).save()

  return response.redirect '/'


queue.process 'email-notification', (job, done) ->
  console.dir job.data
  setTimeout () ->
    done()
  , 3000

app.listen 1312, () ->
  { address, port } = @address()
  console.log "Notification center listening at http://#{address}:#{port}"
