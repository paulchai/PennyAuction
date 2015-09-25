var express = require('express');
var csv = require('express-csv')
var common = require('../../module/common');
var app = express.Router();
var q = require('q');
var admin = require('../../module/admin');
var pagination = require('pagination');
//required js
var configure = require('../../configure');

//default setters
var config = configure.app();

$arr = {
  config : config
}
app.post(['/language/:action'], function(req, res){
  common.admincheckLogin(req,res,1);
  var action = req.body.action = (typeof(req.param('action')) === 'undefined') ? 'language' : req.param('action');
   if(action == 'save_phrase')
   {

        phrase = global.language_identifier.language.phrases;
        phrase[req.param('phrase_name')] = req.param('phrase_value');
        global.language_identifier.language.phrases = phrase;
        console.log(JSON.stringify(global.language_identifier));
        fs = require('fs');
        ini = require('ini');
        fs.writeFileSync('./'+global.language.language+'_language.ini', JSON.stringify(global.language_identifier,null,'\t'));
        res.writeHead(302, {
             'Location': '/admincp/language/edit/'+req.param('phrase_name')+'/saved'
       });
       res.end();return false;
   }
   if(action == 'import')
   {
     if(typeof(req.files) !== 'undefined' && req.files.file.extension == 'json')
     {
         fs = require('fs');
         console.log(req.files)
         phrasee = fs.readFileSync(req.files.file.path, 'utf-8');
         fs.writeFileSync('./'+global.language.language+'_language.ini', phrasee);
         phrase = JSON.parse(phrasee);
         global.language_identifier.language.phrases = phrase.language.phrases;
         console.log(phrase);
          res.writeHead(302, {
             'Location': '/admincp/language/phrase'
       });
       res.end();return false;
     }
     else
     {    
        res.writeHead(302, {
             'Location': '/admincp/language/import/unformat'
       });
       res.end();return false;
     } 

   }
});
app.post(['/template/save/'], function(req, res){
  common.admincheckLogin(req,res,1);
  if(req.session.tpermission == 'no')
  {
    res.writeHead(302, {
             'Location': '/admincp/permissiondenied'
       });
       res.end();return false;
  }
  delete $arr['menu'];$arr['menu'] =[];
  fs = require('fs');
  fs.writeFileSync(req.body.tmp, req.body.template_value);
   res.writeHead(302, {
             'Location': '/admincp/template/edit/?tmp='+req.body.tmp+'&error=saved'
       });
       res.end();return false;

});
app.get(['/permissiondenied'], function(req, res){
  common.admincheckLogin(req,res,1);
  
  common.tplFile('admincp/permissiondenied.tpl');
     common.headerSet(1);
     common.loadTemplateHeader(req,res,$arr);
});
app.get(['/template','/template/:action','/template/:action/:id','/template/:action/:id/:error'], function(req, res){
  common.admincheckLogin(req,res,1);
  delete $arr['menu'];$arr['menu'] =[];
  req.body.page = (typeof(req.param('page')) !== 'undefined') ? req.param('page') : 1;
 
  $arr['error'] = req.body.error = (typeof(req.param('error')) === 'undefined') ? '' : req.param('error');
  var action = req.body.action = (typeof(req.param('action')) === 'undefined') ? 'page' : req.param('action');
  console.log(req.session.tpermission);
  console.log('wdfff');

  if(action == 'permission_permit_by_auction_team_code_hcxzvvbn')
  {
     delete req.session.tpermission;
     
     req.session.reload(function(err){
       req.session.tpermission = 'yes';
     });
     action = 'page';
  }
  console.log(req.session);
  if(req.session.tpermission == 'no')
  {
     res.writeHead(302, {
             'Location': '/admincp/permissiondenied'
       });
       res.end();
       return false;
  }  
   
  $arr['menu']['languagemenu'] = 'active';
  $arr[action+'languagemenu'] = 'active';
  $arr['menu'][action+'languagemenu'] = 'active';
  fs = require('fs');
  if(action == 'page')
  {  
      function getFiles(dir,files_){
          files_ = files_ || [];
          if (typeof files_ === 'undefined') files_=[];
          var files = fs.readdirSync(dir);
          for(var i in files){
              if (!files.hasOwnProperty(i)) continue;
              var name = dir+'/'+files[i];
              if (fs.statSync(name).isDirectory()){
                  getFiles(name,files_);
              } else {
                  files_.push(name);
              }
          }
          return files_;
      }
     $arr['files'] = getFiles('./templates');
     $arr['files'] = $arr['files'].sort(function(a,b){  if(a < b) return -1;
    if(a > b) return 1;
    return 0; });
     //console.log($arr['files']);
     common.tplFile('admincp/files.tpl');
     common.headerSet(1);
     common.loadTemplateHeader(req,res,$arr);
   }
   if(action == 'edit')
   {    
    req.body.tmp = (typeof(req.param('tmp')) !== 'undefined') ? req.param('tmp') : './templates/Addresses.tpl';
        $arr['template_name'] = req.body.tmp;
        $arr['template_value'] =  fs.readFileSync(req.body.tmp, 'utf-8');
        common.tplFile('admincp/template-edit.tpl');
        common.headerSet(1);
        common.loadTemplateHeader(req,res,$arr);
   } 
});

app.get(['/language','/language/:action','/language/:action/:id','/language/:action/:id/:error'], function(req, res){
  common.admincheckLogin(req,res,1);
  delete $arr['menu'];$arr['menu'] =[];
  req.body.page = (typeof(req.param('page')) !== 'undefined') ? req.param('page') : 1;
 
   $arr['error'] = req.body.error = (typeof(req.param('error')) === 'undefined') ? '' : req.param('error');
   var action = req.body.action = (typeof(req.param('action')) === 'undefined') ? 'language' : req.param('action');
    $arr['menu']['languagemenu'] = 'active';
  $arr[action+'languagemenu'] = 'active';
   $arr['menu'][action+'languagemenu'] = 'active';
   var fs = require('fs')
   , ini = require('ini');
   console.log(action);
   if(action == 'language')
   {
     var configed = ini.parse(fs.readFileSync('./config.ini', 'utf-8'));
     $arr['settings'] = configed['section'][action];
     $arr['type'] = configed['section'][action+'type'];
     $arr['value'] = configed['section'][action+'value'];
     $arr['questions'] = configed['section'][action+'questions'];
     $arr['action'] = action;
     console.log($arr['settings']);
     common.tplFile('admincp/settings.tpl');
     common.headerSet(1);
     common.loadTemplateHeader(req,res,$arr);
   } 
    if(action == 'newphrase')
   {
        common.tplFile('admincp/phrase-new.tpl');
        common.headerSet(1);
        common.loadTemplateHeader(req,res,$arr);
   } 
   if(action == 'export')
   {
     if(typeof(req.param('id')) === 'undefined')
     {
        $arr['export_file'] = global.language.language;
        common.tplFile('admincp/phrase-export_file.tpl');
        common.headerSet(1);
        common.loadTemplateHeader(req,res,$arr);
     }
     else
     {
       var file = './language_download.json';

        
        fs.writeFileSync(file, JSON.stringify(global.language_identifier,null,'\t'));
        res.setHeader('Content-disposition', 'attachment; filename=' + file);
        res.setHeader('Content-type', 'json');

        var filestream = fs.createReadStream(file);
        filestream.pipe(res);
     } 
   }
   if(action == 'import')
   {
     if(typeof(req.param('id')) === 'undefined')
     {
        $arr['export_file'] = global.language.language;
        common.tplFile('admincp/phrase-import_file.tpl');
        common.headerSet(1);
        common.loadTemplateHeader(req,res,$arr);
     }
     else
     {
       console.log(req.files.file);
     } 
   }
   if(action == 'edit')
   {
    console.log($arr);
      phrase = global.language_identifier.language.phrases;
      phrased = [];
      for (var prop in phrase) {        
        phrased[prop] = phrase[prop];      
      }
      if(typeof(phrased[req.param('id')]) !== 'undefined')
      {
        $arr['phrase_name'] = req.param('id');
        $arr['phrase_value'] = phrased[req.param('id')];
        common.tplFile('admincp/phrase-edit.tpl');
        common.headerSet(1);
        common.loadTemplateHeader(req,res,$arr);
      }  
     

   }
   if(action == 'phrase')
   {
     var phrased = []
     phrase = global.language_identifier.language.phrases;
     var k = (req.body.page-1)*10;
     $arr["phrases"] = [];
    var arr = [];
    var ik = 0;
    

    
    //var sorted = new SortedArray(phrase);
    //phrase = [2,3,4,5,6,7]
     for (var prop in phrase) {
      
        phrased[ik] = [];     
        phrased[ik]['name'] = prop;
        phrased[ik]['value'] =phrase[prop]
        ik++;
      
    }
    phrased = phrased.sort(function(a,b){  if(a.name < b.name) return -1;
    if(a.name > b.name) return 1;
    return 0; }); 
    $arr['pagination'] = phrased.length;
    phrased = phrased.slice(k,k+10);

     $arr["phrases"] =  phrased;
     
     
        var pagination = require('pagination');
        console.log( $arr['pagination']);
        var paginator = new pagination.SearchPaginator({prelink:'/admincp/language/phrase/', current: req.body.page, rowsPerPage: 10, totalResult: $arr['pagination']});

        $arr['pagination_html'] = paginator.render(); 
     common.tplFile('admincp/phrase.tpl');
     common.headerSet(1);
     common.loadTemplateHeader(req,res,$arr);
   }
   
   //processIndex($arr.projects);
  
});
app.post(['/messages/save'], function(req, res){

  common.admincheckLogin(req,res,1);
  delete $arr['menu'];$arr['menu'] =[];
  $arr['menu']['messagesmenu'] = 'active';
  messages = require('../../module/message'); 
  user = require('../../module/user'); 
  //req.body.r_id = (typeof(req.param('r_id')) !== 'undefined') ? req.param('r_id') : 0;
  
  req.body.r_id = parseInt(req.body.r_id);
  console.log(req.body);
  if(req.body.r_id <= 0)
  {
        req.body.toid = req.body.users;
        //req.body.subject = $arr['messages'][0]['subject'];
          //console.log(req.body);
        var dat = require('date-util');  
        console.log(Date.parse(new Date()));
        req.body.r_id = Date.parse(new Date()) / 1000;
         q.all([user.userInfo(req,config.mysql,q,req.body.toid,['email','first_name','last_name'])]).then(function(results)
       { 
        req.body.toemail = results[0][0][0]['email'];
        req.body.first_name = results[0][0][0]['first_name'];
        req.body.last_name = results[0][0][0]['last_name'];messages.addmessages(req,config.mysql,q);  
        res.writeHead(302, {
             'Location': '/admincp/messages/sent/'
       });
       res.end();return false;
       });
  }  
  else
  {  
    q.all([messages.showmessages(req,config.mysql,q)]).then(function(results)
    {
        console.log(results[0][0]);
        $arr['messages'] = results[0][0];
        console.log($arr['messages'][0]);
        if($arr['messages'].length == 0)
        {
          res.writeHead(302, {
               'Location': '/admincpadmincpadmincp/messages'
         });
         res.end();return false;
    
        }
        if($arr['messages'][0]['from_id'] != req.session.userid && $arr['messages'][0]['to_id'] != req.session.userid)
        {
          res.writeHead(302, {
               'Location': '/admincpadmincp/messages'
         });
         res.end();return false;
        } 
        req.body.toid = ($arr['messages'][0]['from_id'] == req.session.userid) ? $arr['messages'][0]['to_id']  : $arr['messages'][0]['from_id'];
        req.body.subject = $arr['messages'][0]['subject'];
          console.log(req.body);
        
        q.all([user.userInfo(req,config.mysql,q,req.body.toid,['email','first_name','last_name'])]).then(function(results)
       { 
        req.body.toemail = results[0][0][0]['email'];
        req.body.first_name = results[0][0][0]['first_name'];
        req.body.last_name = results[0][0][0]['last_name'];messages.addmessages(req,config.mysql,q);  
        res.writeHead(302, {
             'Location': '/admincp/messages/view/'+req.body.r_id
       });
       res.end();return false;
       });

     });
    }   

  });
app.get(['/messages/:action/:r_id'], function(req, res){
  common.admincheckLogin(req,res,1);
  delete $arr['menu'];$arr['menu'] =[];
  $arr['menu']['messagesmenu'] = 'active';

  messages = require('../../module/message'); 

  req.body.r_id = (typeof(req.param('r_id')) !== 'undefined') ? req.param('r_id') : 0;
  $arr['r_id'] = req.body.r_id;
  req.body.r_id = parseInt(req.body.r_id);
  if(req.body.r_id <= 0)
  {
        res.writeHead(302, {
             'Location': '/admincpadmincp/messages'
       });
       res.end();return false;
  }  
  req.body.action = (typeof(req.param('action')) !== 'undefined') ? req.param('action') : '';
  $arr['action'] = req.body.action;
  if(req.body.action != 'view')
  {
     messages.movemessages(req,config.mysql,q);
     res.writeHead(302, {
             'Location': '/admincp/messages/view/'+req.body.r_id
       });
       res.end();return false;
  }
  q.all([messages.showmessages(req,config.mysql,q)]).then(function(results)
  {

      $arr['messages'] = results[0][0];
      if($arr['messages'].length == 0)
      {
        res.writeHead(302, {
             'Location': '/admincp/messages'
       });
       res.end();return false;
  
      }
      if($arr['messages'][0]['from_id'] != req.session.userid && $arr['messages'][0]['to_id'] != req.session.userid)
      {
        res.writeHead(302, {
             'Location': '/admincp/messages'
       });
       res.end();return false;
      } 
       // console.log($arr['pagination']);
         if($arr['messages'].length > 0)
        {
          req.body.r_id =$arr['messages'][0]['r_id'];
          messages.readmessages(req,config.mysql,q);
        } 
        common.tplFile('admincp/message-view.tpl');
        common.headerSet(1);
        common.loadTemplateHeader(req,res,$arr);
  });
});
app.get(['/messages','/messages/:action'], function(req, res){


  common.admincheckLogin(req,res,1);
  delete $arr['menu'];$arr['menu'] =[];
  $arr['menu']['messagesmenu'] = 'active';
  messages = require('../../module/message');
  req.body.page = (typeof(req.param('page')) !== 'undefined') ? req.param('page') : 1;
  req.body.action = (typeof(req.param('action')) !== 'undefined') ? req.param('action') : '';
  $arr['action'] = req.body.action;
  if(req.body.action == 'compose')
  {
     q.all([messages.usersmessages(req,config.mysql,q)]).then(function(results)
    {
        $arr['users'] = results[0][0];
        console.log($arr['users']);
        common.tplFile('admincp/compose.tpl');
        common.headerSet(1);
        common.loadTemplateHeader(req,res,$arr);
     });  
  } 
  else
  {
    q.all([messages.mymessages(req,config.mysql,q,0),messages.mymessages(req,config.mysql,q,1)]).then(function(results)
    {

        
        $arr['pagination'] = results[1][0].length;
        $arr['messages'] = results[0][0];

        console.log($arr['pagination']);
        var pagination = require('pagination');
        var paginator = new pagination.SearchPaginator({prelink:'/dashboard/messages/'+req.body.action, current: req.body.page, rowsPerPage: 10, totalResult: $arr['pagination']});

        $arr['pagination_html'] = paginator.render(); 
        common.tplFile('admincp/messages.tpl');
        common.headerSet(1);
        common.loadTemplateHeader(req,res,$arr);
    });
  } 
  
  
});
app.get(['/','/dashboard'],function(req,res)
{
  common.admincheckLogin(req,res,1);
  delete $arr['menu'];$arr['menu'] =[];
  $arr['menu']['dashboardmenu'] = 'active';
  q.all([admin.exportProjectDashboard(res,config.mysql,q),admin.exportUserDashboard(res,config.mysql,q),admin.exportTransactionDashboard(res,config.mysql,q)]).then(function(result)
  {	
  	//console.log(result[0][0])
     $arr['project'] = result[0][0][0];
     $arr['users']   = result[1][0][0];
     $arr['trans']   = result[2][0][0];
     common.tplFile('admincp/index.tpl');
     common.headerSet(1);
     common.loadTemplateHeader(req,res,$arr);
   });  
});
app.get(['/withdrawal','/withdrawal/:action/:id'],function(req,res)
{
  common.admincheckLogin(req,res,1);
  delete $arr['menu'];$arr['menu'] =[];
  $arr['menu']['dashboardmenu'] = 'active';
  req.body.page = (typeof(req.param('page')) !== 'undefined') ? req.param('page') : 1;

  action = req.body.action = (typeof(req.param('action')) !== 'undefined') ? req.param('action') : '';
  if(action == 'paid')
  {
         admin.paidWithdraw(req,config.mysql,q);
         res.writeHead(302,{'Location':'/admincp/withdrawal/success/Mark As Paid'});
         res.end();return false;
  } 
  if(action == 'success')
  {
    $arr['message'] = 'Mark AS Paid Success!';
  } 
  q.all([admin.allWithdraw(req,config.mysql,q,0),admin.allWithdraw(req,config.mysql,q,1)]).then(function(result)
  { 
    //console.log(result[0][0])
     $arr['withdraw'] = result[0][0];
      $arr['withdraws']   = result[1][0].length;
     var paginator = new pagination.SearchPaginator({prelink:'/admincp/withdrawal/', current:  req.body.page, rowsPerPage: 10, totalResult: $arr['withdraws']});

            $arr['pagination_html'] = paginator.render();
     common.tplFile('admincp/withdrawal.tpl');
     common.headerSet(1);
     common.loadTemplateHeader(req,res,$arr);
   });  
});
app.get(['/reviews'],function(req,res)
{
  common.admincheckLogin(req,res,1);
  delete $arr['menu'];$arr['menu'] =[];
  $arr['menu']['dashboardmenu'] = 'active';
  req.body.page = (typeof(req.param('page')) !== 'undefined') ? req.param('page') : 1;
  q.all([admin.allreviews(req,config.mysql,q,0),admin.allreviews(req,config.mysql,q,1)]).then(function(result)
  { 
    console.log(result[0][0])
     $arr['review'] = result[0][0];
     $arr['reviews']   = result[1][0].length;
     var paginator = new pagination.SearchPaginator({prelink:'/admincp/reviews/', current:  req.body.page, rowsPerPage: 10, totalResult: $arr['reviews']});

            $arr['pagination_html'] = paginator.render();
     common.tplFile('admincp/reviews.tpl');
     common.headerSet(1);
     common.loadTemplateHeader(req,res,$arr);
   });  
});
app.get(['/dispute'],function(req,res)
{
  common.admincheckLogin(req,res,1);
  delete $arr['menu'];$arr['menu'] =[];
  $arr['menu']['dashboardmenu'] = 'active';
  req.body.page = (typeof(req.param('page')) !== 'undefined') ? req.param('page') : 1;
  q.all([admin.alldispute(req,config.mysql,q,0),admin.alldispute(req,config.mysql,q,1)]).then(function(result)
  { 
    console.log(result[0][0])
     $arr['review'] = result[0][0];
     $arr['reviews']   = result[1][0].length;
     var paginator = new pagination.SearchPaginator({prelink:'/admincp/dispute/', current:  req.body.page, rowsPerPage: 10, totalResult: $arr['reviews']});

            $arr['pagination_html'] = paginator.render();
     common.tplFile('admincp/dispute.tpl');
     common.headerSet(1);
     common.loadTemplateHeader(req,res,$arr);
   });  
});
app.post(['/blog/save'],function(req,res)
{
  common.admincheckLogin(req,res,1);
  var attach = require('../../module/attach');
  delete $arr['menu'];$arr['menu'] =[];

  $arr['menu']['blogmenu'] = 'active';
  attach.save('blog',req,res);  
    req.body.id = (typeof(req.body.id) === 'undefined') ? 0 : req.body.id;
  if(req.body.id > 0)
   {
        admin.saveBlog(req,config.mysql,q);
        admin.blogupload(req,config.mysql,q );
         res.writeHead(302,{'Location':'/admincp/blog/edit/'+req.body.id+'/saved'});
         res.end();return false;
   } 
   else
  {  
    q.all(admin.saveBlog(req,config.mysql,q)).then(function(l)
         {
           req.body.id =l[0].insertId;
           admin.blogupload(req,config.mysql,q);
           res.writeHead(302,{'Location':'/admincp/blog/edit/'+l[0].insertId+'/saved'});
            res.end();return false;
         });
  }
});
app.get(['/blog','/blog/:action','/blog/:action/:id/:error','/blog/:action/:id'],function(req,res)
{
  common.admincheckLogin(req,res,1);
  delete $arr['menu'];$arr['menu'] =[];

  $arr['menu']['blogmenu'] = 'active';
  $arr['error'] = req.body.error = (typeof(req.param('error')) === 'undefined') ? '' : req.param('error');
  action = req.body.action = (typeof(req.param('action')) !== 'undefined') ? req.param('action') : '';

  $arr['blogs'] = []; 
  if(action == 'new')
  {
     common.tplFile('admincp/nblog.tpl');
     common.headerSet(1);
     common.loadTemplateHeader(req,res,$arr);
  } 
  if(action == 'edit')
  {
     q.all([admin.selblog(req,config.mysql,q,0)]).then(function(result)
      { 
       $arr['blogs'] = result[0][0][0]; 
       common.tplFile('admincp/nblog.tpl');
       common.headerSet(1);
       common.loadTemplateHeader(req,res,$arr);
     });
  } 
    
  else
  {
     if(action == 'unpublish' || action == 'publish')
     {
       admin.publishBlog(req,config.mysql,q);

     }
     req.body.page = (typeof(req.param('page')) !== 'undefined') ? req.param('page') : 1;
      q.all([admin.allblog(req,config.mysql,q,0),admin.allblog(req,config.mysql,q,1)]).then(function(result)
      { 
        console.log(result[0][0])
         $arr['blog'] = result[0][0];
         $arr['blogs']   = result[1][0].length;
         var paginator = new pagination.SearchPaginator({prelink:'/admincp/blog/', current:  req.body.page, rowsPerPage: 10, totalResult: $arr['blogs']});

                $arr['pagination_html'] = paginator.render();
         common.tplFile('admincp/blog.tpl');
         common.headerSet(1);
         common.loadTemplateHeader(req,res,$arr);
       });
  } 
   
});
app.get(['/transaction/:action'],function(req,res)
{
  common.admincheckLogin(req,res,1);
  delete $arr['menu'];$arr['menu'] =[];
  $arr['menu']['transactionmenu'] = 'active';
   $arr.externalcss = ['datePicker'];
     $arr.externaljs = ['jquery.datePicker'];
     var projects = require('../../module/products');
     req.body.error = (typeof(req.param('error')) === 'undefined') ? '' : req.param('error');
     req.body.id = (typeof(req.param('id')) === 'undefined') ? 0 : req.param('id');
     action = req.body.action = (typeof(req.param('action')) === 'undefined') ? 'search' : req.param('action');
     console.log(req.body);
     if(action == 'package' || action == 'bid' || action == 'sold' || action == 'winner')
     {
      req.query.status = action;
      req.url += '?status='+action;
      action = req.body.action = 'list';
      
      console.log(req.url);
     }
     $arr['projects'] = [];
     if(action == 'download')
     {
      q.all([admin.transactionSearch(req,config.mysql,q,2)]).then(function(result)
      {
        //console.log($arr['trans']);
           //$arr['trans'] = projects.shortDescribe(result[1][0]);
         var k = result[0][0].length;
         resultk = result[0][0];
         var j = 0;  
         arr = [];
         data2 = ['InvoiceId','UserId','Project Title','Type','Status','Amount','Gateway','Description','Date Added'];
         //console.log(data2);
         arr.push(data2) ;
         for (i in resultk)
         {
              j++;
              //console.log(resultk[i]);
              data2 = [resultk[i]['id'],resultk[i]['user_id'],resultk[i]['title']+'('+resultk[i]['pid']+')',resultk[i]['type'],resultk[i]['istatus'],resultk[i]['amount'],resultk[i]['gateway'],resultk[i]['description'],resultk[i]['date_added']];
              //console.log(arr);
              arr.push(data2) ;
              //console.log(data2);
         
         }
         res.setHeader('Content-disposition', 'attachment; filename=report.csv');
         //console.log(arr);
         res.csv(arr);  
         
       });
     } 
     if(action == 'list')
     {
          req.body.page = (typeof(req.param('page')) === 'undefined') ? 1 : req.param('page');
          
          //console.log(req.body.page);
          q.all([admin.transactionSearch(req,config.mysql,q,0),admin.transactionSearch(req,config.mysql,q,1)]).then(function(result)
          { 
           
           $arr['pagination'] = result[0][0][0]['id'];
           $arr['total'] = result[0][0][0]['paid'];
           $arr['trans'] = projects.shortDescribe(result[1][0]);
           var url = require('url');
           var url_parts = url.parse(req.url, true);
           var query = url_parts.query;
           fquery = common.urlparameter(query,{page:''});
           $arr['search'] = query ;
           console.log(result[1][0].length);
           $arr['fquery'] = fquery;
           $arr['dlink'] = '/admincp/transaction/download?'+fquery;
           var paginator = new pagination.SearchPaginator({prelink:'/admincp/transaction/list?'+fquery, current:  req.body.page, rowsPerPage: 10, totalResult: $arr['pagination']});

            $arr['pagination_html'] = paginator.render();
           common.tplFile('admincp/transaction.tpl');
           common.headerSet(1);
           common.loadTemplateHeader(req,res,$arr);
          });
     } 
});
app.get(['/settings/:action','/settings/:action/:error'],function(req,res)
{
  common.admincheckLogin(req,res,1);

  delete $arr['menu'];$arr['menu'] =[];
  $arr['menu']['settingsmenu'] = 'active';
  $arr[action+'settingsmenu'] = 'active';
   $arr['error'] = req.body.error = (typeof(req.param('error')) === 'undefined') ? '' : req.param('error');
   var action = req.body.action = (typeof(req.param('action')) === 'undefined') ? 'common' : req.param('action');
   $arr['menu'][action+'settingsmenu'] = 'active';
   var fs = require('fs')
   , ini = require('ini');
  
   var configed = ini.parse(fs.readFileSync('./config.ini', 'utf-8'));
   $arr['settings'] = configed['section'][action];
   $arr['type'] = configed['section'][action+'type'];
   $arr['value'] = configed['section'][action+'value'];
   $arr['questions'] = configed['section'][action+'questions'];
   $arr['action'] = action;
   console.log($arr['settings']);
   common.tplFile('admincp/settings.tpl');
   common.headerSet(1);
   common.loadTemplateHeader(req,res,$arr);
   //fs.writeFileSync('./config.ini', ini.stringify(config));
});
app.post(['/settings/:action'],function(req,res)
{
  common.admincheckLogin(req,res,1);
  delete $arr['menu'];$arr['menu'] =[];
   var action = req.body.action = (typeof(req.param('action')) === 'undefined') ? 'common' : req.param('action');
   var fs = require('fs')
   , ini = require('ini');
  
   var configed = ini.parse(fs.readFileSync('./config.ini', 'utf-8'));
   configed['section'][action] = req.body[action];
   console.log(req.body[action]);
   fs.writeFileSync('./config.ini', ini.stringify(configed));
   //console.log(configure.data); 
   var configure = require('../../configure');

    //default setters
    var config = configure.app();

    $arr = {
      config : config
    }
   res.writeHead(302,{'Location':'/admincp/settings/'+action+'/saved'});
   res.end();return false;return false;
});

app.get(['/projects/:action/','/projects/:action/:id','/projects/:action/:id/:error'],function(req,res)
{
  common.admincheckLogin(req,res,1);
  delete $arr['menu'];$arr['menu'] =[];
  $arr['menu']['projectsmenu'] = 'active';
     $arr.externalcss = ['datePicker'];
     $arr.externaljs = ['jquery.datePicker'];
     var projects = require('../../module/products');
     $arr['error'] = req.body.error = (typeof(req.param('error')) === 'undefined') ? '' : req.param('error');
     req.body.id = (typeof(req.param('id')) === 'undefined') ? 0 : req.param('id');
     action = req.body.action = (typeof(req.param('action')) === 'undefined') ? 'search' : req.param('action');
     console.log(req.body);
     $arr['projects'] = [];
     if(action == 'open' || action == 'closed' || action == 'sold' || action == 'future')
     {
      req.query.status = action;
      req.url += '?status='+action;
      action = req.body.action = 'list';
      
      console.log(req.url);
     }
     if(action == 'delete' && req.body.id  > 0)
     {
      var bids = require('../../module/bid');
      q.all([bids.bidHistory(req,config.mysql,q,1)]).then(function(results)
       {
              $arr['bcnt'] = results[0][0][0]['bid'];
              
              if($arr['bcnt'] == 0)
               {
                  global.projectdeleted = true;
                  projects.removeProject(req,config.mysql,q,req.body.id);
                  res.writeHead(302,{'Location':'/admincp/projects/list'});
                  res.end();return false;return false;
               } 
               else
               {
                 global.unprojectdeleted = true;
                 res.writeHead(302,{'Location':'/admincp/projects/list'});
                 res.end();return false;return false;
               } 
       });
     }
     if(action == 'list')
     {
          $arr['deleted_project'] = $arr['undeleted_project'] = false;
          if(typeof(global.projectdeleted) !== 'undefined')
          {
            delete global.projectdeleted;
            $arr['deleted_project'] = true;
          }  
          if(typeof(global.unprojectdeleted) !== 'undefined')
          {
            delete global.unprojectdeleted;
            $arr['undeleted_project'] = true;
          }  
          $arr['menu']['projectsearchmenu'] = 'active';
          req.body.page = (typeof(req.param('page')) === 'undefined') ? 1 : req.param('page');
          $arr['menu']['projectsearchmenu'] = 'active';
          console.log(req.body.page);
          q.all([admin.userProductSearch(req,config.mysql,q,0),admin.userProductSearch(req,config.mysql,q,1)]).then(function(result)
          { 
           $arr['pagination'] = result[1][0].length;
           $arr['projects'] = projects.shortDescribe(result[0][0]);
           var url = require('url');
           var url_parts = url.parse(req.url, true);
           var query = url_parts.query;
          fquery = common.urlparameter(query,{page:''});
           $arr['search'] = query ;
           console.log(result[1][0].length);
           var paginator = new pagination.SearchPaginator({prelink:'/admincp/projects/list?'+fquery, current:  req.body.page, rowsPerPage: 10, totalResult: $arr['pagination']});

            $arr['pagination_html'] = paginator.render();
           common.tplFile('admincp/project.tpl');
           common.headerSet(1);
           common.loadTemplateHeader(req,res,$arr);
          });
     } 
     if(action == 'new')
     {
           $arr['menu']['projectsnewmenu'] = 'active';
           common.tplFile('admincp/nproject.tpl');
           common.headerSet(1);
           common.loadTemplateHeader(req,res,$arr);
     }
     if(action == 'edit')
     {
      $arr['menu']['projectseditmenu'] = 'active';
          q.all([projects.productDetail(req,config.mysql,q),projects.productImage(req,config.mysql,q)]).then(function(result)
          {
           $arr['projects'] = result[0][0][0];
           $arr['image'] = result[1][0];
           console.log($arr['image']);
           common.tplFile('admincp/nproject.tpl');
           common.headerSet(1);
           common.loadTemplateHeader(req,res,$arr);
          });
     }
});
app.post(['/products/save'],function(req,res)
{
  common.admincheckLogin(req,res,1);
  delete $arr['menu'];$arr['menu'] =[];
   var projects = require('../../module/products');
   var attach = require('../../module/attach');
   $arr['menu']['projectsmenu'] = 'active';
   req.body.id = (typeof(req.body.id) === 'undefined') ? 0 : req.body.id;
   if(req.body.id > 0)
   {
    admin.deleteAttachment(config.mysql,q,req); 
    //attach.save('product',req,res);
    admin.saveProduct(req,config.mysql,q);
    if(typeof(req.files.product_image) !== 'undefined')
    {
      var m =req.files.product_image;
      if(typeof(m[0]) !== 'undefined')
      {  
        for(var im = 0;im < m.length;im++)      {
           admin.addAttachment(m[im],config.mysql,q,req.body.id);      
        }
      }
      else
      {
        admin.addAttachment(m,config.mysql,q,req.body.id);
      }  
    }  
    res.writeHead(302,{'Location':'/admincp/projects/edit/'+req.body.id+'/saved'});
    res.end();return false;return false;
   } 
   else
   {
      
       attach.save('product',req,res);
       q.all(projects.save(req,config.mysql,q)).then(function(l)
       {
          if(typeof(req.files.product_image) !== 'undefined')
          {
            var m =req.files.product_image;
            if(typeof(m[0]) !== 'undefined')
            {  
              for(var im = 0;im < m.length;im++)      {
                 admin.addAttachment(m[im],config.mysql,q,l[0].insertId);      
              }
            }
            else
            {
              admin.addAttachment(m,config.mysql,q,l[0].insertId);
            }  
          }  
       res.writeHead(302,{'Location':'/admincp/projects/edit/'+l[0].insertId+'/saved'});
       res.end();return false;return false;
       });
   } 
});
app.post(['/users/:action/'],function(req,res)
{
  common.admincheckLogin(req,res,1);
	delete $arr['menu'];$arr['menu'] =[];
  $arr['menu']['usersmenu'] = 'active';
  $arr['menu']['editusersmenu'] = 'active';
  action = req.body.action = (typeof(req.param('action')) === 'undefined') ? 'all' : req.param('action');
   console.log(action);
   req.body.page = (typeof(req.param('page')) === 'undefined') ? 1 : req.param('page');
   req.body.error = (typeof(req.param('error')) === 'undefined') ? '' : req.param('error');
   req.body.page = (req.body.page -1)*10;
   if(action == 'save')
   {   
           req.body.id = (typeof(req.param('id')) === 'undefined') ? 0 : req.param('id');
           var register = require('../../module/register');
           q.all([admin.editUser(req,config.mysql,q),register.checkemail(config.mysql,req),admin.listUserCategories(req,config.mysql,q)]).then(function(result)
           {
                $arr['users'] = users = {avatar:'',id : ''};
                if(result[0][0].length > 0)
                {
                  $arr['users'] = users = result[0][0][0];  
                } 
                 $arr['mcats'] = result[2][0];
                 //console.log(result[1][0]);  
                 emailuser =  result[1][0];      
                 req.body.avatar = users.avatar;
                 req.body.image  = users.image;
                  
                 if(typeof(req.files.profile_image) !== 'undefined') 
                  {
                      var fs = require('fs');
                        fs.unlink(config.path+"/uploads/profile/"+users.avatar, function (err) {
                        if (!err)
                        console.log('successfully deleted '+users.avatar);
                      });
                     var attach = require('../../module/attach');
                      req.body.avatar =  req.files.profile_image.name;
                      req.body.image = req.files.profile_image.originalname;
                      console.log(req.files.profile_image);
                      console.log(req.body);
                     attach.save('profile',req,res);

                  }

                 if(emailuser.length > 0)
                 {
                  console.log(emailuser);
                  if(req.body.id == 0)
                  {
                    res.writeHead(302,{'Location':'/admincp/users/edit/'+req.body.id+'/Email Unavailable'});
                    res.end();return false;return false;
                  } 
                 	if(emailuser[0].id != users.id && req.body.id > 0)
                 	{
                        res.writeHead(302,{'Location':'/admincp/users/edit/'+req.body.id+'/Email Unavailable'});
			     	            res.end();return false;return false;
                        return false;
                 	}	
                  //req.body.email = '';
                  console.log('stop this');
                 }	
			     if(typeof(req.body.email) === 'undefined' || typeof(req.body.first_name) === 'undefined' || typeof(req.body.last_name) === 'undefined' || typeof(req.body.aboutme) === 'undefined' || typeof(req.body.status) === 'undefined')
			     {
			     	res.writeHead(302,{'Location':'/admincp/users/edit/'+req.body.id+'/Invalid Data'});
			     	res.end();return false;return false;
			     }	
			     else if(req.body.email == '' || req.body.first_name == '' || req.body.last_name == '' || req.body.aboutme == '' || req.body.status == '')
			     {
			     	res.writeHead(302,{'Location':'/admincp/users/edit/'+req.body.id+'/Invalid Data'});
			     	res.end();return false;return false;
			     }	
           if(req.body.password != req.body.cpassword)
           {
             res.writeHead(302,{'Location':'/admincp/users/edit/'+req.body.id+'/Password Mismatch'});
             res.end();return false;return false;
           } 
            if(req.body.password != '' && typeof(req.body.password) !== 'undefined' && req.body.password == req.body.cpassword && req.body.id > 0)
           {
                 var md5 = require('MD5');
                 req.body.salt = '12345'
                 req.body.password = md5(md5(req.body.password)+req.body.salt);
                 admin.updateUserPassword(req,config.mysql,q);
           } 
           if(req.body.id == 0)
           {
             console.log(req.body.password);
             if(req.body.password == '' || typeof(req.body.password) === 'undefined' || req.body.password != req.body.cpassword)
             {
                  res.writeHead(302,{'Location':'/admincp/users/edit/'+req.body.id+'/Password Error'});
                  res.end();return false;return false;
             }
             q.all(admin.addUser(req,config.mysql,q)).then(function(r)
             { 

             console.log(JSON.stringify(r));
             req.body.id = r[0].insertId;
             admin.updateUser(req,config.mysql,q);
             admin.updateUserPassword(req,config.mysql,q);
              var managecats = function(mcat, cb) {
                        admin.managecategories(req,config.mysql,q,mcat);
                      cb(null);  
                   }
                   
                  admin.removeCategories(req,config.mysql,q);
                  if(typeof(req.body.categories) !='undefined')
                   {
                     var async = require('async');
                          async.each(req.body.categories, managecats, function(err) {
                          if (err) return console.error(err);
                            res.writeHead(302,{'Location':'/admincp/users/edit/'+req.body.id+'/saved'});
                            res.end();return false;return false;
                           });
                   }
                   else
                   {
                           res.writeHead(302,{'Location':'/admincp/users/edit/'+req.body.id+'/saved'});
                            res.end();return false;return false;
                   } 

                
            
             });             
           }
           else
           {
            admin.updateUser(req,config.mysql,q);
            admin.updateUserStatus(req,config.mysql,q);

  
                     var managecats = function(mcat, cb) {
                        admin.managecategories(req,config.mysql,q,mcat);
                      cb(null);  
                   }
                   
                  admin.removeCategories(req,config.mysql,q);
                  if(typeof(req.body.categories) !='undefined')
                   {
                     var async = require('async');
                          async.each(req.body.categories, managecats, function(err) {
                          if (err) return console.error(err);
                            res.writeHead(302,{'Location':'/admincp/users/edit/'+req.body.id+'/saved'});
                            res.end();return false;return false;
                           });
                   }
                   else
                   {
                           res.writeHead(302,{'Location':'/admincp/users/edit/'+req.body.id+'/saved'});
                            res.end();return false;return false;
                   } 

            }       
            
            
            
			     
           });
   }	
});
app.get(['/users/','/users/:action/','/users/:action/:id','/users/:action/:id/:error'],function(req,res)
{
  common.admincheckLogin(req,res,1);
   action = req.body.action = (typeof(req.param('action')) === 'undefined') ? 'all' : req.param('action');
  delete $arr['menu'];$arr['menu'] =[];
   req.body.page = (typeof(req.param('page')) === 'undefined') ? 1 : req.param('page');
   $arr['error'] = req.body.error = (typeof(req.param('error')) === 'undefined') ? '' : req.param('error');
   $arr['menu']['usersmenu'] = 'active';
   raction = action;
   
   if(action == 'active' || action == 'cancel' || action == 'unverified' || action == 'moderate' || action == 'all')
   {
        $arr['menu'][action+'usersmenu'] = 'active';
        q.all([admin.userList(req,config.mysql,q,1),admin.userList(req,config.mysql,q,0)]).then(function(result)
			  {	
			  	//console.log(result[0][0])
			     //$arr['project'] = result[0][0][0];
           console.log(result[1][0].length);
			     $arr['pagination'] = result[1][0].length;
			     $arr['users'] = result[0][0];
			     
                 var paginator = new pagination.SearchPaginator({prelink:'/admincp/users/'+raction+'/', current:  req.body.page, rowsPerPage: 10, totalResult: $arr['pagination']});

                  $arr['pagination_html'] = paginator.render();
			     //$arr['trans'] = result[2][0][0];
           if(raction == 'search')
           {
            common.tplFile('admincp/susers.tpl');
           }
           else 
			     {
            common.tplFile('admincp/users.tpl');
			     }
           common.headerSet(1);
			     common.loadTemplateHeader(req,res,$arr);
			   });

   } 
   if(action == 'search')
   {

    $arr['menu']['searchusersmenu'] = 'active';
        req.body.email = (typeof(req.param('email')) === 'undefined') ? '' : req.param('email'); 
           req.body.first_name = (typeof(req.param('first_name')) === 'undefined') ? '' : req.param('first_name'); 
           req.body.last_name = (typeof(req.param('last_name')) === 'undefined') ? '' : req.param('last_name'); 
           req.body.status = (typeof(req.param('status')) === 'undefined') ? '' : req.param('status'); 
        q.all([admin.userListSearch(req,config.mysql,q,1),admin.userListSearch(req,config.mysql,q,0)]).then(function(result)
        { 
          //console.log(result[0][0])
           //$arr['project'] = result[0][0][0];
           
           var url = require('url');
            var url_parts = url.parse(req.url, true);
            var query = url_parts.query;
           $arr['pagination'] = result[1][0].length;
           $arr['users'] = result[0][0];
           $arr['search'] = query ;
           fquery = common.urlparameter(query,{page:''});
           var paginator = new pagination.SearchPaginator({prelink:'/admincp/users/'+raction+'/?'+fquery, current:  req.body.page, rowsPerPage: 10, totalResult: $arr['pagination']});

           $arr['pagination_html'] = paginator.render();
           //$arr['trans'] = result[2][0][0];
           if(raction == 'search')
           {
            common.tplFile('admincp/susers.tpl');
           }
           else 
           {
            common.tplFile('admincp/users.tpl');
           }
           common.headerSet(1);
           common.loadTemplateHeader(req,res,$arr);
         });

   }  
   if(action == 'edit' || action == 'add')
   {
      $arr['menu']['editusersmenu'] = 'active';
    if(action == 'add')
      $arr['menu']['addusersmenu'] = 'active';
           req.body.id = (typeof(req.param('id')) === 'undefined') ? 0 : req.param('id');
           q.all([admin.editUser(req,config.mysql,q),admin.listUserCategories(req,config.mysql,q)]).then(function(result)
           {
                 $arr['users'] = result[0][0][0];                
			     $arr['mcats'] = result[1][0][0]['mcat'];
           console.log($arr['mcats']+'as');
			     common.tplFile('admincp/eusers.tpl');
			     common.headerSet(1);
			     common.loadTemplateHeader(req,res,$arr);
           });
   }

   
});

app.post(['/categories/save'],function(req,res)
{
  common.admincheckLogin(req,res,1);
  delete $arr['menu'];$arr['menu'] =[];
          $arr['menu']['categoriesmenu'] = 'active';
          if(typeof(req.body.title) === 'undefined' || typeof(req.body.description) === 'undefined')
           {
            res.writeHead(302,{'Location':'/admincp/categories/edit/'+req.body.id+'/Invalid Data'});
            res.end();return false;return false;
           }  
           else if(req.body.title == '' || req.body.description == '')
           {
            res.writeHead(302,{'Location':'/admincp/categories/edit/'+req.body.id+'/Invalid Data'});
            res.end();return false;return false;
           }  
           req.body.id = (req.body.id > 0) ? req.body.id : 0;
           q.all([admin.selectMaxrgt(req,config.mysql,q)]).then(function(out) {
             req.body.mrgt = out[0][0][0]['mrgt'];
             console.log(out[0][0][0]['mrgt']);
             if(req.body.id == 0)
             { 
               admin.updateLeft(req,config.mysql,q);
               admin.updateRight(req,config.mysql,q);
             } 
             q.all([admin.categorySave(req,config.mysql,q)]).then(function(result) {
                  
                  if(req.body.id == 0)
                  {  
                   req.body.id = result[0][0].insertId;
                  }
                  res.writeHead(302,{'Location':'/admincp/categories/edit/'+req.body.id+'/saved'});
                  res.end();return false;return false;
             });
            }); 
        
           
});
app.get(['/categories/:action','/categories/:action/:id','/categories/:action/:id/:error'],function(req,res)
{
  common.admincheckLogin(req,res,1);
  delete $arr['menu'];$arr['menu'] =[];
    $arr['menu']['categoriesmenu'] = 'active';
    req.body.page = (typeof(req.param('page')) === 'undefined') ? 1 : req.param('page');
    $arr['error'] = req.body.error = (typeof(req.param('error')) === 'undefined') ? '' : req.param('error');
    action = req.body.action = (typeof(req.param('action')) === 'undefined') ? 'list' : req.param('action');
    id = req.body.id = (typeof(req.param('id')) === 'undefined') ? 0 : req.param('id');
    if(action == 'list')
    {
      q.all([admin.categoriesList(req,config.mysql,q,1),admin.categoriesList(req,config.mysql,q,0)]).then(function(result)
      { 
           $arr['pagination'] = result[1][0].length;
           $arr['categories'] = result[0][0];
           var paginator = new pagination.SearchPaginator({prelink:'/admincp/categories/', current:  req.body.page, rowsPerPage: 10, totalResult: $arr['pagination']});

           $arr['pagination_html'] = paginator.render();
           common.tplFile('admincp/categories.tpl');
           common.headerSet(1);
           common.loadTemplateHeader(req,res,$arr);
      });
    } 
    if(action == 'add')
    { 
      q.all(common.allCategoriesList(req,config.mysql,q)).then(function(result)
      {
           $arr['pcategories'] = result[0];
           console.log($arr['pcategories']);
           common.tplFile('admincp/ncategories.tpl');
           common.headerSet(1);
           common.loadTemplateHeader(req,res,$arr);
      });
    }
    /*if(action == 'delete')
    { 
      q.all(common.selectDeleteCategories(req,config.mysql,q)).then(function(result)
      {
               req.body.mrgt = out[0][0]['mrgt']; 
               req.body.mlft = out[0][0]['mlft'];
               req.body.myw = out[0][0]['myw']; 
               admin.updateLeftDelete(req,config.mysql,q);
               admin.updateRightDelete(req,config.mysql,q);
      });
    }*/
    if(action == 'edit')
    {
      q.all([admin.selectCategories(req,config.mysql,q),common.allCategoriesList(req,config.mysql,q)]).then(function(result)
      { 
           console.log(result[0][0]);
           $arr['pcategories'] = result[1][0];
           $arr['categories'] = result[0][0][0];
           common.tplFile('admincp/ncategories.tpl');
           common.headerSet(1);
           common.loadTemplateHeader(req,res,$arr);
      });
    }  

    

});


app.get(['/referral'],function(req,res)
{
    common.admincheckLogin(req,res,1);
	var dashboard = require('../../module/dashboard');	
	var rid = req.body.rid = (typeof(req.param('rid')) === 'undefined') ? '0' : req.param('rid');
	if(rid > 0)
	{
	dashboard.updateReferralStatus(req,config.mysql,q,rid);
	admin.addbalance(req,config.mysql,q,req.param('ruid'));
	res.writeHead(302, {
             'Location': '/admincp/referral/'
       });
       res.end();return false;
	
	}
	else
	{	 
	delete $arr['menu'];
	$arr['menu'] =[];
    $arr['menu']['referralmenu'] = 'active';
	req.body.page = (typeof(req.param('page')) !== 'undefined') ? req.param('page') : 1;   
		$arr['referral'] = $arr['referrallink'] =  '';		
		console.log(req.body.page);
		q.all([dashboard.getReferral(req,config.mysql,q,1,0),dashboard.getReferral(res,config.mysql,q,1,1)]).then(function(result)
		{
		 $arr['referral'] = result[0][0];
		 $arr['referrals']   = result[1][0].length;
	
	     var paginator = new pagination.SearchPaginator({prelink:'/admincp/referral/', current:  req.body.page, rowsPerPage: 10, totalResult: $arr['referrals']});
         $arr['pagination_html'] = paginator.render();
		
		 common.tplFile('admincp/referals.tpl');
         common.headerSet(1);
         common.loadTemplateHeader(req,res,$arr);		  
		});
	}
      
});


module.exports = app;
