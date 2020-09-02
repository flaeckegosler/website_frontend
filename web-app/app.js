const express = require('express');
const path = require('path');


const app = express();

app.use(express.static(__dirname + '/../web-app'));
app.use(express.static(__dirname + '/ajax.googleapis.com'));
app.use(express.static(__dirname + '/cdnjs.cloudflare.com'));
app.use(express.static(__dirname + '/code.jquery.com'));
app.use(express.static(__dirname + '/public'));
app.use(express.static(__dirname + '/use.fontawesome.com'));


app.get('/', function(req, res){
  res.sendFile(path.join(__dirname + '/public/index.html'));
});

app.get('/test', function(req, res){
  res.sendFile(path.join(__dirname + '/public/main.html'));
});



app.listen(3000, function(){
  console.log('Server started on port 3000...')
});
