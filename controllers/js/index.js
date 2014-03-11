
/*
 * GET Home Page
 */
exports.index = function(req, res) {
  return res.render("index.jade", {
    pageTitle: "homepage"
  });
};
