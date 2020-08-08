var express = require('express');
var app = express();

var sqlite3 = require("sqlite3").verbose();var file = "lured.db";
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
app.get('/test/:num/:nu1', function (req, res) {
    var x = parseInt(req.params.num, 10)
    var y = parseInt(req.params.nu1, 10)
    var ans = x + y
    res.send("Answer = " + (x + y));
    console.log("v1.0.0")
    
})


/// DO WORK HERE
app.get('/getFish/:userdate/:userlong/:userlat/:date/:location/:size/:type', function (req, res) {
    
    var userdate = Number(req.params.userdate)
    var lon = Number(req.params.userlong) //+- 1
    var lat = Number(req.params.userlat) // +- 1
    var date = req.params.date
    var location = req.params.location
    var size = req.params.size
    var type = req.params.type
    
    var sqlLatitude = ''
    var sqlLongitude = ''
    var sqlDate = ''
    var sqlType = ''
    var sqlSize = ''
    console.log(lon + " " + lat)
    var all = true
    var and = false
    
    if (location == 'local'){
        all = false
        and = true
        sqlLatitude = ' latitude BETWEEN ' + (lat - 1.0) + ' and ' + (lat + 1.0)
        sqlLongitude = ' AND longitude BETWEEN ' + (lon - 1.0) + ' and ' + (lon + 1.0)
    }
    if (userdate == 'recent'){
        if (and == true){
            sqlDate = ' AND date BETWEEN ' + (date - 30.0) + ' and ' + (date + 30.0)
        }
        else {
            sqlDate = ' date BETWEEN ' + (date - 30.0) + ' and ' + (date + 30.0)
        }
        and = true
        all = false
    }
    else if (userdate == 'year'){
        if (and == true){
            sqlDate = ' AND date BETWEEN ' + (date - 365.0) + ' and ' + (date + 365.0)
        }
        else {
            sqlDate = ' date BETWEEN ' + (date - 365.0) + ' and ' + (date + 365.0)
        }
        and = true
        all = false
        
    }
    if (size == 'small'){
        if (and == true) {
            sqlSize = " AND size = 'big'"
        }
        else {
            sqlSize = " size = 'big'"
        }
        and = true
        all = false
        
    }
    else if (size == 'medium'){
        if (and == true){
            sqlSize = " AND size = 'bigger'"
            
        }
        else {
            sqlSize = " size = 'bigger'"
        }
        and = true
        all = false
        
    }
    else if (size == 'large'){
        if (and == true){
            sqlSize = " AND size = 'huge'"
        }
        else {
            sqlSize = " size = 'huge'"
        }
        and = true
        all = false
        
    }
    if (type != 'All'){
        if (and == true){
            sqlType = " AND type = '" + type + "'"
        }
        else {
            sqlType = " type = '" + type + "'"
        }
        all = false
        
    }
    
    
    
    
    
    
    var db = new sqlite3.Database(file);
    db.serialize(function() {
//        var sql = "SELECT id, date, latitude, longitude, size, type, color FROM fish";
        if (all == false){
            var sql = "SELECT * FROM fish WHERE" + sqlLatitude + sqlLongitude + sqlDate + sqlSize + sqlType;
        }
        else if (all == true){
            var sql = "Select * FROM fish"
        }
        console.log(sql)
            
       
        
//        var sql = "SELECT * FROM fish WHERE " + sqlDate + " AND " + sqlLatitude + "AND" + sqlLongitude + "AND size = " + size + " AND type = " + type;
//        var sql = "SELECT * FROM fish WHERE " + sqlDate + " AND " + sqlLatitude + "AND" + sqlLongitude + "AND size = " + size + " AND type = " + type;
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
       
        var sql =  "INSERT INTO fish (id, date, latitude, longitude, size, type, color) VALUES (NULL, \"" + date + "\", \"" +  latitude + "\", \"" +  longitude + "\", \"" + size + "\", \"" +  type + "\", \"" +  color + "\")";
        db.run(sql);
    });
    
    db.close();
    
    response.send("success");
});


var db = new sqlite3.Database(file);

db.serialize(function() {
  if(!exists) {
  
//    var createTable = "CREATE TABLE fish (id INTEGER PRIMARY KEY AUTOINCREMENT, date TEXT, latitude REAL, longitude REAL, size INTEGER, type INTEGER,)"
      
      var createTable = "CREATE TABLE fish (id INTEGER PRIMARY KEY AUTOINCREMENT, date REAL, latitude REAL, longitude REAL, size TEXT, type TEXT, color TEXT)"
      
      

    db.run(createTable);

  }
});
db.close();
