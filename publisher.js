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
              .priority('high')
              .attempts(5)
              .backoff( {delay: 60*1000, type:'fixed'} )
              .save( function(err){
                   if( !err )
                    console.log( job.id );
              })


// // Override delay value, fixed backoff
// job.attempts(3).backoff( {delay: 60*1000, type:'fixed'} )
//
// // Enable exponential backoff using original delay (if set)
// job.attempts(3).backoff( {type:'exponential'} )
//
// // Use a function to get a customized next attempt delay value
// job.attempts(3).backoff( function( attempts, delay ){
//  return my_customized_calculated_delay;
// })
