
/**
 * Module dependencies.
 */

var express = require('express')
  //routes
  , routes      =    require('./routes')
  , contentType = require('./routes/contentType')

  //vars
  , http    = require('http')
  , path    = require('path')
  , engine  = require('ejs-locals')
  , helpers = require('express-helpers')

var app = express();

helpers(app)

app.engine('ejs', engine);

app.configure(function(){
  app.set('port', process.env.PORT || 3000);
  app.set('views', __dirname + '/views');
  app.set('view engine', 'ejs');
  app.use(express.favicon());
  app.use(express.logger('dev'));
  app.use(express.bodyParser());
  app.use(express.methodOverride());
  app.use(app.router);
  app.use(express.static(path.join(__dirname, 'public')));
});

app.configure('development', function(){
  app.use(express.errorHandler());
});

app.use(require('connect-assets')());

app.get('/', routes.index);
app.get('/content-type', contentType.index);

http.createServer(app).listen(app.get('port'), function(){
  console.log("Express server listening on port " + app.get('port'));
});
