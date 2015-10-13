var common = require('./common');
var dateFormat = require('dateformat');
var mysqli = require('./mysqli');
exports.allWithdraw = function (req, mysql, q, cnt) {
    $mysqli = {};
    var escape_data = [(req.body.page - 1) * 10];
    msq = 172;
    if (cnt == 1) {
        var escape_data = [];
        msq = 174;
    }
    strQuery = mysqli.mysqli($mysqli, msq);
    var defered = q.defer();

    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};
exports.selectMaxrgt = function (req, mysql, q) {
    $mysqli = {};

    if (req.body.categories == 0) {
        var escape_data = [];
        strQuery = mysqli.mysqli($mysqli, 176);
    }
    else {
        var escape_data = [req.body.categories];
        strQuery = mysqli.mysqli($mysqli, 179);
    }

    var defered = q.defer();
    //datge = dateFormat(new Date(),"yyyy-mm-dd HH:MM:ss");


    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};
exports.getChildCategory = function (req, mysql, q, id) {
    $mysqli = {};
    var escape_data = [id];

    console.log(escape_data);
    strQuery = mysqli.mysqli($mysqli, 263);
    var defered = q.defer();

    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};

exports.updateLftRgtCategories = function (req, mysql, q, lft, rgt, id) {
    $mysqli = {};
    var escape_data = [lft, rgt, id];

    console.log(escape_data);
    strQuery = mysqli.mysqli($mysqli, 264);
    var defered = q.defer();

    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};

exports.deleteCategories = function (req, mysql, q) {
    $mysqli = {};

    var escape_data = [req.param('id'), req.param('id')];

    console.log(escape_data);
    strQuery = mysqli.mysqli($mysqli, 265);
    var defered = q.defer();

    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());

    $mysqli = {};
    var escape_data = [req.param('id')];

    console.log(escape_data);
    strQuery = mysqli.mysqli($mysqli, 266);
    var defered = q.defer();

    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
};

exports.updateLeft = function (req, mysql, q) {
    $mysqli = {};

    strQuery = mysqli.mysqli($mysqli, 178);
    var defered = q.defer();
    //datge = dateFormat(new Date(),"yyyy-mm-dd HH:MM:ss");
    var escape_data = [req.body.mrgt];
    console.log(escape_data);
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};
exports.updateRight = function (req, mysql, q) {
    $mysqli = {};

    strQuery = mysqli.mysqli($mysqli, 177);
    var defered = q.defer();
    //datge = dateFormat(new Date(),"yyyy-mm-dd HH:MM:ss");
    var escape_data = [req.body.mrgt];

    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};
exports.paidWithdraw = function (req, mysql, q) {
    $mysqli = {};

    strQuery = mysqli.mysqli($mysqli, 173);
    var defered = q.defer();
    datge = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    var escape_data = [datge, req.param('id')];

    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};
exports.addAttachment = function (val, mysql, q, pid) {
    $mysqli = {};

    datge = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    strQuery = mysqli.mysqli($mysqli, 163);
    var defered = q.defer();

    var escape_data = [val.name, val.originalname, datge, pid];
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};
exports.deleteAttachment = function (mysql, q, req) {

    if (typeof(req.body.image) !== 'undefined') {
        if (req.body.image.length > 0) {
            var del = req.body.image_id.join().replace(/("|')/g, "");

        }
        else {
            req.body.avatar = '';
            req.body.image = '';
            var del = 0;
        }
    }
    else {
        req.body.avatar = '';
        req.body.image = '';
        var del = 0;
    }
    $mysqli = {'delete': del};
    strQuery = mysqli.mysqli($mysqli, 165);
    var defered = q.defer();

    var escape_data = [req.body.id];
    console.log(escape_data);
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;

};
exports.exportProjectDashboard = function (req, mysql, q) {
    $mysqli = {};
    datge = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    strQuery = mysqli.mysqli($mysqli, 59);
    var defered = q.defer();
    var escape_data = [datge, datge, datge, datge, datge, datge];
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};
exports.saveBlog = function (req, mysql, q) {
    $mysqli = {};

    datge = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");

    var defered = q.defer();
    if (req.body.id <= 0) {
        strQuery = mysqli.mysqli($mysqli, 96);
        var escape_data = [req.param('title'),
            req.param('description'), datge, req.session.userid, 'open'];
    }
    else {
        strQuery = mysqli.mysqli($mysqli, 98);
        var escape_data = [req.param('title'),
            req.param('description'), req.body.id];
    }

    console.log(escape_data);
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};

exports.saveemailTemplate = function (req, mysql, q) {
    $mysqli = {};

    datge = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");

    var defered = q.defer();

    if (req.body.id >= 1) {


        strQuery = mysqli.mysqli($mysqli, 145);
        var escape_data = [req.param('events'),
            req.param('subjects'), req.param('message'), datge, req.body.id];
    }
    else {

        //	event,subject,message,created_on,updated_on,status,user_id

        strQuery = mysqli.mysqli($mysqli, 144);
        var escape_data = [req.param('events'),
            req.param('subjects'), req.param('message'), datge, datge, "active", req.session.userid];
    }

    console.log(escape_data);
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());


    return defered.promise;
};

exports.selblog = function (req, mysql, q) {
    $mysqli = {};

    id = req.param('id');
    strQuery = mysqli.mysqli($mysqli, 97);
    var defered = q.defer();

    var escape_data = [id];

    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};

exports.deleteemail = function (req, mysql, q) {
    $mysqli = {};

    id = req.param('id');
    strQuery = mysqli.mysqli($mysqli, 149);
    var defered = q.defer();

    var escape_data = [id];

    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};

exports.editemail = function (req, mysql, q) {
    $mysqli = {};

    id = req.param('id');
    strQuery = mysqli.mysqli($mysqli, 148);
    var defered = q.defer();

    var escape_data = [id];

    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};

exports.getemail = function (eventId, mysql, q) {
    $mysqli = {};

    id = eventId;
    strQuery = mysqli.mysqli($mysqli, 150);
    var defered = q.defer();

    var escape_data = [id];

    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};


exports.publishBlog = function (req, mysql, q) {
    id = req.param('id');
    if (id > 0) {

        strQuery = mysqli.mysqli($mysqli, 100);
        var defered = q.defer();
        status = 'open';
        if (req.body.action == 'unpublish') {
            status = 'unpublish';
        }
        var escape_data = [status, id];
        console.log(escape_data);

        query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
        return defered.promise;
    }

};
exports.blogupload = function (req, mysql, q) {

    if (typeof(req.files.blog_image) !== 'undefined') {

        $mysqli = {};

        id = req.body.id;

        strQuery = mysqli.mysqli($mysqli, 99);
        var defered = q.defer();

        var escape_data = [(typeof(req.files.blog_image) !== 'undefined') ? req.files.blog_image.originalname : '',
            (typeof(req.files.blog_image) !== 'undefined') ? req.files.blog_image.name : '', id];
        console.log(escape_data);

        query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
        return defered.promise;
    }
};
exports.exportUserDashboard = function (req, mysql, q) {
    $mysqli = {};
    datge = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    strQuery = mysqli.mysqli($mysqli, 60);
    var defered = q.defer();
    var escape_data = [datge, datge, datge, datge, datge, datge];
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};
exports.deleteallreviews = function (req, mysql, q) {
    $mysqli = {};

    id = req.body.id;
    strQuery = mysqli.mysqli($mysqli, 274);
    var defered = q.defer();

    var escape_data = [id];

    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};

exports.allreviews = function (req, mysql, q, count) {
    $mysqli = {};
    var escape_data;
    datge = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    if (count == 1) {
        strQuery = mysqli.mysqli($mysqli, 93);
        escape_data = [];
    }
    else {
        strQuery = mysqli.mysqli($mysqli, 92);
        var page = (req.body.page - 1) * 10;
        escape_data = [page];
    }
    var defered = q.defer();
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};
exports.alldispute = function (req, mysql, q, count) {
    $mysqli = {};
    var escape_data;
    datge = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    if (count == 1) {
        strQuery = mysqli.mysqli($mysqli, 169);
        escape_data = [];
    }
    else {
        strQuery = mysqli.mysqli($mysqli, 168);
        var page = (req.body.page - 1) * 10;
        escape_data = [page];
        //var escape_data =  [];
    }
    var defered = q.defer();
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};
exports.allblog = function (req, mysql, q, count) {
    $mysqli = {};
    var escape_data;
    datge = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    if (count == 1) {
        strQuery = mysqli.mysqli($mysqli, 95);
        escape_data = [];
    }
    else {
        strQuery = mysqli.mysqli($mysqli, 94);
        page = (req.body.page - 1) * 10;
        escape_data = [page];
    }
    var defered = q.defer();
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};

exports.allemail = function (req, mysql, q, count) {
    $mysqli = {};
    var escape_data;
    datge = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    if (count == 1) {
        strQuery = mysqli.mysqli($mysqli, 147);
        escape_data = [];
    }
    else {
        strQuery = mysqli.mysqli($mysqli, 146);
        page = (req.body.page - 1) * 10;
        escape_data = [page];
    }
    var defered = q.defer();


    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};

exports.exportTransactionDashboard = function (req, mysql, q) {
    $mysqli = {};
    datge = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    strQuery = mysqli.mysqli($mysqli, 61);
    var defered = q.defer();
    var escape_data = [datge, datge, datge, datge, datge, datge];
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};
exports.transactionSearch = function (req, mysql, q, count) {
    var dateFormat = require('dateformat');


    mysq = 80;
    where = '';
    where += (typeof(req.param('userid')) !== 'undefined' && req.param('userid') != '') ? ' and i.user_id = "' + req.param('userid') + '"' : where;
    //where += (typeof(req.param('projectid')) !== 'undefined' && req.param('projectid') != '') ? ' and p.project_id = '+req.param('projectid') : where;
    where += (typeof(req.param('projectid')) !== 'undefined' && req.param('projectid') != '') ? 'and ((i.type in ("sold","winner") and i.primary_id = "' + req.param('projectid') + '") OR (i.type in ("bid") and i.primary_id IN (select b.id from bids as b where b.project_id = "' + req.param('projectid') + '")))' : '';
    where += (typeof(req.param('id')) !== 'undefined' && req.param('id') != '') ? ' and i.id = "' + req.param('id') + '"' : where;
    where += (typeof(req.param('status')) !== 'undefined' && req.param('status') != '') ? 'and i.type = "' + req.param('status') + '"' : where;
    if (typeof(req.param('from_date')) !== 'undefined' && req.param('from_date') != '') {
        date1 = dateFormat(new Date(req.param('from_date')), 'yyyy-mm-dd');
        where += ' and i.date_added >= "' + date1 + ' 00:00:00"';
    }
    if (typeof(req.param('to_date')) !== 'undefined' && req.param('to_date') != '') {
        date2 = dateFormat(new Date(req.param('to_date')), 'yyyy-mm-dd');
        where += ' and i.date_added <= "' + date2 + ' 23:59:59"';
    }


    $mysqli = {where: where};
    console.log($mysqli);
    var escape_data = [(req.body.page - 1) * 10];
    if (count == 0) {
        mysq = 81;
        escape_data = [];
    }
    else if (count == 2) {
        mysq = 82;
        escape_data = [];
    }

    strQuery = mysqli.mysqli($mysqli, mysq);
    var defered = q.defer();


    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};
exports.userProductSearch = function (req, mysql, q, count) {
    var dateFormat = require('dateformat');


    mysq = 74;

    where = '';

    status = (typeof(req.query.status) !== 'undefined' && req.query.status != '') ? req.query.status : '';
    if (status != 'delete')
        where = ' and p.market_status != "removed"';

    where += (typeof(req.query.title) !== 'undefined' && req.query.title != '') ? ' and p.title like "%' + req.query.title + '%"' : where;
    where += (typeof(req.query.id) !== 'undefined' && req.query.id != '') ? ' and p.id = ' + req.query.id : where;
    date1 = dateFormat(new Date(), 'yyyy-mm-dd HH:MM:ss');


    if (status == 'open') {
        where += ' and p.date_added <= "' + date1 + '" and p.date_closed >= "' + date1 + '" and market_status="open"';
    } else if (status == 'closed') {
        where += ' and p.date_closed <= "' + date1 + '" and p.market_status != "sold"';
    } else if (status == 'future') {
        where += ' and p.date_added >= "' + date1 + '" and  p.date_closed >= "' + date1 + '"';
    } else if (status == 'sold') {
        where += ' and p.market_status = "sold"';
    } else if (status == 'delete') {
        where += ' and p.market_status = "removed"';
    }
    //if(status == 'seated')
    //{
    //  where += ' and p.auctionType = "seated"';
    //}

    var auctiontype = (typeof(req.body.auctiontype) !== 'undefined' && req.body.auctiontype != '') ? req.body.auctiontype : '';
    if (auctiontype != '')
        where += ' and p.auctionType = "' + auctiontype + '"';

    storeid = (typeof(req.param('storeid')) !== 'undefined' && req.param('storeid') != '') ? req.param('storeid') : 0;
    if (storeid > 0) {
        where += ' and p.storeid = "' + storeid + '"';
    }

    $mysqli = {where: where};
    console.log($mysqli);
    var escape_data = [];
    if (count == 0) {
        mysq = 73;
        escape_data = [(req.body.page - 1) * 10];
    }

    strQuery = mysqli.mysqli($mysqli, mysq);
    var defered = q.defer();


    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};

exports.updateUser = function (req, mysql, q) {
    $mysqli = {};


    strQuery = mysqli.mysqli($mysqli, 54);
    var defered = q.defer();

    var escape_data = [req.body.email, req.body.first_name, req.body.last_name, req.body.aboutme, req.body.avatar, req.body.image, req.body.address1, req.body.address2, req.body.country, req.body.state, req.body.city, req.body.zip, req.body.phone, req.body.id];
    console.log(escape_data);
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};
exports.updateUserStatus = function (req, mysql, q) {
    $mysqli = {};


    strQuery = mysqli.mysqli($mysqli, 69);
    var defered = q.defer();

    var escape_data = [req.body.status, req.body.id];

    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};
exports.updateUserPassword = function (req, mysql, q) {
    $mysqli = {};


    strQuery = mysqli.mysqli($mysqli, 57);
    var defered = q.defer();

    var escape_data = [req.body.password, req.body.salt, req.body.id];

    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};
exports.listUserCategories = function (req, mysql, q) {
    $mysqli = {};
    var defered = q.defer();
    strQuery = mysqli.mysqli($mysqli, 117);
    escape_fields = [req.body.id];
    query = mysql.query(strQuery, escape_fields, defered.makeNodeResolver());
    return defered.promise;
};
exports.managecategories = function (req, mysql, q, mcat) {
    $mysqli = {};
    var defered = q.defer();

    q.all(this.checkProfilecategory(req, mysql, q, mcat)).then(function (results) {
        if (results[0].length == 0) {
            strQuery = mysqli.mysqli($mysqli, 116);
            escape_fields = [req.body.id, mcat]
            query = mysql.query(strQuery, escape_fields, defered.makeNodeResolver());
        }

    });

    return defered.promise;
};

exports.checkProfilecategory = function (req, mysql, q, userCid) {
    $mysqli = {};
    var defered = q.defer();
    strQuery = mysqli.mysqli($mysqli, 114);
    escape_fields = [req.body.id, userCid]
    query = mysql.query(strQuery, escape_fields, defered.makeNodeResolver());
    return defered.promise;
};

exports.removeCategories = function (req, mysql, q) {
    var cateArray = '';
    if (typeof(req.body.categories) == 'undefined')
        implodeats = '0';
    else {
        cateArray = req.body.categories;
        implodeats = cateArray.join(',');
    }
    //	 console.log(33333333333);
    $mysqli = {};
    var defered = q.defer();
    strQuery = mysqli.mysqli($mysqli, 115);
    escape_fields = [req.body.id, implodeats]
    query = mysql.query(strQuery, escape_fields, defered.makeNodeResolver());
    return defered.promise;
};
exports.editUser = function (req, mysql, q) {
    $mysqli = {};


    strQuery = mysqli.mysqli($mysqli, 25);
    var defered = q.defer();

    var escape_data = [['email', 'first_name', 'last_name', 'balance', 'id', 'avatar', 'aboutme', 'password_hash', 'password_salt', 'status', 'image', 'address1', 'address2', 'country', 'state', 'city', 'zip', 'phone'], req.body.id];

    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};

exports.userList = function (req, mysql, q, count) {
    $mysqli = {};
    var escape_data = '';

    datge = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    page = (req.body.page - 1) * 10;
    if (req.body.action == 'all' && count == 1) {
        strQuery = mysqli.mysqli($mysqli, 64);
        escape_data = [page];
    }
    else if (req.body.action == 'cancel' && count == 1) {
        strQuery = mysqli.mysqli($mysqli, 63);
        escape_data = ['unsubscribe', 'deactivate', page];
    }
    else if (count == 1) {
        strQuery = mysqli.mysqli($mysqli, 62);
        escape_data = [req.body.action, page];
    }

    if (req.body.action == 'all' && count == 0) {
        strQuery = mysqli.mysqli($mysqli, 67);
        escape_data = [];
    }
    else if (req.body.action == 'cancel' && count == 0) {
        strQuery = mysqli.mysqli($mysqli, 66);
        escape_data = ['unsubscribe', 'deactivate'];
    }
    else if (count == 0) {
        strQuery = mysqli.mysqli($mysqli, 65);
        escape_data = [req.body.action];
    }
    var defered = q.defer();

    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};
exports.saveProduct = function (req, mysql, q) {

    $mysqli = {};
    strQuery = mysqli.mysqli($mysqli, 72);

    var defered = q.defer();
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
    var escape_data = [req.body.title,
        req.param('description'),
        (typeof(req.files.product_image) !== 'undefined') ? newfilename.name : req.body.avatar[0],
        (typeof(req.files.product_image) !== 'undefined') ? newfilename.originalname : req.body.image[0],
        req.param('cid'),
        req.param('tags'),
        common.currencyConverter(req.param('shipping_fee')),
        req.param('shipping_description'),
        (typeof(req.param('buynow')) === 'undefined') ? 0 : req.param('buynow'),
        (typeof(req.param('feature')) === 'undefined') ? 0 : req.param('feature'),
        dateFormat(new Date(req.body.date_added), "yyyy-mm-dd HH:MM:ss"),
        dateFormat(new Date(req.body.date_closed), "yyyy-mm-dd  HH:MM:ss"),
        common.currencyConverter(req.body.bprice),
        common.currencyConverter(req.body.mprice),
        (typeof(req.param('auctionType')) === 'undefined') ? 'penny' : req.param('auctionType'),
        (typeof(req.param('seats')) === 'undefined') ? 0 : req.param('seats'),
        (typeof(req.param('seatAmount')) === 'undefined') ? 0 : req.param('seatAmount'),
        req.body.id];
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());

    return defered.promise;
};
exports.userListSearch = function (req, mysql, q, count) {
    //$mysqli =  {};

    $mysqli = {
        email: req.body.email,
        last_name: req.body.last_name,
        status: req.body.status,
        first_name: req.body.first_name
    };
    page = (req.body.page - 1) * 10;
    escape_data = [];
    if (count == 0) {
        strQuery = mysqli.mysqli($mysqli, 71);
    }
    else {
        strQuery = mysqli.mysqli($mysqli, 70);
        escape_data = [page];
    }
    var defered = q.defer();

    console.log(escape_data);
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};
exports.addUser = function (req, mysql, q, count) {
    datge = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    var md5 = require('MD5');
    var password_salt = '12345';
    var password = md5(md5(req.body.password) + password_salt);
    console.log(req.body);
    $mysqli = {
        email: req.body.email,
        role: 1,
        created_at: datge,
        password_hash: password,
        password_salt: password_salt
    };

    strQuery = mysqli.mysqli($mysqli, 11);


    var defered = q.defer();
    escape_data = [req.body.first_name, req.body.last_name];
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());

    return defered.promise;
};
exports.categoriesList = function (req, mysql, q, count) {
    $mysqli = {};

    escape_data = [];
    if (count == 1) {
        escape_data = [(req.body.page - 1) * 10];
        strQuery = mysqli.mysqli($mysqli, 75);
    }
    else {
        strQuery = mysqli.mysqli($mysqli, 76);
        escape_data = [];
    }
    var defered = q.defer();

    console.log(escape_data);
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};
exports.selectCategories = function (req, mysql, q) {
    $mysqli = {};

    escape_data = [req.body.id];

    strQuery = mysqli.mysqli($mysqli, 77);

    var defered = q.defer();
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};
exports.selectParticularParentCategories = function (req, mysql, q, id) {
    $mysqli = {};

    escape_data = [id];

    strQuery = mysqli.mysqli($mysqli, 200);
    //console.log(strQuery);
    //console.log(escape_data);
    var defered = q.defer();
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};
var q = req = mysql = '';
exports.rebuild_category_tree = function (data, cb) {
    q = this.q;
    req = this.req;
    mysql = this.mysql;
    left = data.lft;
    //left = data.lft;
    //console.log(data);
    cid = data['id'];
    //right = left + 1;
    self = require('./admin');

    var async = require('async');

    q.all([self.selectParticularParentCategories(req, mysql, q, data.id)]).then(function (result) {
        addTasksToProject = self.rebuild_category_trees;

        var k = result[0][0].length;
        var m = 0;

        if (k == 0) {
            cb(null);
        }
        //cb(null);
        async.forEach(result[0][0], addTasksToProject, function (err) {

            console.log(data);
            //data.lft = data.rgt+1;


        });
    });
    //return right + 1;
};
exports.rebuild_category_trees = function (data, cb) {
    q = this.q;
    req = this.req;
    mysql = this.mysql;
    left = data.lft;
    //left = data.lft;
    //console.log(data);
    cid = data['id'];
    //right = left + 1;
    self = require('./admin');

    var async = require('async');

    q.all([self.selectParticularParentCategories(req, mysql, q, data.id)]).then(function (result) {
        var k = result[0][0].length;
        var m = 0;

        if (k == 0) {
            cb(null);
        }
        //cb(null);
        async.forEach(result[0][0], addTasksToProject, function (err) {

            console.log(data);
            //data.lft = data.rgt+1;


        });
    });
    //return right + 1;
};
exports.categorySave = function (req, mysql, q) {
    $mysqli = {};
    id = req.body.id;
    datge = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    title = req.body.title;
    description = req.body.description;
    if (id == 0) {
        escape_data = [title, description, datge, datge, req.body.mrgt + 1, req.body.mrgt + 2, req.body.categories];
        query = 78;
    }
    else {
        escape_data = [title, description, datge, id];
        query = 79;
    }
    console.log(escape_data);
    strQuery = mysqli.mysqli($mysqli, query);

    var defered = q.defer();
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;

};


exports.addbalance = function (req, mysql, q, from_ref) {
    $mysqli = {};
    strQuery = mysqli.mysqli($mysqli, 28);
    var defered = q.defer();
    escape_data = [global.general.referral_bonus, from_ref];
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};

exports.savecoupon = function (req, q, mysql) {

    $mysqli = {};
    //var mysql = config.mysql;
    strQuery = mysqli.mysqli($mysqli, 133);
    var defered = q.defer();
    datge = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    escape_data = [req.body.type, req.body.amount, req.body.code, datge];
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};

exports.checkcoupon = function (req, q, mysql) {

    $mysqli = {};
    //var mysql = config.mysql;
    strQuery = mysqli.mysqli($mysqli, 134);
    var defered = q.defer();
    escape_data = [req.body.code];
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    query.on('error', function (err) {
        throw err;
    });
    return defered.promise;
};

exports.listcoupons = function (req, q, mysql, iscount) {

    var page = (typeof(req.param('page')) !== 'undefined') ? req.param('page') : 0;
    page = (page > 0) ? (page - 1) * 5 : 0;

    if (iscount == 1)
        $mysqli = {limit: '', field: 'id'};
    else
        $mysqli = {limit: 'limit ' + page + ',5', field: '*'};


    //var mysql = config.mysql;
    strQuery = mysqli.mysqli($mysqli, 136);
    var defered = q.defer();
    escape_data = [];
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};

exports.removeCoupon = function (req, q, mysql) {
    $mysqli = {};
    var defered = q.defer();

    strQuery = mysqli.mysqli($mysqli, 137);
    datge = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    escape_data = [datge, req.body.code];

    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;

};

exports.updateCoupon = function (req, q, mysql) {
    $mysqli = {};
    var defered = q.defer();

    strQuery = mysqli.mysqli($mysqli, 138);
    datge = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    escape_data = [req.body.type, req.body.amount, datge, req.body.code];

    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;

};


exports.importProducts = function (req, mysql, q, products) {

    $mysqli = {};
    strQuery = mysqli.mysqli($mysqli, 14);

    var defered = q.defer();
    newfilename = {};
    newfilename.name = '';
    newfilename.originalname = '';
    /*    if(typeof(req.files.product_image) !== 'undefined')
     {
     if(typeof(req.files.product_image[0]) === 'undefined')
     {

     newfilename.name = req.files.product_image.name;
     newfilename.originalname = req.files.product_image.originalname;
     }
     else
     {
     newfilename.name = req.files.product_image[0].name;
     newfilename.originalname = req.files.product_image[0].originalname;
     }
     }
     console.log(newfilename);*/
    datge = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    var escape_data = [products.project_title,
        products.Product_Description,
        '',
        products.Photo,
        products.Catgeory,
        products.Tag,
        (typeof(req.session) !== 'undefined') ? req.session.userid : 0,
        common.currencyConverter(products.Shipping_Amount),
        products.Shipping_Information,
        datge,
        products.Is_Buy_Now,
        products.Is_Featured,
        common.currencyConverter(0.01),
        common.currencyConverter(products.Reserve_price),
        dateFormat(new Date(products.Start_Date), "yyyy-mm-dd HH:MM:ss"),
        dateFormat(new Date(products.Ending_Date), "yyyy-mm-dd") + ' 23:59:59',
        1,
        common.currencyConverter(products.Buynow_price),
        common.currencyConverter(products.Market_price),
        common.currencyConverter(global.general.bidincrement),
        common.currencyConverter(0.01),
        "penny",
        0, 0, 0];
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());

    return defered.promise;
};

exports.updateImageFromUrl = function (req, mysql, q, insertId) {

    $mysqli = {};
    var defered = q.defer();

    strQuery = mysqli.mysqli($mysqli, 140);
    escape_data = [insertId + '.png', insertId];

    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;

};