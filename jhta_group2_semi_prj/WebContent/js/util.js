/**
 * 
 */

function getFirstEBT(tag){
 	return document.getElementsByTagName(tag).item(0);
}

function getFirstEBC(cls){
 	return document.getElementsByClassName(cls).item(0);
}

function getElByID(id){
	return document.getElementById(id);
}

function $$$(el){
	return document.querySelector(el);
}

function timer(fn, time, el) {                                       //check interval is running
    var timer = false;
    this.start = function () {
        if (!this.isRunning()){
            timer = setInterval(fn, time, el);
}
    };
    this.stop = function () {
        if(this.isRunning()){
        clearInterval(timer);
        timer = false;
}
    };
    this.isRunning = function () {
        return timer !== false;
    };
}