var  util    = require('util');
     
var q = require('q');
var products = require('./products');
var common = require('./common');
var url = require('url');
exports.blog = function(req,mysql,callback)
{
  
 blog = require('./blog');
  q.all([blog.blog(req,mysql,q),blog.recentblog(req,mysql,q)]).then(function(results){
    
     odata = [];
     odata[0] = results[0][0];
     odata[1] = results[1][0];
     console.log(odata);
     callback(odata);
  });
}
exports.showblog = function(req,mysql,callback)
{
  
 blog = require('./blog');
  q.all([blog.showblog(req,mysql,q),blog.recentblog(req,mysql,q)]).then(function(results){
     odata = [];
     odata[0] = results[0][0];
     odata[1] = results[1][0];
     console.log(odata);
     callback(odata);
  });
}
exports.winnerProducts = function(req,mysql,callback)
{
  
  data = odata = [];
  console.log(req.body.cid);
  data['search'] = req.body.search; 
  data['page'] = req.body.page; 
  data['cid'] = req.body.cid; 
  console.log(data);
  q.all([products.winnerPrd(mysql,q,data)]).then(function(results){
    
     odata['projects'] = products.shortDescribe(results[0][0]);
     callback(odata);
  });
}
exports.searcher = function(req,mysql,callback)
{
  
  data = odata = [];
  data['shipping'] =  data['price'] = [];
  console.log(req.body.cid);
  data['search'] = req.body.search; 
  data['page'] = req.body.page; 
  data['cid'] = req.body.cid; 
  data['images'] = (typeof(req.body.images) !== 'undefined') ? req.body.images : '';
  data['freeshipping'] = (typeof(req.body.freeshipping) !== 'undefined') ? req.body.freeshipping : '';
  data['titlesonly'] = (typeof(req.body.titlesonly) !== 'undefined') ? req.body.titlesonly : '';
  data['projectid'] = (typeof(req.body.projectid) !== 'undefined') ? req.body.projectid : '';
  data['shipping'] = (typeof(req.body['shipping[]']) !== 'undefined') ? req.body['shipping[]'] : '';
  data['price'] = (typeof(req.body['price[]']) !== 'undefined') ? req.body['price[]'] : '';

  q.all([products.searchProducts(mysql,q,data)]).then(function(results){
    //console.log(results[0][0]);
    odata['projects'] = products.shortDescribe(results[0][0]);
     callback(odata);
  });
}

exports.searcherViaUrl = function(req,mysql,callback)
{
  
  data = odata = [];
  data['shipping'] =  data['price'] = [];
  data = url.parse(req.url,true).query;
  data['images'] = (typeof(req.param('images')) !== 'undefined') ? req.param('images') : '';
  data['freeshipping'] = (typeof(req.param('freeshipping')) !== 'undefined') ? req.param('freeshipping') : '';
  data['titlesonly'] = (typeof(req.param('titlesonly')) !== 'undefined') ? req.param('titlesonly') : '';
  data['projectid'] = (typeof(req.param('projectid')) !== 'undefined') ? req.param('projectid') : '';
  data['shipping'] = (typeof(req.body['shipping[]']) !== 'undefined') ? req.body['shipping[]'] : '';
  data['price'] = (typeof(req.body['price[]']) !== 'undefined') ? req.body['price[]'] : '';
  //data['page'] = '';
  //console.log(data);
  q.all([products.searchProducts(mysql,q,data)]).then(function(results){
    //console.log(results[0][0]);
    odata['project'] = products.shortDescribe(results[0][0]);
     callback(odata);
  });
}

exports.index = function(req,res,arr)
{
  //common.tplFile('index.tpl');
  common.tplFile('home.tpl');
  common.headerSet(1);
  common.loadTemplateHeader(req,res,arr);
};     

exports.other = function(req,res,arr)
{
  arr['pagination_html'] = arr['view'] = '';
  req.body.view = (typeof(req.param('view')) !== 'undefined') ? '?view=list': '';
  arr['view'] =  req.body.view;
  req.body.page = (typeof(req.param('page')) !== 'undefined') ? req.param('page') : 0;
  var pagination = require('pagination');
  
  
  if(req.originalUrl.indexOf('/live') > -1)
  { 
  var paginator = new pagination.SearchPaginator({prelink:'/live'+req.body.view, current:  req.body.page, rowsPerPage: 15, totalResult: arr.projects['count']});
  arr['pagination_html'] = paginator.render(); 
  }
  else if(req.originalUrl.indexOf('/closed') > -1)
  { 
  var paginator = new pagination.SearchPaginator({prelink:'/closed'+req.body.view, current:  req.body.page, rowsPerPage: 10, totalResult: arr.projects['count']});
  arr['pagination_html'] = paginator.render(); 
  }
  
  common.tplFile('page.tpl');
  common.headerSet(1);
  common.loadTemplateHeader(req,res,arr);
}; 

exports.otherAjax = function(req,res,arr)
{
  common.tplFile('projects.tpl');
  common.headerSet(0);
  common.loadTemplateHeader(req,res,arr,0);
}; 

exports.projects = function(mysql,callback,req)
{
  //q.fcall(products.homeProducts(mysql)).then(products.homeProducts(mysql)).then(console.log(1));
  q.all([products.homeProducts(mysql,q,16,req,0),products.futureProducts(mysql,q,2),products.closeProducts(mysql,q,req)]).then(function(results){
  	     data1 = results[0][0];
  	     data2 = results[1][0];
		 data3 = results[2][0];

         req_data1 = products.shortDescribe(data1);
         req_data2 = products.shortDescribe(data2);
		 req_data3 = products.shortDescribe(data3);
         odata = [];
	       odata['open_project'] = req_data1;
	       odata['feature_project'] = req_data2;
		   odata['closed_project'] = req_data3;
	    console.log(req_data3);
         callback(odata);
        // Hint : your third query would go here
    });  
};    


exports.live = function(mysql,callback,req)
{
  //q.fcall(products.homeProducts(mysql)).then(products.homeProducts(mysql)).then(console.log(1));
  q.all([products.homeProducts(mysql,q,16,req,0),products.homeProducts(mysql,q,16,req,1)]).then(function(results){
         data1 = results[0][0];
         
         req_data1 = products.shortDescribe(data1);
         
         odata = [];
         odata['project'] = req_data1;
		 odata['count'] = results[1][0].length;
       
       //console.log(odata);
         callback(odata);
        // Hint : your third query would go here
    });  
}; 

exports.future = function(mysql,callback)
{
  //q.fcall(products.homeProducts(mysql)).then(products.homeProducts(mysql)).then(console.log(1));
  q.all([products.futureProducts(mysql,q,17)]).then(function(results){
         data1 = results[0][0];
         
         req_data1 = products.shortDescribe(data1);
         
         odata = [];
         odata['project'] = req_data1;
       
       //console.log(odata);
         callback(odata);
        // Hint : your third query would go here
    });  
}; 

exports.closed = function(mysql,callback,req)
{
  //q.fcall(products.homeProducts(mysql)).then(products.homeProducts(mysql)).then(console.log(1));
  q.all([products.closeProducts(mysql,q,req,0),products.closeProducts(mysql,q,req,1)]).then(function(results){
         //console.log(results[0][0]);
         data1 = results[0][0];
         
         req_data1 = products.shortDescribe(data1);
         
         odata = [];
         odata['project'] = req_data1;
         odata['count'] = results[1][0].length;
       //console.log(odata);
         callback(odata);
        // Hint : your third query would go here
    });  
}; 
exports.shop = function(mysql,callback)
{
  //q.fcall(products.homeProducts(mysql)).then(products.homeProducts(mysql)).then(console.log(1));
  q.all([products.shopProducts(mysql,q)]).then(function(results){
         data1 = results[0][0];
         
         req_data1 = products.shortDescribe(data1);
         
         odata = [];
         odata['project'] = req_data1;
       
       //console.log(odata);
         callback(odata);
        // Hint : your third query would go here
    });  
}; 