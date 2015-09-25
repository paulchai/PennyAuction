var express = require('express');
var reload = require('reload');
var sprintf = require('sprintf').sprintf;
var common = require('../module/common');
var app = express.Router();



//required js
var configure = require('../configure');

//default setters
var config = configure.app();

$arr = {
  config : config
}

//
app.get('/', function(req, res){
	
var module = require('../module');
 $arr.pagetitle = '';
 $arr.ptitle = 'test';
 
   var bid = require('../module/test');

 function processIndex(row)
  {
   bid.bid(row,req,res,$arr);
  }
   $arr.projects = module.projects(config.mysql,processIndex);
  
});

module.exports = app;