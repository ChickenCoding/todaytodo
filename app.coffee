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

app.get "/", controllers.index
app.get "/tasks", tasks.list

server = http.createServer app
server.listen app.get("port")
