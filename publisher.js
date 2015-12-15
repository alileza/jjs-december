var kue = require('kue'),
    queue = kue.createQueue()

var payload = {
    title: 'Welcome to JakartaJS'
  , to: 'hi@alileza.me'
  , template: 'welcome-email'
}


// Push jobs to queue named email
var job = queue.create('email', payload).save( function(err){
   if( !err )
    console.log( job.id );
})
