express = require 'express'
app = express()

messenger = require('./modules/kue-messenger')(3000)

app.get '/', (request, response, next) ->
  return response.send """
  <form method="POST">
    <button type="submit">Sign Up</button>
  </form>
  """

app.post '/', (request, response, next) ->

  message = { hello: "world" }

  messenger.send("send-email", { "message" : "pesan selamat datang", "type" : "welcome-email" })
  messenger.send("send-push-notification", { "message" : "pesan selamat datang" })
  messenger.send("crop-picture", { "message" : "resize and crop" })
  messenger.send("find-match", { "message" : "find match" })

  return response.redirect '/'


app.listen 1312, () ->
  { address, port } = @address()
  console.log "Notification center listening at http://#{address}:#{port}"
