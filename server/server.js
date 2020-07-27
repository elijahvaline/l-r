var express = require('express');
var app = express();

var sqlite3 = require("sqlite3").verbose();
var file = "lured.db";
var fs = require("fs");
var exists = fs.existsSync(file);
var bodyParser = require('body-parser')
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
var jsonParser = bodyParser.json()
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


/// DO WORK HERE
app.get('/getFish', function (req, res) {
    
    var db = new sqlite3.Database(file);
    db.serialize(function() {
        var sql = "SELECT id, date, latitude, longitude, size, type, color FROM fish";
        db.all(sql, function(err, rows) {
            var fish = {"fish" : rows}
            res.send(JSON.stringify(fish));
        
            console.log(JSON.stringify(rows));
        });
    });
    db.close();
})

app.post('/addFish', jsonParser, function(req, response) {
    console.log("addFish");
    
    var db = new sqlite3.Database(file);
    
    var date = req.body.date
    var latitude = req.body.latitude
    var longitude = req.body.longitude
    var size = req.body.size
    var type = req.body.type
    var color = req.body.color

    db.serialize(function() {
        var sql =  "INSERT INTO fish (id, date, latitude, longitude, size, type) VALUES (NULL, \"" + date + "\", \"" +  latitude + "\", \"" +  longitude + "\", \"" + size + "\", \"" +  type + "\", \"" +  color + "\")";
        db.run(sql);
    });
    
    db.close();
    
    response.send("success");
});


var db = new sqlite3.Database(file);

db.serialize(function() {
  if(!exists) {
  
//    var createTable = "CREATE TABLE fish (id INTEGER PRIMARY KEY AUTOINCREMENT, date TEXT, latitude REAL, longitude REAL, size INTEGER, type INTEGER,)"
      
      var createTable = "CREATE TABLE fish (id INTEGER PRIMARY KEY AUTOINCREMENT, date TEXT, latitude REAL, longitude REAL, size TEXT, type TEXT, color TEXT)"
      
      

    db.run(createTable);

  }
});
db.close();
