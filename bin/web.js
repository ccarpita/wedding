var http = require('http');
var path = require('path');
var express = require('express');
var app = express();
app.use(express.static(path.join(__dirname, '../src/public')));
http.createServer(app).listen(80);
