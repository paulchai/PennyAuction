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

app.get('/customer',function(req,res)
{
     customerio = require('../module/customerio');
     req.body.email = 'kkr@gmail.com';
     req.body.first_name ='as';
     req.body.last_name = 'bs';
     console.log(12);
     customerio.uid = '12';
     customerio.inits();
     console.log(customerio.uid);
     customerio.createCustomer({email:req.body.email,user:{firstName:req.body.first_name,lastName:req.body.last_name}});
     customerio.sendEmail({event:'Signed Up',content:{user:req.body.first_name+' '+req.body.last_name}});
});

//
app.get(['/','/reg/:error','/log/:lerror','/reg/','/log/'], function(req, res){
 $arr.register_error = '';
 $arr.register_fail = 0;
 $arr.login_error = '';
 $arr.login_fail = 0;
 if(typeof(req.param('error')) !== 'undefined')
 {
  $arr.register_error = req.param('error');
  $arr.register_fail = 1;
 }
 if(typeof(req.param('lerror')) !== 'undefined')
 {
  $arr.login_error = req.param('lerror');
  $arr.login_fail = 1;
 }
console.log($arr.register_error+'as');
var module = require('../module');
 $arr.pagetitle = '';
 $arr.ptitle = 'index';
  function processIndex(row)
  {
    common.processIndex(row,req,res,$arr);

  }
   $arr.projects = module.projects(config.mysql,processIndex,req);
  
});

app.get('/language', function(req, res){
var module = require('../module');
$arr.ptitle = 'index';
$arr.pagetitle = 'Live Auctions';
  function processIndex(row)
  {
    common.processIndex(row,req,res,$arr);
  }
   $arr.projects = module.live(config.mysql,processIndex);
   //processIndex($arr.projects);
  
});

app.get('/live', function(req, res){
var module = require('../module');
$arr.ptitle = 'index';
$arr.pagetitle = 'Live Auctions';
  function processIndex(row)
  {
    common.processIndex(row,req,res,$arr);
  }
   $arr.projects = module.live(config.mysql,processIndex,req);
   //processIndex($arr.projects);
  
});
app.get('/db',function(req,res)
{
  config.mysql.query("CREATE TABLE IF NOT EXISTS `reviews` ( `id` int(100) NOT NULL AUTO_INCREMENT, `user_id` int(100) NOT NULL, `subject` varchar(100) NOT NULL, `message` varchar(100) NOT NULL, `date_added` datetime NOT NULL, `rating` int(100) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1",function(){res.end('Hi')});
});

app.get('/search', function(req, res){
  //var qs = require('qs');
  //req.body = qs.parse(req.body);
  
  var module = require('../module');
  function processIndex(row)
  { 
    //console.log(row);
    $arr.pagetitle = 'Search Projects';
  $arr.ptitle = 'live';
  $arr.cid_search = (typeof(req.param('cid')) !== 'undefined') ? req.param('cid') : 0;
  $arr.search_search = (typeof(req.param('search')) !== 'undefined') ? req.param('search') : '';
  $arr.pid_search = (typeof(req.param('projectid')) !== 'undefined') ? req.param('projectid') : 0;
  $arr.images_search = (typeof(req.param('images')) !== 'undefined') ? 'checked="checked"' : '';
  $arr.freeshipping = (typeof(req.param('freeshipping')) !== 'undefined') ? 'checked="checked"' : '';
  $arr.titlesonly = (typeof(req.param('titlesonly')) !== 'undefined') ? 'checked="checked"' : '';
    common.processIndex(row,req,res,$arr);
  }
   $arr.projects = module.searcherViaUrl(req,config.mysql,processIndex);
  
});
app.get('/winner', function(req, res){
  //var qs = require('qs');
  //req.body = qs.parse(req.body); 
  
  var module = require('../module');
  $arr['externalcss'] = ['penny'];
  function processIndex(row)
  { 
      console.log(row);
     $arr['projects'] = row['projects'];
     common.tplFile('winner.tpl');
     common.headerSet(1);
     common.loadTemplateHeader(req,res,$arr);
  }
   $arr.projects = module.winnerProducts(req,config.mysql,processIndex);
  
});
app.post('/search', function(req, res){
  
  var module = require('../module');
  function processIndex(row)
  { 
    common.processIndexajax(row,req,res,$arr);
  }
   $arr.projects = module.searcher(req,config.mysql,processIndex);
  
});

app.get('/future', function(req, res){
$arr.pagetitle = 'Future Auctions';
$arr.ptitle = 'future';
var module = require('../module');
  function processIndex(row)
  {
    common.processIndex(row,req,res,$arr);
  }
   $arr.projects = module.future(config.mysql,processIndex);
  
});

app.get('/closed', function(req, res){
  $arr.pagetitle = 'Closed Auctions';
  $arr.ptitle = 'closed';
var module = require('../module');
  function processIndex(row)
  {
    
    common.processIndex(row,req,res,$arr);
  }
   $arr.projects = module.closed(config.mysql,processIndex,req);
  
});

app.get('/shop', function(req, res){
  $arr.ptitle = 'shop';
  $arr.pagetitle = 'Buy Now Auctions';
  $arr['buy_this'] = true;
  var module = require('../module');
  function processIndex(row)
  {
    common.processIndex(row,req,res,$arr);
  }
  $arr.projects = module.shop(config.mysql,processIndex);
  
});
app.get(['/reviews'],function(req,res)
{
  var q = require('q');
  req.body.page = (typeof(req.param('page')) !== 'undefined') ? req.param('page'): 1;
  console.log(req.body);
  var admin = require('../module/admin');
  var pagination = require('pagination');
  $arr['externalcss'] =  ['star-rating',];
  $arr['externaljs'] = ['star-rating'];
  $arr['reviewaction'] = false; 
  q.all([admin.allreviews(req,config.mysql,q,0),admin.allreviews(req,config.mysql,q,1)]).then(function(result)
  { 
    //console.log(result[0][0]);
     $arr['review'] = result[0][0];
     $arr['reviews']   = result[1][0].length;
     var paginator = new pagination.SearchPaginator({prelink:'/reviews/', current:  req.body.page, rowsPerPage: 10, totalResult: $arr['reviews']});

     $arr['pagination_html'] = paginator.render();
     common.tplFile('reviews.tpl');
     common.headerSet(1);
     common.loadTemplateHeader(req,res,$arr);
   });  
});
app.get(['/how_it'],function(req,res)
{
  
   
     common.tplFile('how_it.tpl');
     common.headerSet(1);
     common.loadTemplateHeader(req,res,$arr);
   
});
app.post(['/dispute'],function(req,res)
{
  
  common.checkLogin(req,res,0);
  var dispute = require('../module/dispute');
  var q = require('q');
  q.all([dispute.addDispute(req,config.mysql,q)]).then(function(results)
  {
        res.writeHead(302, {
               'Location':  '/dispute/submitted'
              });
        res.end();return false;
     });
 
   
});
app.get(['/dispute','/dispute/:action'],function(req,res)
{
    $arr['action_sent'] = (typeof(req.param('action')) === 'undefined') ? false : true;
  
     $arr['externalcss'] =  ['star-rating',];
     $arr['externaljs'] = ['star-rating'];
     common.tplFile('dispute.tpl');
     common.headerSet(1);
     common.loadTemplateHeader(req,res,$arr);
   
});
app.get(['/terms'],function(req,res)
{
  
   
     common.tplFile('dispute.tpl');
     common.headerSet(1);
     common.loadTemplateHeader(req,res,$arr);
   
});
app.get(['/about'],function(req,res)
{
  
   
     common.tplFile('about.tpl');
     common.headerSet(1);
     common.loadTemplateHeader(req,res,$arr);
   
});
app.get(['/blog/','/blog/:id'], function(req, res){
  $arr.ptitle = 'Blogs';
  req.body.id = (typeof(req.param('id')) !== 'undefined') ?  req.param('id') : 0;
  $arr.pagetitle = 'Site Blogs';
  var module = require('../module');
  var common = require('../module/common');
  function processIndex(row)
  {

   
    console.log(row);
    if(req.body.id > 0)
    {   
        $arr.blog = row[0][0];
        $arr.rblog = row[1];
        common.tplFile('showblog.tpl');
        common.headerSet(1);
        common.loadTemplateHeader(req,res,$arr);
    }
    else
    {
       $arr.blog = row[0];
       $arr.rblog = row[1];
        common.tplFile('bloglist.tpl');
        common.headerSet(1);
        common.loadTemplateHeader(req,res,$arr);
    }  
  }
  
 
  if(req.body.id > 0)
  { 
    module.showblog(req,config.mysql,processIndex);
  }
  else
  {
     module.blog(req,config.mysql,processIndex);
  }  
  
  
});

module.exports = app;