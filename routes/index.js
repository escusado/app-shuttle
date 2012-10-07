//Homepages
exports.index = function(req, res){
  res.render('layout', { title: 'App Shuttle', view: 'main' });
};