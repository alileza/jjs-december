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
              .save( function(err){
                   if( !err )
                    console.log( job.id );
              })

// {
//     low: 10
//   , normal: 0
//   , medium: -5
//   , high: -10
//   , critical: -15
// };
