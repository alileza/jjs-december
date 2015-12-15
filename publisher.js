var kue = require('kue'),
    queue = kue.createQueue()

// Message payload
var payload = {
    title: 'Welcome to JakartaJS'
  , to: 'hi@alileza.me'
  , template: 'welcome-email'
}

// Push jobs to queue named email
var job = queue.create('email', payload)  
              .ttl(15000)
              .save( function(err){
                   if( !err )
                    console.log( job.id );
              })


// expiry value for the time their job can live in active state
