# background-timer
An alternative for javascript's setTimeout when iPhone/Android goes to sleep on background

### coffeescript
```coffeescript
timer = new BackgroundTimer 10 * 1000, ->
  # This callback will be called after 10 seconds
  console.log 'finished'

timer.enableTicking 1000, (remaining) ->
  # This callback will get called every second (1000 millisecond) till the timer ends
  console.log remaining

timer.start()
```
### javascript
```javascript
timer = new BackgroundTimer(10 * 1000, function() {
	// This callback will be called after 10 seconds
	console.log("finished");
});

timer.enableTicking(1000, function(remaining) {
    // This callback will get called every second (1000 millisecond) till the timer ends
	console.log(remaining);
});

timer.start();
```

Please note :
  - All time parameters are in milliseconds
