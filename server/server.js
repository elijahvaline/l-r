var express = require('express');
var app = express();

var server = app.listen(8081, function () {
   var host = server.address().address
   var port = server.address().port
   
   console.log("Lur Server listening at http://%s:%s", host, port)
})

app.get('/', function (req, res) {
   res.send("Hello There Again");
})

app.get('/version', function (req, res) {
   res.send("v1.0.0");
})

