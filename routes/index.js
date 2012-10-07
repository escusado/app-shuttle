//Homepages
exports.index = function(req, res){
  res.render('layout', {
    title   : 'App Shuttle',
    assets  : 'homepage/assets',
    body    : 'homepage/body'
  });
};