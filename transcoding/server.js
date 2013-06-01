var express = require('express');
var app = express();

app.use(express.static('www'));
app.use(express.directory('www'));
app.use(express.logger());

app.listen(8080);