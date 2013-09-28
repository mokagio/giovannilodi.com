
# Module dependencies.

express = require 'express'
routes = require './routes'
user = require './routes/user'
http = require 'http' 
path = require 'path'
nib = require 'nib'

app = express()

# all environments
app.set('port', process.env.PORT || 3000)
app.set('views', __dirname + '/views')
app.set('view engine', 'jade')
app.use(express.favicon())
app.use(express.logger('dev'))
app.use(express.bodyParser())
app.use(express.methodOverride())
app.use(app.router)
app.use(express.static(path.join(__dirname, 'public')))

# connect-assets assets pipeline configs
app.use require('connect-assets')(src: 'public')
css.root = '/stylesheets'
js.root = '/javascripts'

# development only
if 'development' == app.get('env')
  app.use(express.errorHandler())

app.use(nib)

app.get('/', routes.index)
app.get('/users', user.list)

http.createServer(app).listen app.get('port'), () ->
  console.log('Express server listening on port ' + app.get('port'))
