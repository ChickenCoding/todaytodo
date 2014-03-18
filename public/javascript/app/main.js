(function() {
  "use strict";
  require.config({
    deps: ["app"],
    paths: {
      jquery: "../vendor/jquery",
      knockout: "../vendor/knockout",
      moment: "../vendor/moment",
      store: "../vendor/store"
    },
    shim: {
      jquery: {
        exports: "$"
      },
      knockout: {
        exports: "ko"
      },
      moment: {
        exports: "Moment"
      },
      store: {
        exports: "Store"
      }
    }
  }, require(["jquery", "knockout", "tasks", "members", "userPanel", "store"], (function($, ko, taskList, memberList, currentUser, Store) {
    return $(function() {
      ko.applyBindings(new taskList(), document.getElementById("tasks"));
      ko.applyBindings(new memberList(), document.getElementById("group"));
      return ko.applyBindings(new currentUser(), document.getElementById("current-user"));
    });
  })));

}).call(this);
