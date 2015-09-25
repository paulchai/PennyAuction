var mysql = require('mysql'), data = [], fs = require('fs'), ini = require('ini');
//saving array
exports.app = function () {
    var config_app = ini.parse(fs.readFileSync('./config.ini', 'utf-8'));
    config = config_app['section'];
    delete global;
    global = [];
    global.database = config['database'];
    //console.log(config);
    global.dbconfig = {
        host: global.database.host,
        user: global.database.user,
        password: global.database.password,
        database: global.database.database
    };
    function handleDisconnect() {
        global.connect = mysql.createConnection(global.dbconfig);
        global.connect.connect();
        global.connect.on('close', function (err) {
            handleDisconnect();
        });
        global.connect.on('end', function (err) {
            handleDisconnect();
        });
        global.connect.on('error', function (err) {
            if (err.code === 'PROTOCOL_CONNECTION_LOST') {
                handleDisconnect();
            }
            else {
                throw err;
            }
        });
        global.mysql = global.connect;
    }

    handleDisconnect();

    global.paths = config['common'];
    global.common = config['common'];
    global.general = config['general'];
    global.paypal = config['paypal'];
    global.captcha = config['captcha'];
    global.language = config['language'];
    global.customerio = config['customerio'];
    global.card = config['card'];
    global.facebook = config['facebook'];
    global.linkedin = config['linkedin'];

    global.surl = global.paths.url;
    global.port = global.paths.port;
    global.url = global.surl + ((global.port != '') ? ':' : '') + global.port;
    global.title = global.common.title;
    global.path = global.paths.path;
    global.spath = global.url + '/';
    //data['surl'] += '/node/node1/penny/trunk/';
    global.dpath = global.spath;
    global.externalcss = global.spath + 'css/';
    global.externaljs = global.spath + 'js/';
    global.imgpath = global.url + '/uploads/';

    global.captachapublickey = global.captcha['publickey'];
    global.captachaprivatekey = global.captcha['privatekey'];
    global.referral_bonus = 20;
    global.language_identifier = JSON.parse(fs.readFileSync('./' + global.language['language'] + '_language.json', 'utf-8'));
    if (typeof(global.countries) === 'undefined') {
        common = require('./module/common');
        q = require('q');
        q.all([common.fetchCountries(global.mysql)]).then(function (results) {
            global.countries = results[0][0];
        });
    }
    return global;

};
