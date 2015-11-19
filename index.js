var express = require('express');
var proxyMiddleware = require('http-proxy-middleware');

var proxy = proxyMiddleware('/api', { 
<<<<<<< HEAD
  target: 'http://' + (process.env.API_PROXY_HOST || 'localhost') + ':5000' 
=======
  target: 'http://' + (process.env.API_HOST || 'localhost') + ':5000' 
>>>>>>> 7b2b2f7735c415314197df308b74a3824c89f808
});

var app = express();

app.set('port', (process.env.PORT || 5100));

app.use(proxy);
app.use(express.static(__dirname + '/dist'));

app.get('/', function(request, response) {
  response.render('index.html');
});


app.listen(app.get('port'), function() {
  console.log('Node app is running on port', app.get('port'));
});
