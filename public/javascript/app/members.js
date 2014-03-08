(function() {
  define(["jquery", "knockout", "moment", "store"], (function($, ko, Moment, Store) {
    var member, memberList;
    member = function(id, name) {
      var m;
      m = this;
      m.id = id;
      m.name = name;
      window.member = m;
      return null;
    };
    return memberList = function() {
      var ml;
      ml = this;
      ml.id = 0;
      ml.name = "my group";
      ml.mId = 0;
      ml.list = ko.observableArray([new member(ml.mId, "John"), new member(ml.mId + 1, "Johny")]);
      window.memberList = ml;
      return null;
    };
  }));

}).call(this);
