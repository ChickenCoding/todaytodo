(function() {
  define(["store"], (function(Store) {
    var data;
    if (!Store.get("name")) {
      return data = Store.set("name", "Brian");
    } else {
      return console.log(Store.get("name"));
    }
  }));

}).call(this);
