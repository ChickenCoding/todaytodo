(function() {
  define(["jquery", "knockout", "moment"], (function($, ko, Moment) {
    var pomodoro;
    return pomodoro = function(number, idTask) {
      var p;
      p = this;
      p.id = 0;
      p.number = number;
      p.taskId = idTask;
      window.pomodoro = p;
      return null;
    };
  }));

}).call(this);
