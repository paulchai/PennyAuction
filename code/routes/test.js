var express = require('express');
var reload = require('reload');
var sprintf = require('sprintf').sprintf;
var common = require('../module/common');
var app = express.Router();



//required js
/*var configure = require('../configure');

//default setters
var config = configure.app();

$arr = {
  config : config
}*/

//
app.get('/', function(req, res){
	
var module = require('../module');
 $arr.pagetitle = '';
 $arr.ptitle = 'test';
    var admin = require('../module/admin');
    customerio =  require('../module/customerio');
    customerio.uid = 'pennyauction';
    customerio.inits();
    customerio.createCustomer({email:'pandi@auctionsoftware.com',user:{firstName:'fasd',lastName:'asdas'}});
   // var hw = cryptos.encrypt(result.insertId.toString());
    var activation =  config.url+'/login/activation?id=sdasdas';
    //customerio.sendEmail({event:'Signed Up',content:{user:req.body.first_name+' '+req.body.last_name,activeurl:activation}});
    customerio.sendEmail({event:'verification',content:{user:'dfgdfgdf',activeurl:activation}});

   var bid = require('../module/test');

 function processIndex(row)
  {
   bid.bid(row,req,res,$arr);
  }
   $arr.projects = module.projects(config.mysql,processIndex);
  
});

module.exports = app;