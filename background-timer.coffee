class BackgroundTimer
	constructor: (@interval, @callback)->
		@timerID = setTimeout =>
                    @callback()
                , @interval
		@expirationDate = new Date(Date.now() + @interval)

	wakeup: ->
		if @timerID
			remaining = @expirationDate - new Date();
			@cancel();
			
			if remaining > 0
				@constructor(remaining, @callback)
			else
				@callback()

	cancel: ->
		if @timerID
			clearTimeout @timerData
			@timerData = null
			
