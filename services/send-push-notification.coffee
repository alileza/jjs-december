messenger = require('kue-messenger')()

messenger.listen 'send-push-notification', (job, done) ->
  console.time "#{JSON.stringify(job.data)} IS DONE !"
  setTimeout () ->
    console.timeEnd "#{JSON.stringify(job.data)} IS DONE !"
    done()
  , Math.floor(Math.random()* 5000)
