messenger = require '../index'
m = messenger()

m.send 'ping', { hello : "world" }
