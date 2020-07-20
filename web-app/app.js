const express = require('express');
const path = require('path');


const app = express();

app.get('/', function(req, res){
  res.sendFile(path.join(__dirname + '/public/index.html'));
});


app.listen(3000, function(){
  console.log('Server started on port 3000...')
});
