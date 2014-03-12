
/*
 * GET Home Page
 */
exports.index = function(req, res) {
  return res.render("pages/index.jade", {
    pageTitle: "homepage"
  });
};
