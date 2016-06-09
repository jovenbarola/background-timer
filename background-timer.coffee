class BackgroundTimer
    constructor: (@interval, @callback)->
  
    start: ->
        console.log "starting"
        @startTicking() if @tickingEnabled
        @timerID = setTimeout =>
            @callback()
            @cancel()
        , @interval
        
        document.addEventListener 'resume', =>
            console.log "resume"
            @wakeup()
        , false
        
        @expirationDate = moment(moment() + @interval)
        @running = true

    getRemaining: ->
        @expirationDate - moment()

    wakeup: ->
        if @running
            remaining = @getRemaining()
            @cancel()

            if remaining > 0
                @constructor(remaining, @callback)
                @start()
            else
                @callback()
                @cancel

    enableTicking: (@tickInterval, @tickCallback) ->
        @tickingEnabled = true
    
    pauseTicking: ->
        if @tickerID
            clearInterval @tickerID
            @tickerID = null
    
    resumeTicking: ->
        @startTicking()
    
    roundTime: (time) ->
        Math.floor((time + 100) / 1000) * 1000
        
    startTicking: ->
        if @tickingEnabled
            @tickerID = setInterval =>
                @tickCallback @roundTime(@getRemaining())
            , @tickInterval     

    disableTicking: ->
        if @tickerID
            @tickingEnabled = false
            clearInterval @tickerID
            @tickerID = null
        
    cancel: ->
        console.log "cancel"
        if @running
            @running = false
            @pauseTicking()
            clearTimeout @timerID
            @timerID = null
