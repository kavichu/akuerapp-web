var express = require('express');
var proxyMiddleware = require('http-proxy-middleware');

var proxy = null;

if(process.env.API_PROXY_HOST){
  proxy = proxyMiddleware('/api', { 
    target: 'http://' + (process.env.API_PROXY_HOST || 'localhost') + ':5000' 
  });
}

var app = express();

app.set('port', (process.env.PORT || 5000));

if(proxy){
  app.use(proxy);  
}
app.use(express.static(__dirname + '/dist'));

app.get('/', function(request, response) {
  response.render('index.html');
});

app.listen(app.get('port'), function() {
  console.log('Node app is running on port', app.get('port'));
});
