(function() {
  define(["jquery", "knockout", "moment"], (function($, ko, Moment) {
    var pomodoro;
    return pomodoro = function(number, idTask) {
      var hello, p;
      p = this;
      p.id = 0;
      p.number = number;
      p.taskId = idTask;
      hello = function() {
        return console.log("world");
      };
      window.pomodoro = p;
      return null;
    };
  }));

}).call(this);
