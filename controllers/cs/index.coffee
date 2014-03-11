###
# GET Home Page
###
exports.index = (req, res) ->
  res.render("index.jade", pageTitle : "homepage")
