// Generated by CoffeeScript 1.7.1
(function() {
  var app, express, http, path, server;

  http = require("http");

  path = require("path");

  express = require("express");

  app = new express();

  app.set("port", process.env.PORT || 3000);

  app.set("views", path.join(__dirname, "tpl"));

  app.use(express["static"](__dirname + "/public"));

  if ("development" === app.get("env")) {
    app.use(express.errorHandler());
  }

  app.get("/", function(req, res) {
    return res.sendfile(__dirname + "/views/index.html");
  });

  server = http.createServer(app);

  server.listen(app.get("port"));

}).call(this);
