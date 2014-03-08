(function() {
  define(["jquery", "knockout", "store", "moment"], (function($, ko, Store, Moment) {
    var currentUser;
    return currentUser = function() {
      var cU;
      cU = this;
      cU.name = ko.observable(Store.get("user").name || name);
      cU.createdAt = Moment().format("MM DD YYYY hh:mm:ss");
      cU.updatedAt = ko.observable(Store.get("user").updatedAt || Moment().format("MM DD YYYY hh:mm:ss"));
      cU.onChangeName = function() {
        cU.updatedAt(Moment().format("MM DD YYYY hh:mm:ss"));
        return Store.set("user", {
          name: cU.name(),
          updatedAt: cU.updatedAt()
        });
      };
      window.currentUser = cU;
      return null;
    };
  }));

}).call(this);
