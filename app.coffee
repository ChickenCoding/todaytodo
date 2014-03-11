http = require "http"
path = require "path"
express = require "express"
mongoose = require "mongoose"

controllers = require "./controllers/js"
tasks = require "./controllers/js/tasks"

app = new express()
app.set "port", process.env.PORT or 3000
app.set "views", path.join(__dirname, "views")
app.set "view engine", "jade"

if "development" is app.get "env"
  app.use express.errorHandler()

mongoose.connect "mongodb://localhost/test"

app.use(express.static(__dirname + "/public"))

# temp
app.get "/layout", (req, res) ->
  res.render("_layout.jade")
# end of temp

app.get "/", controllers.index

server = http.createServer app
server.listen app.get("port")
