var express = require('express');
var proxyMiddleware = require('http-proxy-middleware');

if(process.env.API_PROXY_HOST) {
  var proxy = proxyMiddleware('/api', { 
    target: 'http://' + process.env.API_PROXY_HOST + ':5000' 
  });
}

var app = express();

app.set('port', (process.env.PORT || 5000));

if(process.env.API_PROXY_HOST) {
  app.use(proxy);
}

app.use(express.static(__dirname + '/dist'));

app.get('/', function(request, response) {
  response.render('index.html');
});


app.listen(app.get('port'), function() {
  console.log('Node app is running on port', app.get('port'));
});
