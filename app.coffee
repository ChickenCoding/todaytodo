http = require "http"
path = require "path"
express = require "express"
mongoose = require "mongoose"

app = new express()
app.set "port", process.env.PORT or 3000
app.set "views", path.join(__dirname, "views")
app.set "view engine", "jade"

if "development" is app.get "env"
  app.use express.errorHandler()

mongoose.connect "mongodb://localhost/test"
app.use(express.static(__dirname + "/public"))

app.get "/", (req, res) ->
  test = mongoose.model "cat", name : String
  kitty = new test name : "Kit"
  kitty.save ( (err) ->
    if err?
      console.log "test"
    else
      console.log "saved"
  )
  query = test.findOne( "name" : "Kit", "name", ( (err, kat) ->
    console.log kat
   )
  )
  #res.sendfile(__dirname + "/views/index.html")
  #res.render("views/_layout.jade")


server = http.createServer app
server.listen app.get("port")
