var nsmarty = require('nsmarty');
var scriptfile = '';
var headered = 1;
var q = require('q');
var mysqli = require('./mysqli');
var module = require('../module');
var dateFormat = require('dateformat');
var sortBy = require('sort-by');
exports.allCategoriesList = function (req, mysql, q) {
    $mysqli = {};
    strQuery = mysqli.mysqli($mysqli, 175);
    //console.log(strQuery);
    var defered = q.defer();
    var escape_data = [];
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());

    return defered.promise;
};
exports.admincpId = function (req, mysql, q) {
    $mysqli = {};
    strQuery = mysqli.mysqli($mysqli, 166);
    //console.log(strQuery);
    var defered = q.defer();
    var escape_data = [['id']];
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());

    return defered.promise;
};
exports.urlparameter = function (query, leave) {
    var s = '';
    // console.log(query);
    for (var i in query) {
        // console.log(i);
        if (i != '') {
            s += i + '=' + query[i] + '&';
        }


    }
    for (var k in leave) {
        // console.log(k);
        // console.log(k+'='+query[i]+'&');
        if (k != '') {
            s = s.replace(new RegExp(k + '=' + query[i] + '&', 'g'), '');
        }


    }
    //console.log(s);
    return s;
};
exports.fetchCountries = function (mysql) {
    $mysqli = {};
    strQuery = mysqli.mysqli($mysqli, 273);
    var defered = q.defer();
    var escape_data = [0];
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());

    return defered.promise;
};
exports.processIndex = function (row, req, res, $arr) {

    $arr.projects = row;
    //console.log($arr.projects);

    $arr.loged = req.session;

    $arr.banners = ["banner_iphone-33235.jpg", "banner_LV-57645.jpg", "banner_ipad-40447.jpg", "banner_note5-14858.jpg" ];

    if ($arr['pagetitle'] == '') {
        module.index(req, res, $arr);
    }
    else {
        module.other(req, res, $arr);
    }

};

exports.processIndexajax = function (row, req, res, $arr) {

    $arr.proj = row.projects;
    module.otherAjax(req, res, $arr);
    //console.log($arr.proj);


};

exports.checkLogin = function (req, res, id) {
    //console.log(req.session.userid+'as');
    if (typeof(req.session) === 'undefined' && id == 0) {
        res.writeHead(302, {
            'Location': '/login'
            //add other headers here...
        });
        res.end();
        return false;
    }
    else if (typeof(req.session.userid) === 'undefined' && id == 0) {
        res.writeHead(302, {
            'Location': '/login'
            //add other headers here...
        });
        res.end();
        return false;
    }
    else {
        if (req.session.userid > 0 && id == 1) {
            res.writeHead(302, {
                'Location': '/'
                //add other headers here...
            });
            res.end();
            return false;
        }
    }

};
exports.admincheckLogin = function (req, res, id) {
    //console.log(333333);console.log(req.session.admin);return 0;
    if (typeof(req.session) === 'undefined' && id == 0) {
        res.writeHead(302, {
            'Location': '/admin/login'
            //add other headers here...
        });
        res.end();
        return false;
    }
    else if (typeof(req.session.userid) === 'undefined' && id == 0) {
        res.writeHead(302, {
            'Location': '/admin/login'
            //add other headers here...
        });
        res.end();
        return false;
    }
    else {
        if (req.session.userid > 0 && id == 1 && req.session.admin == 1) {

        }
        else {
            delete req.session.userid;
            delete req.session.email;
            delete req.session.username;
            req.session.destroy();
            delete req.session;
            // this.admincheckLogin(req,res,0);

            res.writeHead(302, {
                'Location': '/admin/login/'
                //add other headers here...
            });
            res.end();
            return false;
        }
    }


};
exports.checkLoginajax = function (req, res, id) {
    //console.log(req.session.userid+'as');
    // return false;
    if (typeof(req.session) === 'undefined' && id == 0) {
        return false;
    }
    else return !(typeof(req.session.userid) === 'undefined' && id == 0);

};
exports.productCategories = function (mysql, q) {
    $mysqli = {};
    strQuery = mysqli.mysqli($mysqli, 5);
    //console.log(strQuery);
    var defered = q.defer();

    query = mysql.query(strQuery, defered.makeNodeResolver());

    return defered.promise;
};
exports.jetportamount = function (mysql, q) {
    $mysqli = {};
    strQuery = mysqli.mysqli($mysqli, 'jetport');
    //console.log(strQuery);
    var defered = q.defer();

    query = mysql.query(strQuery, defered.makeNodeResolver());

    return defered.promise;
};
exports.tplFile = function (file) {
    this.scriptfile = file;
};

exports.headerSet = function (data) {

    this.headered = data;
};
exports.ajaxjson = function (res, data) {
    res.setHeader('Content-Type', 'application/json');
    res.end(JSON.stringify(data));
};

exports.loadTemplateHeader = function (req, res, arr) {
    arr.file = this.scriptfile;
    arr.headered = this.headered;
    arr.loged = req.session;

    if (typeof(req.session.themeno) !== 'undefined') {
        // console.log("session theme set");
        arr.themeno = req.session.themeno;
    }
    else {
        // console.log("session theme not set");
        req.session.themeno = 0;
        arr.themeno = req.session.themeno;
    }

    if (typeof(req.session.autologin) !== 'undefined') {
        // console.log("session theme set");
        arr.autologin = req.session.autologin;
    }
    else {
        //console.log("session theme not set");
        req.session.autologin = 0;
        arr.autologin = req.session.autologin;
    }


    arr._phrase = global.language_identifier.language.phrases;
    //console.log(arr._);
    uid = 0;
    user = require('./user');
    if (typeof(req.session) !== 'undefined') {
        if (typeof(req.session.userid) !== 'undefined') {
            uid = req.session.userid;
        }
    }
    arr.currencyconvertor = this.currencyConverter;
    q.all([
        this.productCategories(arr.config.mysql, q),
        user.userInfo(req, arr.config.mysql, q, uid, ['balance', 'reserve_amount']),
        this.jetportamount(arr.config.mysql,q),
        user.userBidCount(req, arr.config.mysql, q, uid)]).then(function (results) {

        //var query = require('url').parse(req.url,true).query;
        //console.log(req.url);
        var originalurl = req.originalUrl;
        arr.pageofjs = req.originalUrl;
        nsmarty.clearCache(arr.file);
        if (originalurl.indexOf("/dashboard") > -1 || originalurl == '/profile_settings')

            arr.pageofjs = '/dashboard/';
        //console.log(arr.pageofjs);
        var datam = results[0][0];
        if (originalurl == '/profile_settings') {
            arr.category = datam.sort(sortBy('name'));
        } else {
            arr.category = datam;
        }
        arr.userbalance = [];
        if (results[1][0].length > 0) {
            arr.userbalance = results[1][0][0];
        }
        if (uid > 0) {

            arr.userbalance.ledger = parseFloat(results[1][0][0]['balance'] - results[1][0][0]['reserve_amount']).toFixed(2);
            arr.userbalance.balance = results[1][0][0]['balance'];
        }
        else {
            arr.userbalance = [];
            //arr.userbalance.ledger = arr.userbalance.balance = 0;
        }

        arr.jetport = results[2][0][0]['amount'];

        if (uid > 0 && results[3][0][0]['noofbid'] > 0 && arr.jetport > 0) {
            arr.userbalance.jetport = Math.round(results[3][0][0]['noofbid'] / 1000 * 5 * arr.jetport);
        }

        nsmarty.tpl_path = arr.config.path + '/templates/';
        //console.log(2);
        nsmarty.clearCache(arr.file);
        //console.log(this.scriptfile);
        if (!arr.headered) {
            function ajaxjsonrun(data) {
                res.setHeader('Content-Type', 'application/json');
                res.end(JSON.stringify({html: data}));
            }

            stream = nsmarty.assigndata(arr.file, arr, ajaxjsonrun);

        }
        else {
            function onlyUnique(value, index, self) {
                return self.indexOf(value) === index;
            }

            delete defaultcss;
            defaultcss = ['parsley'];

            if (typeof(arr['externalcss']) !== 'undefined') {

                arr['external2css'] = arr['externalcss'].concat(defaultcss).filter(onlyUnique);
                delete arr['externalcss'];
            }
            else {

                arr['external2css'] = defaultcss;
            }
            delete defaultjs;
            defaultjs = ['parsley'];

            if (typeof(arr['externaljs']) !== 'undefined') {

                arr['external2js'] = arr['externaljs'].concat(defaultjs).filter(onlyUnique);
                delete arr['externaljs'];
            }
            else {

                arr['external2js'] = defaultjs;
            }

            //console.log('pandi');
            //console.log(req.query);
            if (req.query)
                arr.get = req.query;

            //login remember me cookies
            if (!req.cookies.username) {
                arr.remembermeuser = '';
            }
            else {
                arr.remembermeuser = req.cookies.username;
            }

            // console.log(arr.get );
            res.setHeader('Content-Type', 'text/html; charset=UTF-8');
            arr.serverdate = dateFormat(new Date(), "yyyy/mm/dd HH:MM:ss");
            arr.seated = req.app.get('seated');
            arr.cusdisable = true;
            //console.log('pandian  ips'); console.log(req.url);
            stream = nsmarty.assign(arr.file, arr);

            stream.pipe(res);


        }
    });
};
exports.currencyConverter = function (data) {
    return parseFloat(data).toFixed(2);
};
exports.shorten = function (data, num) {
    var length = data.length;
    if (length > num) {
        return data.substring(0, num) + '...';
    }
    return data;
};
//var Splitter = require('split_er');
exports.dateMeasure = function (ms) {
    var d, h, m, s;
    s = Math.floor(ms / 1000);
    m = Math.floor(s / 60);
    s = s % 60;
    h = Math.floor(m / 60);
    m = m % 60;
    d = Math.floor(h / 24);
    h = h % 24;
    m = (m < 10) ? '0' + m : m;
    h = (h < 10) ? '0' + h : h;
    s = (s < 10) ? '0' + s : s;
    d = (d < 10) ? '0' + d : d;
    return d + ':' + h + ':' + m + ':' + s;
};
String.prototype.capitalizeFirstLetter = function () {
    return this.charAt(0).toUpperCase() + this.slice(1);
};