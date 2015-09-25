
var common = require('./common');
var dateFormat = require('dateformat');
var mysqli = require('./mysqli');
exports.checkuserSeated = function(req,mysql,q)
{
       $mysqli =  {};
       strQuery = mysqli.mysqli($mysqli,'seated4');	    
	   var defered = q.defer();
	    
	    var escape_data =  [(typeof(req.session) !== 'undefined')  ? req.session.userid : 0,req.body.id];
	    console.log(escape_data);               
		query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
		return defered.promise;
}

exports.checkSeatedCount = function(req,mysql,q)
{
       $mysqli =  {};
       strQuery = mysqli.mysqli($mysqli,'seated5');	    
	   var defered = q.defer();
	    
	    var escape_data =  [req.body.id];
	    console.log(escape_data);               
		query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
		return defered.promise;
}

exports.bookSeat = function(req,mysql,q)
{
       $mysqli =  {};
	   datge = dateFormat(new Date(),"yyyy-mm-dd HH:MM:ss");
       strQuery = mysqli.mysqli($mysqli,'seated1');	    
	   var defered = q.defer();
	    
	    var escape_data =  [req.body.id,(typeof(req.session) !== 'undefined')  ? req.session.userid : 0,req.body.seatAmount,datge];
	    console.log(escape_data);               
		query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
		return defered.promise;
}

exports.standSeat = function(req,mysql,q)
{
       $mysqli =  {};
	   datge = dateFormat(new Date(),"yyyy-mm-dd HH:MM:ss");
       strQuery = mysqli.mysqli($mysqli,'seated2');	    
	   var defered = q.defer();
	    
	    var escape_data =  [datge,(typeof(req.session) !== 'undefined')  ? req.session.userid : 0,(typeof(req.body.id) !== 'undefined')  ? req.body.id : 0];
	    console.log(escape_data);               
		query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
		return defered.promise;
}

exports.reduceSeatAmount = function(req,mysql,q)
{	

//create invoice for booking seated auction 
        delete payments;
		payments = require('./payment');
        payments.type = 'Seat Reserved';

        payments.amount = req.body.seatAmount;
        payments.sessionsdata = {};
        payments.sessionsdata = req.session;
        payments.transactionid = 0;
        payments.gateway = 'account';
        payments.sessionsdata = {};
        payments.sessionsdata.userid = (typeof(req.session) !== 'undefined')  ? req.session.userid : 0;
        payments.payid = req.body.id;
        payments.name = 'Seat Reserved for '+req.body.title;
        
        payments.insertInvoice();
	    
	  //  this.addBidInvoice(req,mysql,q);
	    $mysqli =  {};
        var escape_data =  [req.body.seatAmount,(typeof(req.session) !== 'undefined')  ? req.session.userid : 0]
	    console.log(escape_data);
		strQuery = mysqli.mysqli($mysqli,'seated6'); 
		var defered = q.defer();
	    query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
	    console.log(2);
	    return defered.promise;             
		
}

exports.refundSeatAmount = function(req,mysql,q)
{	
	
	//create invoice for booking seated auction 
        delete payments;
		payments = require('./payment');
        payments.type = 'Seat Vacated';

        payments.amount = req.body.seatAmount;
        payments.sessionsdata = {};
        payments.sessionsdata = req.session;
        payments.transactionid = 0;
        payments.gateway = 'account';
        payments.sessionsdata = {};
        payments.sessionsdata.userid = (typeof(req.session) !== 'undefined')  ? req.session.userid : 0;
        payments.payid = req.body.id;
        payments.name = 'Seat Vacated from '+req.body.title;
        
        payments.insertInvoice();
		

	    $mysqli =  {};
        var escape_data =  [req.body.seatAmount,(typeof(req.session) !== 'undefined')  ? req.session.userid : 0]
	    console.log(escape_data);
		strQuery = mysqli.mysqli($mysqli,'seated7'); 
		var defered = q.defer();
	    query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
	    console.log(2);
	    return defered.promise;             
		
}

exports.scheduledSeats = function(req,mysql,q)
{	
	    
	  //  this.addBidInvoice(req,mysql,q);
	    //$mysqli =  {};
		datge = dateFormat(new Date(),"yyyy-mm-dd HH:MM:ss");
		$mysqli = {datge:datge};
        var escape_data =  [(typeof(req.session) !== 'undefined')  ? req.session.userid : 0]
	    console.log(escape_data);
		strQuery = mysqli.mysqli($mysqli,'seated8'); 
		var defered = q.defer();
	    query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
	    /*query.on('error',function(err)
		{			
			throw err;
		});
	    */
		return defered.promise;             
		
}


exports.seatedAuctionReminderEmail = function(mysql,q)
{	
	    //$mysqli =  {};
		datge = dateFormat(new Date(),"yyyy-mm-dd HH:MM:ss");
		$mysqli = {datge:datge};
        var escape_data =  []
	   // console.log(escape_data);
		strQuery = mysqli.mysqli($mysqli,'seated9'); 
		var defered = q.defer();
	    query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
	    
		/*query.on('error',function(err)
		{
			throw err;
		});
	    */
		return defered.promise;             
		
}

exports.updateSeatedCronReminder = function(mysql,q,seat)
{	
	    //$mysqli =  {};
		
		//console.log(seat.seatid);return 0;
        var escape_data =  [seat.seatid,seat.id,seat.user_id]
	   // console.log(escape_data);
		strQuery = mysqli.mysqli($mysqli,'seated10'); 
		var defered = q.defer();
	    query =  mysql.query(strQuery,escape_data,defered.makeNodeResolver());
	   
	   /*query.on('error',function(err)
		{
			throw err;
		});
	   */ 
	    return defered.promise;             
		
}




