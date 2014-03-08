(function() {
  define(["jquery", "knockout", "moment", "store", "pomodoro", "members"], (function($, ko, Moment, Store, pomodoro, members) {
    var task, taskList;
    task = function(id, name, pom) {
      var t;
      t = this;
      t.id = id;
      t.name = ko.observable(name);
      t.createdAt = Moment().format("MM-DD-YYYY hh:mm:ss");
      t.updatedAt = ko.observable(Moment().format("MM-DD-YYYY hh:mm:ss"));
      t.pomodoro = ko.observable(new pomodoro(pom, t.id).number);
      t.taskers = ko.observableArray([new members()]);
      t.onUpdate = function() {
        return t.updatedAt(Moment().format("MM-DD-YYYY hh:mm:ss"));
      };
      window.task = t;
      return null;
    };
    return taskList = function() {
      var tl;
      tl = this;
      tl.id = 0;
      tl.name = "my tasklist";
      tl.totalTaskers = 0;
      tl.tId = 0;
      tl.list = ko.observableArray([new task(tl.tId, "mytask", 3), new task(tl.tId + 1, "mytask2", 4)]);
      tl.totalPomodoros = ko.computed({
        read: function() {
          var totalPomodoros, _i, _len, _ref;
          totalPomodoros = 0;
          _ref = tl.list();
          for (_i = 0, _len = _ref.length; _i < _len; _i++) {
            task = _ref[_i];
            totalPomodoros += parseInt(task.pomodoro());
          }
          return totalPomodoros;
        },
        write: function() {
          var totalPomodoros, _i, _len, _ref;
          totalPomodoros = 0;
          _ref = tl.list();
          for (_i = 0, _len = _ref.length; _i < _len; _i++) {
            task = _ref[_i];
            totalPomodoros += parseInt(task.pomodoro());
          }
          return totalPomodoros;
        },
        owner: tl
      });
      tl.totalTaskers = ko.computed({
        read: function() {
          var tasker, taskers, totalTaskers, _i, _j, _len, _len1, _ref, _ref1;
          totalTaskers = 0;
          _ref = task.taskers();
          for (_i = 0, _len = _ref.length; _i < _len; _i++) {
            taskers = _ref[_i];
            _ref1 = taskers.list();
            for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
              tasker = _ref1[_j];
              totalTaskers += 1;
            }
          }
          return totalTaskers;
        },
        write: function() {
          var tasker, taskers, totalTaskers, _i, _j, _len, _len1, _ref, _ref1;
          totalTaskers = 0;
          _ref = task.taskers();
          for (_i = 0, _len = _ref.length; _i < _len; _i++) {
            taskers = _ref[_i];
            _ref1 = taskers.list();
            for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
              tasker = _ref1[_j];
              totalTaskers += 1;
            }
          }
          return totalTaskers;
        },
        owner: tl
      });
      window.taskList = tl;
      return null;
    };
  }));

}).call(this);
