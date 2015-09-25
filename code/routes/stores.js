var express = require('express');
var reload = require('reload');
var sprintf = require('sprintf').sprintf;
var common = require('../module/common');
var session = require('express-session');
var app = express.Router();
var cryptos = require('../module/crypto.js');
var mysqli = require('../module/mysqli');
var q = require('q');
var pagination = require('pagination');

//required js
/*var configure = require('../configure');

//default setters
var config = configure.app();

$arr = {
    config: config
}*/


var stores = require('../module/admin_stores');
var admin = require('../module/admin');
var projects = require('../module/products');

//login router
app.get('/', function (req, res) {

    req.body.jsy = 'sdasdsadas';

    var k = req.param('jsy');
    req.body.page = (typeof(req.param('page')) !== 'undefined') ? req.param('page') : 1;
    q.all([stores.showStores(req, 0), stores.showStores(req, 1)]).then(function (ress) {

        $arr['stores'] = ress[0][0];
        $arr['storescount'] = ress[1][0].length;
        var paginator = new pagination.SearchPaginator({
            prelink: '/stores/',
            current: req.body.page,
            rowsPerPage: 5,
            totalResult: $arr['storescount']
        });
        $arr['pagination_html'] = paginator.render();
        common.tplFile('stores.tpl');
        common.headerSet(1);
        common.loadTemplateHeader(req, res, $arr);
    });
});

app.get('/view', function (req, res) {

        req.body.page = (typeof(req.param('page')) === 'undefined') ? 1 : req.param('page');
        //console.log(req.body.page);
        q.all([admin.userProductSearch(req, config.mysql, q, 0), admin.userProductSearch(req, config.mysql, q, 1)]).then(function (result) {
            $arr['pagination'] = result[1][0].length;
            $arr['projects'] = projects.shortDescribe(result[0][0]);
            var url = require('url');
            var url_parts = url.parse(req.url, true);
            var query = url_parts.query;
            fquery = common.urlparameter(query, {page: ''});
            $arr['search'] = query;
            console.log(result[1][0].length);
            var paginator = new pagination.SearchPaginator({
                prelink: '/stores/view?' + fquery,
                current: req.body.page,
                rowsPerPage: 10,
                totalResult: $arr['pagination']
            });

            $arr['pagination_html'] = paginator.render();
            q.all(stores.showStores(req, 0)).then(function (ress) {
                $arr['stores'] = ress[0][0];
                common.tplFile('stores_view.tpl');
                common.headerSet(1);
                common.loadTemplateHeader(req, res, $arr);
            });
        });
 });


app.get('/search', function (req, res) {
    common.tplFile('stores_search_product.tpl');
    common.headerSet(1);
    common.loadTemplateHeader(req, res, $arr);
});


module.exports = app;
