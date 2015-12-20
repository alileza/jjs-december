kue = require 'kue'
queue = kue.createQueue()

crypto = require "crypto"
_ = require "underscore"

module.exports = (options) =>
	kue.app.listen(options) if options
	@default = {}

	@send = (queue_name, data) =>
    # console.dir "Sending to #{queue_name}"

    ##
    #   Initialize Jobs
    #   https://github.com/Automattic/kue#creating-jobs
    ##
    job = queue.create queue_name, data

    ##
    #   Default Priority List
    #   https://github.com/Automattic/kue#job-priority
    ##
    job = job.priority( job.priority ) if data.priority

    ##
    #   Failure Attempts, how many retry before it declare failed
    #   https://github.com/Automattic/kue#failure-attempts
    ##
    job = job.attempts(5)

    ##
    #   Backoff, when job's failed, give some delay before second retry
    #   https://github.com/Automattic/kue#failure-backoff
    ##
    job = job.backoff { delay: 15*1000, type:'exponential' }

    job = job.ttl( 60*60*1000 )

    job.save (err) ->
      if err
        console.error "#{job.id} error t enqueue"


	@listen = (queue_name, cb) ->
    # console.dir "Listening to #{queue_name}"
    queue.process queue_name, cb

	@
