//installed js
var http = require('http');
var express = require('express');
var session = require('express-session');
var path = require('path');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var multer = require('multer');
var auctionsoftware = require('./auctionsoftware');

//required js
configure = require('./configure');

//default setters
config = configure.app();

$arr = {
    config: config
};
//require runner
var app = express();
app.use(require('express-domain-middleware'));


app.use(multer({dest: __dirname + "/public/uploads/"}));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));

app.use(cookieParser());
app.use(session({
    secret: 'QWERTY1234567890QWERTY', cookie: {maxAge: 60000000},
    resave: true,
    saveUninitialized: true
}));

app.use(express.static(path.join(__dirname, 'public')));
app.use(auctionsoftware.auctionsoftware());

//configuration settings
app.set('seated', true);

// error handler
app.use(function (err, req, res, next) {
    console.error('An error occurred :', err.message);
    var common = require('./module/common');
    common.tplFile('error.tpl');
    common.headerSet(1);
    common.loadTemplateHeader(req, res, $arr);
    res.send(500);
});

var index = require('./routes/index'),
    login = require('./routes/login'),
    register = require('./routes/register'),
    product = require('./routes/product'),
    packages = require('./routes/packages'),
    test = require('./routes/test'),
    dashboard = require('./routes/dashboard'),
    profile_settings = require('./routes/profile_settings'),
    admincp = require('./routes/admincp/index'),
    facebook = require('./routes/facebook'),
    twitter = require('./routes/twitter'),
    linked = require('./routes/linked'),
    admincplogin = require('./routes/admincp/login'),
    stores = require('./routes/stores');

app.use('/', index);
app.use('/login', login);
app.use('/register', register);
app.use('/index', index);
app.use('/product', product);
app.use('/package', packages);
app.use('/dashboard', dashboard);
app.use('/test', test);
app.use('/profile_settings', profile_settings);
app.use('/facebook', facebook);
app.use('/twitter', twitter);
app.use('/linked', linked);
app.use('/admincp', admincp);
app.use('/admin', admincplogin);
app.use('/stores', stores);
//$arr.categories = module.categories(config.mysql);

//index router

// error handlers

// development error handler
// will print stacktrace

module.exports = app;
var server = http.createServer(app);
server.listen(8080);

// use socket.io
var io = require('socket.io').listen(server);
//turn off debug
io.set('log level', 1);
// define interactions with client
io.sockets.on('connection', function (socket) {    //send data to client

    socket.on('bidAddtime', function (msg) {
        //console.log(msg);
        io.sockets.emit('bidAddtime', msg);
        //console.log('#my'+msg);
    });

    //autoBid.socetio = io.sockets;
    /*
     if(typeof(autoBidVariable) =='undefined')
     {


     autoBidVariable = setInterval(function()
     {
     // io.sockets.emit('pandi','pandian');
     autoBid.deal(io.sockets);
     },6000);
     } */
    emittosocket = io.sockets;
    var autoBid = require('./routes/autobid');
    var cron = require('./routes/cron');
});
