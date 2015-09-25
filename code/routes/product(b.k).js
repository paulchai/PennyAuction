var  util    = require('util');
var express = require('express');
var reload = require('reload');
var q = require('q');
var sprintf = require('sprintf').sprintf;

var common = require('../module/common');
var products = require('../module/products');

var app = express.Router();



//required js
var configure = require('../configure');

//default setters
var config = configure.app();
config.perbid = 0.60;
$arr = {
  config : config
}

app.post('/save', function(req, res){
  common.checkLogin(req,res,0);
  $arr.error = '';
  var attach = require('../module/attach');
  attach.save('product',req,res);
  q.all(products.save(req,config.mysql,q)).then(function(results){ 
  	//console.log(333);
    customerio = require('../module/customerio');
  	customerio.uid = req.session.userid;
    customerio.inits();
   
    customerio.createCustomer({email:req.session.email,user:{firstName:req.session.first_name,lastName:req.session.last_name}});
    
    customerio.sendEmail({event:'project_posted',content:{user:req.session.first_name+' '+req.session.last_name,name: req.body.title,url : config.url+'/product/view/'+results[0].insertId}});
    res.writeHead(302, {
             'Location': '/product/my'
    });
    res.end();return false;
  });
});
app.get('/post', function(req, res){
  $arr.externalcss = ['datePicker'];
  $arr.externaljs = ['jquery.datePicker'];
  common.checkLogin(req,res,0);
  $arr.error = '';
  products.post(req, res, $arr);
});

app.get(['/my/','/my/:page'], function(req, res){
  $arr.error = '';
  common.checkLogin(req,res,0);
  req.body.page = (typeof(req.param('page')) !== 'undefined') ? req.param('page') : 0;
  q.all([products.myproducts(req,config.mysql,q,0),products.myproducts(req,config.mysql,q,1)]).then(function(results){ 
    //console.log(results[0]);
     console.log(2);
     $arr['projects'] = products.shortDescribe(results[0][0]);
     $arr['pagination'] = products.shortDescribe(results[1][0]).length;
     var pagination = require('pagination');
     var paginator = new pagination.SearchPaginator({prelink:'/product/my', current:  req.body.page, rowsPerPage: 15, totalResult: $arr['pagination']});

     $arr['pagination_html'] = paginator.render();
     common.tplFile('myprojects.tpl');
      common.headerSet(1);
     common.loadTemplateHeader(req,res,$arr);

    });
});



app.get(['/view/','/view/:id'], function(req, res){
  $arr.error = '';

  q.all(products.productDetail(req,config.mysql,q)).then(function(results){ 
    //console.log(results[0]);
      bids = require('../module/bid');
      var dateFormat = require('dateformat');
      var date = require('date-utils');
       datenow = dateFormat(new Date(),"yyyy-mm-dd HH:MM:ss");
       prdt = results[0][0];
       closeddate = dateFormat(new Date(prdt['date_closed']),"yyyy-mm-dd HH:MM:ss");
       //console.log(Date.compare(closeddate,datenow)+'as');
      if((Date.compare(closeddate,datenow) <= 0) && prdt['market_status'] == 'open')
      {
          res.writeHead(302, {
             'Location': '/product/close/'+req.param('id')
         });
         res.end();return false;
      }
      q.all([bids.bidHistory(req,config.mysql,q,0),bids.bidHistory(req,config.mysql,q,1)]).then(function(results2){ 
           //console.log(results2[1][0][0]['bid']);
           $arr['bids'] = results2[0][0]; 
           $arr['bcnt'] = results2[1][0][0]['bid'];
           $arr['project'] = products.shortDescribe(results[0]); 
           
           $arr['projects'] = $arr['project'][0];
          
           common.tplFile('product.tpl');
           common.headerSet(1);
           common.loadTemplateHeader(req,res,$arr);
     });
    });
});
app.get(['/bid/','/bid/:id'], function(req, res){
  $arr.error = '';

  q.all(products.productDetail(req,config.mysql,q)).then(function(results){ 
      var dateFormat = require('dateformat');
      var date = require('date-utils');
      datenow = dateFormat(new Date(),"yyyy-mm-dd HH:MM:ss");
      prdt = results[0][0];
      closeddate = dateFormat(new Date(prdt['date_closed']),"yyyy-mm-dd HH:MM:ss");
       
      if((Date.compare(closeddate,datenow) <= 0 ) && prdt['market_status'] == 'open')
      {
          res.writeHead(302, {
             'Location': '/product/close/'+req.param('id')
         });
         res.end();return false;
      }
    //console.log(results[0]);
     $arr['project'] = products.shortDescribe(results[0]);     
     $arr['projects'] = $arr['project'][0];
     //console.log($arr['projects']);

     common.tplFile('bid.tpl');
     common.headerSet(1);
     common.loadTemplateHeader(req,res,$arr);

    });
});
app.get('/close/:id', function(req, res){
  var bids = require('../module/bid');
 
  var dateFormat = require('dateformat');
  var date = require('date-utils');
  datenow = dateFormat(new Date(),"yyyy-mm-dd HH:MM:ss");
  q.all([bids.selectAwardBid(req,config.mysql,q),products.productDetail(req,config.mysql,q)]).then(function(results){ 
    //console.log(results[0]);
     prdt = results[1][0][0];
     //console.log(prdt);
     closeddate = dateFormat(new Date(prdt['date_closed']),"yyyy-mm-dd HH:MM:ss");
       
     if((Date.compare(closeddate,datenow)<= 0 ) && prdt['market_status'] == 'open')
     {
         var bid = results[0][0][0];
         var pid = results[1][0][0];
  
         if(results[0][0].length > 0)
         {
            payments = require('../module/payment');
            bids.makeAwardBid(req,config.mysql,q,bid['id']);
            bids.releaseAmount(req,config.mysql,q,bid,pid);
            payments.transactionid = 0;
            payments.gateway = 'account';
            payments.sessionsdata = [];
            payments.sessionsdata.title = pid.title;
            payments.sessionsdata.email = bid.email;
            payments.sessionsdata.url = config.url+'/product/view/'+pid.id;
            payments.sessionsdata.userid = bid.user_id;
            payments.sessionsdata.first_name = bid.first_name;
            payments.sessionsdata.last_name = bid.last_name;
            payments.payid = req.param('id');
            payments.type = 'winner';
            payments.name = prdt.title;
            payments.amount = bid.proposed_amount+pid.shipping_price;
            payments.insertInvoice();
            payments.sessionsdata.userid = pid.user_id;
            payments.sessionsdata.email = pid.email;
            payments.sessionsdata.first_name = pid.first_name;
            payments.sessionsdata.last_name = pid.last_name;
            payments.type = 'sold';
            payments.insertInvoice();
            status = 'sold'
         } 
         else
         {
           status = 'closed';
         } 
         products.closeProject(req,config.mysql,q,status);
         res.writeHead(302, {
             'Location': '/product/view/'+req.param('id')
         });
         res.end();return false;
     } 
     //console.log($arr['projects']);
     else
     {
        res.writeHead(302, {
             'Location': '/product/view/'+req.param('id')
         });
         res.end();return false;
     } 

    });
});
app.post('/watchlist',function(req,res)
{
   var log = common.checkLoginajax(req,res,0);
   if(!log)
   {
     data = {access:false}
     common.ajaxjson(res,data);
   }
   else
   {
    q.all([products.isinWatchlist(req,config.mysql,q),products.productDetail(req,config.mysql,q)]).then(function(results)
    {  
       if(results[0][0].length > 0)
       {
         data = {access:true,isadded:true}
         common.ajaxjson(res,data);
   
       } 
       else
       {
        products.addWatchlist(req,config.mysql,q);
        customerio = require('../module/customerio');
        customerio.uid = req.session.userid;
        customerio.inits();
         
        customerio.createCustomer({email:req.session.email,user:{firstName:req.session.first_name,lastName:req.session.last_name}});
          
        customerio.sendEmail({event:'watchlist_added',content:{user:req.session.first_name+' '+req.session.last_name,title: results[1][0][0].title}});
      
        data = {access:true,isadded:false}
        common.ajaxjson(res,data);
   
       } 
    }); 
   } 
});
app.get('/buy/:id', function(req, res){
common.checkLogin(req,res,0);
  bids = require('../module/bid');
  user = require('../module/user');
  req.body.id = req.param('id');
   q.all([bids.maxcheckbidPlaced(req,config.mysql,q),products.productDetail(req,config.mysql,q),user.userInfo(req,config.mysql,q,req.session.userid,['balance','reserve_amount'])]).then(function(results){ 
     
    maxisthere = results[0][0].length;

      maxuid = 0;
      maxamt = 0;
      maxbid = [];
      if(maxisthere > 0)
      {
        maxbid = results[0][0][0];
        maxuid = maxbid.user_id;
        maxamt = maxbid.amt;
      }  
      
      prdt = results[1][0][0];
      req.body.title = prdt.title;
      if(maxuid == req.session.userid)
      {
        results[2][0][0]['reserve_amount'] = results[2][0][0]['reserve_amount'] - maxamt;
      }  
      var dateFormat = require('dateformat');
      var date = require('date-utils');
      results[1][0][0]['wsprice'] = results[1][0][0]['wprice']+results[1][0][0]['iprice'];
      datenow = dateFormat(new Date(),"yyyy-mm-dd HH:MM:ss");
      closeddate = dateFormat(new Date(prdt['date_closed']),"yyyy-mm-dd HH:MM:ss");
      maxamnt = (maxuid > 0 && maxuid == req.session.user_id) ?  maxamt : 0;
      req.body.placeamt =  config.perbid;
     if((Date.compare(closeddate,datenow) <= 0 ) && prdt['market_status'] == 'open')
     {
        res.writeHead(302, {
           'Location': '/product/close/'+req.param('id')
       });
       res.end();return false;
     }
     else if((results[2][0][0]['balance'] - results[2][0][0]['reserve_amount'])  < results[1][0][0]['bprice']+results[1][0][0]['shipping_price'])
    {
       req.session.page = config.url+'/product/buy/'+req.param('id')+'/';
       res.writeHead(302, {
             'Location': '/package'
         });
       res.end();return false;
    } 
    else
    {
          if(maxuid > 0)
           {
              req.body.bid = maxbid.id;
              req.body.buid = maxbid.user_id;
              req.body.amt = maxbid.amt+results[1][0][0]['shipping_price'];
              bids.reduceReserve(req,config.mysql,q); 
              bids.removeBidReserve(req,config.mysql,q);

           } 
            //var bid = results[0][0][0];
            console.log(results[1][0][0]);
            //res.end();return false;
            var pid = results[1][0][0];
            payments = require('../module/payment');
            bids.makeBought(req,config.mysql,q,parseFloat(pid.bprice,2)+parseFloat(results[1][0][0]['shipping_price'],2));
            bids.reduceBalance(req,config.mysql,q,parseFloat(pid.bprice,2)+parseFloat(results[1][0][0]['shipping_price'],2));
            payments.transactionid = 0;
            payments.gateway = 'account';
            payments.sessionsdata = [];
            payments.sessionsdata.title = pid.title;
            payments.sessionsdata.email = req.session.email;
            payments.sessionsdata.url = config.url+'/product/buy/'+pid.id;
            payments.sessionsdata.userid = req.session.userid;
            payments.sessionsdata.first_name = req.session.first_name;
            payments.sessionsdata.last_name = req.session.last_name;
            payments.payid = req.param('id');
            payments.type = 'bought';
            payments.name = prdt.title;
            payments.amount = pid.bprice+pid.shipping_price;
            payments.insertInvoice();
            payments.sessionsdata.userid = pid.user_id;
            payments.sessionsdata.email = pid.email;
            payments.sessionsdata.first_name = pid.first_name;
            payments.sessionsdata.last_name = pid.last_name;
            payments.type = 'sold';
            payments.insertInvoice();
            status = 'sold'
           products.closeProject(req,config.mysql,q,status);
           res.writeHead(302, {
             'Location': '/product/view/'+req.param('id')
         });
           res.end();return false;

    }  
   });
});

app.post('/confirm/', function(req, res){
if(!common.checkLoginajax(req,res,0))
{
$arr['location'] = '/login';
res.status(200).send({'arr': $arr}); 
return false; 
}
  bids = require('../module/bid');
  user = require('../module/user');

req.body.user_Id = '';
  
  if(typeof(req.body.autobidUserId) !='undefined' &&  req.body.autobidUserId > 0)
  req.body.user_Id = req.body.autobidUserId;
  else
  req.body.user_Id = req.session.userid;
  
  

  
  
  q.all([bids.maxcheckbidPlaced(req,config.mysql,q),products.productDetail(req,config.mysql,q),user.userInfo(req,config.mysql,q,req.body.user_Id,['balance','reserve_amount','first_name','last_name'])]).then(function(results){ 
      maxisthere = results[0][0].length;

      maxuid = 0;
      maxamt = 0;
      maxbid = [];
      if(maxisthere > 0)
      {
        maxbid = results[0][0][0];
        maxuid = maxbid.user_id;
        maxamt = maxbid.amt;
      }  
      
      prdt = results[1][0][0];
      req.body.title = prdt.title;
      if(maxuid == req.body.user_Id)
      {
        results[2][0][0]['reserve_amount'] = results[2][0][0]['reserve_amount'] - maxamt;
      }   
      var dateFormat = require('dateformat');
      var date = require('date-utils');
      results[1][0][0]['wsprice'] = results[1][0][0]['wprice']+results[1][0][0]['iprice'];
      datenow = dateFormat(new Date(),"yyyy-mm-dd HH:MM:ss");
      closeddate = dateFormat(new Date(prdt['date_closed']),"yyyy-mm-dd HH:MM:ss");
      maxamnt = (maxuid > 0 && maxuid == req.session.user_id) ?  maxamt : 0;
      req.body.placeamt =  config.perbid;
     if((Date.compare(closeddate,datenow) <= 0 ) && prdt['market_status'] == 'open')
     {
		 
		 $arr['location'] = '/product/close/'+req.param('id');
		 res.status(200).send({'arr': $arr}); 
		 return false; 
       /* res.writeHead(302, {
           'Location': '/product/close/'+req.param('id')

       });*/
      // res.end();return false;

     }
    else if((results[2][0][0]['balance'] - results[2][0][0]['reserve_amount'] - req.body.wsprice - config.perbid)  < parseFloat(results[1][0][0]['wsprice'],2)+parseFloat(results[1][0][0]['shipping_price'],2))
    {
        req.session.page = config.url+'/product/confirm/'+req.param('id')+'/'+req.param('wsprice');
	    $arr['location'] = '/package';
		res.status(200).send({'arr': $arr}); 
		return false; 
      /* res.writeHead(302, {
             'Location': '/package'
         });
*/

      //   res.end();return false;

    }  
    else if(results[1][0][0]['wprice'] < req.body.wsprice)
    {
        update = 0;  
        
         q.all(bids.placeBid(req,config.mysql,q,1)).then(function(resbid) {   
            //console.log(resbid[0]);  
            req.body.placebid = resbid[0].insertId;
           if(maxuid > 0)
           {
              req.body.bid = maxbid.id;
              req.body.buid = maxbid.user_id;
              req.body.amt = parseFloat(maxbid.amt,2)+parseFloat(results[1][0][0]['shipping_price'],2);
              console.log(req.body.amt);
              bids.reduceReserve(req,config.mysql,q); 
              bids.removeBidReserve(req,config.mysql,q);
           } 
           customerio = require('../module/customerio');
           customerio.uid = req.body.user_Id;
           customerio.inits();
           
           customerio.createCustomer({email:req.session.email,user:{firstName:results[2][0][0]['first_name'],lastName:results[2][0][0]['last_name']}});
            
           customerio.sendEmail({event:'bid_submitted',content:{user:results[2][0][0]['first_name']+' '+results[2][0][0]['last_name'],title: prdt.title,amount : req.body.wsprice}});
           req.body.wssprice = parseFloat(req.body.wsprice,2)+parseFloat(results[1][0][0]['shipping_price'],2);
           console.log(req.body.wssprice);
           bids.addReserve(req,config.mysql,q);         
           bids.updateBid(req,config.mysql,q);
           bids.reducePoint(req,config.mysql,q);
		   
	   
	   
	   
	   
       bids = require('../module/bid');
	   
       q.all([bids.bidHistory(req,config.mysql,q,0),bids.bidHistory(req,config.mysql,q,1)]).then(function(results2){ 
           //console.log(results2[1][0][0]['bid']);
           $arr['bids'] = results2[0][0]; 
           $arr['bcnt'] = results2[1][0][0]['bid'];
           $arr['project'] = products.shortDescribe(results[0]); 
           
           $arr['projects'] = $arr['project'][0];
		 
		 if(typeof(req.body.autobidUserId) !='undefined' &&  req.body.autobidUserId > 0)
		 {
			// console.log('kkkkkkkkkkkkkkkk');
	     products.updateAutobid(req,config.mysql,q);
		 }
	     
		q.all([products.autobidTopper(req,config.mysql,q),products.autobidSecMax(req,config.mysql,q)]).then(function(results3){   
		  $arr['topBdderExist'] = results3[0][0].length;
		 // console.log( $arr['topBdderExist'] );
		 // console.log(22222222222222);
		  
		  console.log(maxuid);
		  console.log(req.body.user_Id);
		  // console.log(parseFloat(req.body.wsprice));
		  // console.log(parseFloat(parseFloat(0.01)));
		  
		  $arr['secodmax'] =  $arr['topper'] = [];
		  if(results3[0][0].length > 0)
		  {		  
		  $arr['topper'] =  results3[0][0][0];		  
		 if(typeof(req.body.autobidUserId) !='undefined' || maxuid == req.body.user_Id)
		  {	
		    $arr['topBdderExist'] =	 0;
		  }
		  $arr['topper']['bidamount'] = parseFloat(req.body.wsprice,2) + 0.01;
		  $arr['topper']['reduceAmt'] = 0.01;
		  console.log(results3[1][0].length);
		  if(results3[1][0].length > 0)
		  {
		  console.log($arr['topper']['bidamount']);
		  $arr['secodmax'] =  results3[1][0][0];
		  $arr['topper']['bidamount'] = parseFloat(req.body.wsprice,2) + parseFloat($arr['secodmax'].balance,2) +0.01;
		  $arr['topper']['reduceAmt'] = parseFloat($arr['secodmax'].balance,2) +0.01;
		  }
		  
		  }
		  
          $arr['location'] = '/product/view/'+req.param('id');
		  res.status(200).send({'arr': $arr}); 
		  return false;     
		  
		});
          /* common.tplFile('product_ajax.tpl');
           common.headerSet(0); 
           common.loadTemplateHeader(req,res,$arr,0);*/
           });
          
	
	
          /* res.writeHead(302, {
               'Location': '/product/view/'+req.param('id')
           });
 */  

          //res.end();return false;    

       });
      
    }
    else
    {
      q.all(bids.placeBid(req,config.mysql,q,1)).then(function(resbid) {  
       req.body.placebid = resbid[0].insertId; 
          bids.reducePoint(req,config.mysql,q);
          customerio.uid = req.body.user_Id;
              customerio.inits();
             
              customerio.createCustomer({email:req.session.email,user:{firstName:results[2][0][0]['first_name'],lastName:results[2][0][0]['last_name']}});
              
              customerio.sendEmail({event:'bid_submitted',content:{user:results[2][0][0]['first_name']+' '+results[2][0][0]['last_name'],title: prdt.title,amount : req.body.wsprice}});
          $arr['location'] = '/product/view/'+req.param('id');
		  res.status(200).send({'arr': $arr}); 
		  return false; 
         /* res.writeHead(302, {
                 'Location': '/product/view/'+req.param('id')
           });
*/

         // res.end();return false;

      });  
    }  
  });
});
app.get('/confirm/:id/:wsprice', function(req, res){
  $arr.error = '';
 if(!common.checkLoginajax(req,res,0))
{
$arr['location'] = '/login';
res.status(200).send({'arr': $arr}); 
return false; 
}
  bids = require('../module/bid');
  user = require('../module/user');
  
  if(typeof(req.body.autobidUserId) !='undefined' &&  req.body.autobidUserId > 0)
  req.body.user_Id = req.body.autobidUserId;
  else
  req.body.user_Id = req.session.userid;
  
  req.body.id = req.param('id');
  req.body.wsprice = req.param('wsprice');
   q.all([bids.maxcheckbidPlaced(req,config.mysql,q),products.productDetail(req,config.mysql,q),user.userInfo(req,config.mysql,q,req.session.userid,['balance','reserve_amount'])]).then(function(results){ 
      maxisthere = results[0][0].length;
      maxuid = 0;
      maxamt = 0;
      maxbid = [];
      if(maxisthere > 0)
      {
        maxbid = results[0][0][0];
        maxuid = maxbid.user_id;
        maxamt = maxbid.amt;
      }  
      
      prdt = results[1][0][0];
      req.body.title = prdt.title;
      req.body.placeamt =  config.perbid;
      if(maxuid == req.session.userid)
      {
        results[2][0][0]['reserve_amount'] = results[2][0][0]['reserve_amount'] - maxamt;
      }  
      var dateFormat = require('dateformat');
      var date = require('date-utils');
      datenow = dateFormat(new Date(),"yyyy-mm-dd HH:MM:ss");
      closeddate = dateFormat(new Date(prdt['date_closed']),"yyyy-mm-dd HH:MM:ss");
      maxamnt = (maxuid > 0 && maxuid == req.session.user_id) ?  maxamt : 0;
      results[1][0][0]['wsprice'] = results[1][0][0]['wprice']+results[1][0][0]['iprice'];
     if((Date.compare(closeddate,datenow) <= 0 ) && prdt['market_status'] == 'open')
     {
		 $arr['location'] = '/product/close/'+req.param('id');
		 res.status(200).send({'arr': $arr}); 
		 return false; 
       /* res.writeHead(302, {
           'Location': '/product/close/'+req.param('id')
       });
*/

      // res.end();return false;

     }
     else if((results[2][0][0]['balance'] - results[2][0][0]['reserve_amount'] - req.body.wsprice - config.perbid)  < parseFloat(results[1][0][0]['wsprice'],2)+parseFloat(results[1][0][0]['shipping_price'],2))
     {
       req.session.page = config.url+'/product/confirm/'+req.param('id')+'/'+req.param('wsprice');
	   $arr['location'] = '/package';
		res.status(200).send({'arr': $arr}); 
		return false; 
       /*res.writeHead(302, {
             'Location': '/package'
         });
*/

        // res.end();return false;

     }  
     else if(results[1][0][0]['wprice'] < req.body.wsprice)
     {
        update = 0;  
        
        q.all(bids.placeBid(req,config.mysql,q,1)).then(function(resbid) { 
        req.body.placebid = resbid[0].insertId;
         if(maxuid > 0)
         {
          req.body.bid = maxbid.id;
          req.body.buid = maxbid.user_id;
          req.body.amt = parseFloat(maxbid.amt,2)+parseFloat(results[1][0][0]['shipping_price'],2);
          bids.reduceReserve(req,config.mysql,q); 
          bids.removeBidReserve(req,config.mysql,q);
         } 
         req.body.wssprice = parseFloat(req.body.wsprice,2)+parseFloat(results[1][0][0]['shipping_price'],2);
         bids.addReserve(req,config.mysql,q);         
         bids.updateBid(req,config.mysql,q);
         bids.reducePoint(req,config.mysql,q);
          customerio = require('../module/customerio');
          customerio.uid = req.session.userid;
          customerio.inits();
         
          customerio.createCustomer({email:req.session.email,user:{firstName:req.session.first_name,lastName:req.session.last_name}});
          
          customerio.sendEmail({event:'bid_submitted',content:{user:req.session.first_name+' '+req.session.last_name,title: prdt.title,amount : req.body.wsprice}});
         /* res.writeHead(302, {
                   'Location': '/product/my'
          });*/
        //  res.end();return false;
		  $arr['location'] = '/product/view/'+req.param('id');
	      res.status(200).send({'arr': $arr}); 
		  return false; 
         /*res.writeHead(302, {
             'Location': '/product/view/'+req.param('id')
         });
 */
        // res.end();return false;    

        });
     }
     else
     {
         q.all(bids.placeBid(req,config.mysql,q,1)).then(function(resbid) { 
           req.body.placebid = resbid[0].insertId;
                bids.reducePoint(req,config.mysql,q);
                customerio = require('../module/customerio');
                customerio.uid = req.session.userid;
                customerio.inits();
               
                customerio.createCustomer({email:req.session.email,user:{firstName:req.session.first_name,lastName:req.session.last_name}});
                
                customerio.sendEmail({event:'bid_submitted',content:{user:req.session.first_name+' '+req.session.last_name,title: prdt.title,amount : req.body.wsprice}});
				$arr['location'] = '/product/view/'+req.param('id');
	            res.status(200).send({'arr': $arr}); 
				return false; 
           /* res.writeHead(302, {
                   'Location': '/product/view/'+req.param('id')
             });
*/

           // res.end();return false;

          });
    }  
  });
});


app.get(['/remove/','/remove/:id'], function(req, res){
  $arr.error = '';
  common.checkLogin(req,res,0);
  req.body.id = (typeof(req.param('id')) !== 'undefined') ? req.param('id') : 0;
  q.all(products.projectDetails(req,config.mysql,q,['user_id'],req.body.id)).then(function(results){
	  
	 // console.log(results[0][0]['user_id']) 
	 
	 if(req.session.userid ==  results[0][0]['user_id'])
	 {
		 products.removeProject(req,config.mysql,q,req.body.id);
	 }
	  
	   res.writeHead(302, {
             'Location': '/product/my'
         });
		 
		 res.end();return false;
	  
	  });
});
module.exports = app;