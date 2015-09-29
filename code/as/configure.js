var mysql = require('mysql');

var data = [];
data['url'] = 'http://shopifyclone.com:8080';
data['title'] = 'AuctionSoftware.com';
data['path'] = '/home/shopifyclone/public_html';
data['dpath'] = 'http://www.auctionsoftware.com/penny_auction/';
data['externalcss'] = 'http://shopifyclone.com/css/';
data['externaljs'] = 'http://shopifyclone.com/js/';
data['connect'] = mysql.createConnection({
  	host : 'localhost',
  	user : 'shopifyc_penny',
  	password: 'shopifyc_penny',
  });
data['connect'].connect();
data['connect'].query('use shopifyc_penny');
data['mysql'] = data['connect'];
data['captachapublickey'] = '6LdE2_4SAAAAAG0XDJ4ckaEJ9yjwFUArf1eF5v8Q';
data['captachaprivatekey'] = '6LdE2_4SAAAAANZFzGPb-LHtdQcN0sXm2I_gRiMe';

exports.app = function()
{  

   return data;
}
