//Homepages
exports.index = function(req, res){
  res.render('layout', { title: 'App Shuttle', assets: 'content-type/assets', body: 'content-type/body' });
};