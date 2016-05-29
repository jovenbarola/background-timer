var BackgroundTimer;
BackgroundTimer = (function() {
    function BackgroundTimer(interval, callback) {
        var _this = this;
        this.interval = interval;
        this.callback = callback;
        this.timerID = setTimeout(function() {
            return _this.callback();
        }, this.interval);
        this.expirationDate = new Date(Date.now() + this.interval);
    }
    BackgroundTimer.prototype.wakeup = function() {
        var remaining;
        if (this.timerID) {
            remaining = this.expirationDate - new Date();
            this.cancel();
            if (remaining > 0) {
                return this.constructor(remaining, this.callback);
            } else {
                return this.callback();
            }
        }
    };
    BackgroundTimer.prototype.cancel = function() {
        if (this.timerID) {
            clearTimeout(this.timerData);
            return this.timerData = null;
        }
    };
    return BackgroundTimer;
})();
