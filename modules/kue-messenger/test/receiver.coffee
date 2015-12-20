messenger = require '../index'
m = messenger()

m.listen 'ping', (job, done) ->
  console.dir job.data
  done()
  # done(new Error('booyah'))
