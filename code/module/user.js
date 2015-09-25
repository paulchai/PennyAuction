var  util    = require('util');
     
var q = require('q');
var mysqli = require('./mysqli');
var common = require('./common');
var url = require('url');
exports.userInfo = function(req,mysql,q,id,field)
{
  if(id == 0)
  {
    id = (typeof(req.session) !== 'undefined' )  ? req.session.userid : 0;
  }  
  if(field == '')
  {
    field = '*';
  } 
  
  $mysqli =  {};
  strQuery = mysqli.mysqli($mysqli,25); 
  var escape_data = [field,id];
  var defered = q.defer();
  query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());

  return defered.promise;
  
}

