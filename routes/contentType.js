//content-type
exports.index = function(req, res){
  res.render('layout', {
    title   : 'App Shuttle - Content-types',
    assets  : 'content-type/assets',
    body    : 'content-type/body'
  });
};