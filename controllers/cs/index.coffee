###
# GET Home Page
###
exports.index = (req, res) ->
  res.render("pages/index.jade", pageTitle : "homepage")
