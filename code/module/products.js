var common = require('./common');
var dateFormat = require('dateformat');
var mysqli = require('./mysqli');

exports.winnerPrd = function (mysql, q, data) {
    $mysqli = {};
    strQuery = mysqli.mysqli($mysqli, 36);
    //console.log(strQuery);
    var defered = q.defer();

    query = mysql.query(strQuery, defered.makeNodeResolver());

    return defered.promise;
};
exports.post = function (req, res, arr) {
    common.tplFile('post.tpl');
    common.headerSet(1);
    common.loadTemplateHeader(req, res, arr);
};
exports.deleteWatchlist = function (req, mysql, q) {
    $mysqli = {};


    strQuery = mysqli.mysqli($mysqli, 53);

    var defered = q.defer();

    var escape_data = [req.param('id'), req.session.userid];

    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};
exports.mywatchlist = function (req, mysql, q) {
    $mysqli = {};
    var page = req.body.page;
    page = (page > 0) ? (page - 1) * 5 : 0;


    strQuery = mysqli.mysqli($mysqli, 51);

    var defered = q.defer();

    var escape_data = [req.session.userid, page];
    // console.log(escape_data);
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};
exports.totalmywatchlist = function (req, mysql, q) {
    $mysqli = {};
    page = req.body.page;
    strQuery = mysqli.mysqli($mysqli, 52);

    var defered = q.defer();

    var escape_data = [req.session.userid];
    //console.log(escape_data);
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};
exports.searchProducts = function (mysql, q, data, req) {
    var row = '';
    var limit = '';
    where = '';
    //console.log(data);
    if (data['page'] == 'index') {
        row = 7;
        where = ' and market_status = "open"';
        limit = ' limit 0 , 12'
    }
    else if (data['page'] == 'live') {
        row = 7;
        where = ' and market_status = "open"';
    }
    else if (data['page'] == 'future') {
        row = 8;
    }
    else if (data['page'] == 'closed') {
        row = 9;
    }
    else if (data['page'] == 'shop') {
        row = 10;
    }
    else {
        row = 13;
    }
    datge = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");

    if (req.param('sort')) {
        var sortval = req.param('sort');
        if (sortval == '01')
            sqlorderby = ' ORDER BY p.date_added DESC';
        else if (sortval == '02')
            sqlorderby = ' ORDER BY p.date_closed ASC';
        else if (sortval == '03')
            sqlorderby = ' ORDER BY p.mprice ASC';
        else if (sortval == '04')
            sqlorderby = ' ORDER BY p.mprice DESC';
        else
            sqlorderby = ' ORDER BY p.id DESC';

    }
    else
        sqlorderby = ' order by  p.id desc';
    //console.log(sqlorderby);
    $mysqli = {
        search: data['search'],
        cid: data['cid'],
        datge: datge,
        limit: limit,
        where: where,
        pid: 0,
        orderby: sqlorderby
    };

    if (data['cid'] > 0 && data['cid'] != '') {
        $mysqli.cid = mysqli.mysqli($mysqli, 'cid');
    }
    else {
        $mysqli.cid = '';
    }
    if (data['titlesonly'] > 0 && data['titlesonly'] != '' && data['search'] != '') {
        $mysqli.search = mysqli.mysqli($mysqli, 'title');
    }
    else if (data['titlesonly'] == '' && data['search'] != '') {
        $mysqli.search = mysqli.mysqli($mysqli, 'search');
    }
    else {
        $mysqli.search = '';
    }

    if (data['images'] != '') {

        $mysqli.where += mysqli.mysqli($mysqli, 'avatar');
    }
    if (data['freeshipping'] != '') {

        $mysqli.where += mysqli.mysqli($mysqli, 'noshipping');
    }
    if (data['projectid'] > 0) {
        $mysqli.pid = parseInt(data['projectid']);
        $mysqli.where += mysqli.mysqli($mysqli, 'pid');
    }
    //  console.log(row);
    strQuery = mysqli.mysqli($mysqli, row);
    //console.log(row);
    // console.log(strQuery);
    var defered = q.defer();

    query = mysql.query(strQuery, defered.makeNodeResolver());

    return defered.promise;
};
exports.homeProducts = function (mysql, q, all) {

    datge = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    $mysqli = {datge: datge};
    strQuery = mysqli.mysqli($mysqli, all);
    var defered = q.defer();

    query = mysql.query(strQuery, defered.makeNodeResolver());

    return defered.promise;
};
exports.isinWatchlist = function (req, mysql, q) {

    $mysqli = {};
    strQuery = mysqli.mysqli($mysqli, 49);
    //console.log(strQuery);
    var defered = q.defer();

    escapeData = [req.session.userid, req.param('id')];

    query = mysql.query(strQuery, escapeData, defered.makeNodeResolver());

    return defered.promise;
};
exports.addWatchlist = function (req, mysql, q) {

    $mysqli = {};
    strQuery = mysqli.mysqli($mysqli, 50);
    //console.log(strQuery);
    var defered = q.defer();
    datge = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    escapeData = [req.param('id'), req.session.userid, datge];
    //console.log(escapeData);
    query = mysql.query(strQuery, escapeData, defered.makeNodeResolver());

    return defered.promise;
};
exports.productImage = function (req, mysql, q) {
    $mysqli = {};
    strQuery = mysqli.mysqli($mysqli, 164);
    var defered = q.defer();
    escape_data = [req.body.id];
    //console.log(escape_data);
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());

    return defered.promise;
};
exports.save = function (req, mysql, q) {
    //var qs = require('qs');
    //req.body = qs.parse(req.body);
    newfilename = {};
    newfilename.name = '';
    newfilename.originalname = '';
    if (typeof(req.files.product_image) !== 'undefined') {
        if (typeof(req.files.product_image[0]) === 'undefined') {

            newfilename.name = req.files.product_image.name;
            newfilename.originalname = req.files.product_image.originalname;
        }
        else {
            newfilename.name = req.files.product_image[0].name;
            newfilename.originalname = req.files.product_image[0].originalname;
        }
    }

    datge = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    $mysqli = {};
    strQuery = mysqli.mysqli($mysqli, 14);
    //console.log(req.body.date_added);
    // req.body.date_added = req.body.date_added+' 00:00:00';
    // req.body.date_closed = req.body.date_closed+' 23:59:59';
    //console.log( dateFormat(new Date(req.body.date_added),"yyyy-mm-dd HH:MM:ss"));
    // console.log( new Date(req.body.date_added));
    var defered = q.defer();
    req.body.iprice = global.general.bidincrement;
    req.body.sprice = 0.01;

    var escape_data = [req.body.title,
        req.param('description'),
        (typeof(req.files.product_image) !== 'undefined') ? newfilename.name : (typeof(req.body.avatar) !== 'undefined') ? req.body.avatar[0] : '',
        (typeof(req.files.product_image) !== 'undefined') ? newfilename.originalname : (typeof(req.body.image) !== 'undefined') ? req.body.image[0] : '',
        req.param('cid'),
        req.param('tags'),
        (typeof(req.session) !== 'undefined') ? req.session.userid : 0,
        common.currencyConverter(req.param('shipping_fee')),
        req.param('shipping_description'),
        datge,
        (typeof(req.param('buynow')) === 'undefined') ? 0 : req.param('buynow'),
        (typeof(req.param('feature')) === 'undefined') ? 0 : req.param('feature'),
        common.currencyConverter(req.body.sprice),
        common.currencyConverter(req.body.rprice),
        dateFormat(new Date(req.body.date_added), "yyyy-mm-dd HH:MM:ss"),
        dateFormat(new Date(req.body.date_closed), "yyyy-mm-dd HH:MM:ss"),
        1,
        common.currencyConverter(req.body.bprice),
        common.currencyConverter(req.body.mprice),
        common.currencyConverter(req.body.iprice),
        common.currencyConverter(req.body.sprice),
        (typeof(req.param('auctionType')) === 'undefined') ? 'penny' : req.param('auctionType'),
        (typeof(req.param('seats')) === 'undefined') ? 0 : req.param('seats'),
        (typeof(req.param('seatAmount')) === 'undefined') ? 0 : req.param('seatAmount'),
        (typeof(req.body.storeid) !== 'undefined') ? req.body.storeid : 0];

    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());

    query.on('error', function (err) {
        throw err;
    });

    return defered.promise;
};
exports.futureProducts = function (mysql, q) {
    datge = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    $mysqli = {datge: datge};
    strQuery = mysqli.mysqli($mysqli, 3);

    var defered = q.defer();

    query = mysql.query(strQuery, defered.makeNodeResolver());

    return defered.promise;
};

exports.seatedProducts = function (mysql, q) {
    datge = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    $mysqli = {datge: datge};
    strQuery = mysqli.mysqli($mysqli, 'seated3');

    var defered = q.defer();

    query = mysql.query(strQuery, defered.makeNodeResolver());
    query.on('error', function (err) {
        throw err;
    });
    return defered.promise;
};

exports.myproducts = function (req, mysql, q, cnt) {
    $mysqli = {};
    var defered = q.defer();
    if (cnt == 0) {
        strQuery = mysqli.mysqli($mysqli, 15);
        var page = req.body.page;
        page = (page > 0) ? (page - 1) * 15 : 0;

        escape_fields = [req.session.userid, page]

    }
    else {
        strQuery = mysqli.mysqli($mysqli, 18);
        escape_fields = [req.session.userid, 0]
    }
    //console.log(escape_fields);
    query = mysql.query(strQuery, escape_fields, defered.makeNodeResolver());

    return defered.promise;
};
exports.productDetail = function (req, mysql, q) {

    $mysqli = {};
    var defered = q.defer();

    strQuery = mysqli.mysqli($mysqli, 19);
    escape_fields = [req.param('id')];
    //console.log(escape_fields);
    query = mysql.query(strQuery, escape_fields, defered.makeNodeResolver());

    return defered.promise;
};
exports.productDetails = function (req, mysql, q) {

    $mysqli = {};
    var defered = q.defer();

    strQuery = mysqli.mysqli($mysqli, 162);
    datge = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    escape_fields = [datge]
    //console.log(escape_fields);
    query = mysql.query(strQuery, escape_fields, defered.makeNodeResolver());

    return defered.promise;
};
exports.closeProject = function (req, mysql, q, status) {
    $mysqli = {};
    var defered = q.defer();

    strQuery = mysqli.mysqli($mysqli, 34);
    escape_fields = [status, req.param('id')]
    //console.log(escape_fields);
    query = mysql.query(strQuery, escape_fields, defered.makeNodeResolver());

    return defered.promise;
};
exports.closeProjects = function (req, mysql, q, status, pid) {
    $mysqli = {};
    var defered = q.defer();

    strQuery = mysqli.mysqli($mysqli, 34);
    escape_fields = [status, pid]
    //console.log(escape_fields);
    query = mysql.query(strQuery, escape_fields, defered.makeNodeResolver());

    return defered.promise;
};
exports.shopProducts = function (mysql, q) {
    datge = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    $mysqli = {datge: datge};
    strQuery = mysqli.mysqli($mysqli, 6);

    var defered = q.defer();

    query = mysql.query(strQuery, defered.makeNodeResolver());

    return defered.promise;
};
exports.bidWinner = function (req, mysql, q) {
    $mysqli = {};
    strQuery = mysqli.mysqli($mysqli, 160);

    var defered = q.defer();
    // console.log(1);
    escape_fields = [req.session.userid, req.body.id];
    //  console.log(escape_fields);
    query = mysql.query(strQuery, escape_fields, defered.makeNodeResolver());

    return defered.promise;
};
exports.auctionSold = function (req, mysql, q) {
    $mysqli = {};
    strQuery = mysqli.mysqli($mysqli, 161);

    var defered = q.defer();
    escape_fields = [req.session.userid, req.body.id];
    query = mysql.query(strQuery, escape_fields, defered.makeNodeResolver());

    return defered.promise;
};
exports.closeProducts = function (mysql, q) {
    datge = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    $mysqli = {datge: datge};
    strQuery = mysqli.mysqli($mysqli, 4);

    var defered = q.defer();

    query = mysql.query(strQuery, defered.makeNodeResolver());

    return defered.promise;
};
exports.shortDescribe = function (results) {
    req_data = [];
    //console.log(results);
    for (var i in results) {
        //console.log(results[i]['date_closed']);
        if (results[i]['date_closed'] !== null || typeof(results[i]['date_closed']) !== 'undefined') {
            //console.log(1);
            date1 = new Date(results[i]['date_closed']);
            date3 = new Date(results[i]['date_added']);
            date2 = new Date();
            diffDays = date1.getTime() - date2.getTime();
            diffDays1 = date3.getTime() - date2.getTime();
            if (diffDays1 > 0)
                results[i]['seat_started'] = 0;
            else
                results[i]['seat_started'] = 1;
            //console.log(diffDays)​
            results[i]['closed'] = date1;
            results[i]['ptime'] = dateFormat(results[i]['date_closed'], 'mmmm dS, yyyy');
            results[i]['stime'] = dateFormat(results[i]['date_added'], 'mmmm dS, yyyy, h:MM:ss TT');
            results[i]['ctime'] = dateFormat(results[i]['date_closed'], 'mmmm dS, yyyy, h:MM:ss TT');
            if (diffDays > 0 || results[i]['market_status'] == 'sold') {
                results[i]['status'] = 'open';
                if (results[i]['market_status'] == 'sold') {
                    results[i]['status'] = 'sold';
                }
                else if (results[i]['market_status'] == 'removed') {
                    results[i]['status'] = 'deleted';
                }
                else if (date3 > date2) {
                    results[i]['status'] = 'future';
                }


            }
            else {
                results[i]['status'] = 'closed';
            }
            results[i]['day'] = common.dateMeasure(diffDays);
        }
        results[i]['avatar'] = (results[i]['avatar'] !== null && typeof(results[i]['avatar']) !== 'undefined') ? results[i]['avatar'] : '';
        if (results[i]['sprice'] != null || typeof(results[i]['sprice']) !== 'undefined') {
            results[i]['sprice'] = common.currencyConverter(results[i]['sprice']);
            results[i]['rprice'] = common.currencyConverter(results[i]['rprice']);
            results[i]['wsprice'] = common.currencyConverter(results[i]['wprice'] + results[i]['iprice']);
            results[i]['wprice'] = common.currencyConverter(results[i]['wprice']);
            results[i]['mprice'] = common.currencyConverter(results[i]['mprice']);
            results[i]['iprice'] = common.currencyConverter(results[i]['iprice']);
            results[i]['bprice'] = common.currencyConverter(results[i]['bprice']);
            results[i]['ptitle'] = common.shorten(results[i]['title'], 30);
        }

        req_data[i] = results[i];

    }

    return req_data;
};


exports.projectDetails = function (req, mysql, q, fields, id) {

    $mysqli = {};
    var defered = q.defer();

    strQuery = mysqli.mysqli($mysqli, 55);
    escape_fields = [fields, id];
    //console.log(escape_fields);
    query = mysql.query(strQuery, escape_fields, defered.makeNodeResolver());


    return defered.promise;
};

exports.removeProject = function (req, mysql, q, id) {

    $mysqli = {};
    var defered = q.defer();

    strQuery = mysqli.mysqli($mysqli, 56);
    escape_fields = [id];
    //  console.log(escape_fields);
    query = mysql.query(strQuery, escape_fields, defered.makeNodeResolver());

    return defered.promise;
};

exports.addShipping = function (req, mysql, q) {
    $mysqli = {};
    var defered = q.defer();
    datge = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    strQuery = mysqli.mysqli($mysqli, 139);
    escape_fields = [req.param('id'), req.param('name'), req.param('address'), req.param('country'), req.param('state'), req.param('city'), req.param('email'), req.param('zipcode'), req.param('phone'), datge, req.session.userid]
    //  console.log(escape_fields);
    query = mysql.query(strQuery, escape_fields, defered.makeNodeResolver());

    return defered.promise;
};