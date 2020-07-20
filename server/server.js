var express = require('express');
var app = express();

var sqlite3 = require("sqlite3").verbose();
var file = "lured.db";
var fs = require("fs");
var exists = fs.existsSync(file);
var server = app.listen(8081, function () {
   var host = server.address().address
   var port = server.address().port
   
   console.log("Lur Server listening at http://%s:%s", host, port)
})

app.get('/', function (req, res) {
   res.send("Hello There Again 2");
   console.log("Hello there")
    
})

app.get('/version', function (req, res) {
    res.send("v1.0.0");
    console.log("v1.0.0")
})

app.post('/addFish', function(request, response, body) {
    console.log("addFish");
    
    
    var db = new sqlite3.Database(file);

    db.serialize(function() {
        var post = request.body.value.date
        var latitude = request.body.value.latitude
        var longitude = request.body.value.longitude
        var size = request.body.value.size
        var type = request.body.value.type
        
        var sql =  "INSERT INTO fish (id, date, latitude, longitude, size, type) VALUES (NULL, \"" + date + "\", \"" +  latitude + "\", \"" + "\", \"" +  longitude + "\", \"" + size + "\", \"" +  type + "\", \"" + "\")";
        db.run(sql);
    });
    
    db.close();
    
    response.send("success");

});


var db = new sqlite3.Database(file);

db.serialize(function() {
  if(!exists) {
  
    var createTable = "CREATE TABLE fish (id INTEGER PRIMARY KEY AUTOINCREMENT, date TEXT, latitude REAL, longitude REAL, size INTEGER, type INTEGER)"

    db.run(createTable);

  }
});
db.close();
