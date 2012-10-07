//content-type
exports.index = function(req, res){
  res.render('layout', { title: 'Content-type', view: 'content-type/index' });
};