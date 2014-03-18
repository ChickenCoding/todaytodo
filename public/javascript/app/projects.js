(function() {
  define(["jquery", "knockout", "moment", "store", "pomodoro", "members", "tasks"], (function($, ko, Moment, Store, pomodoro, members, tasks) {
    var project;
    return project = function(id, name) {
      var pjc;
      pjc = this;
      pjc.id = 0;
      pjc.name = ko.observable(name);
      pjc.createdAt = Moment().format("MM-DD-YYYY hh:mm:ss");
      pjc.updatedAt = ko.observable(Moment().format("MM-DD-YYYY hh:mm:ss"));
      pjc.taskers = ko.observableArray([new members()]);
      pjc.onUpdate = function() {
        return pjc.updatedAt(Moment().format("MM-DD-YYYY hh:mm:ss"));
      };
      window.project = pjc;
      return null;
    };
  }));

}).call(this);
