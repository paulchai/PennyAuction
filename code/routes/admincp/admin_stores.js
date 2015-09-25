module.exports.include_stores = function (app, csv, common, q, admin, pagination, config) {
    var stores = require('../../module/admin_stores');
    var pagination = require('pagination');

    app.get(['/stores/:action/', '/stores/:action/:id'], function (req, res) {
        common.admincheckLogin(req, res, 1);
        delete $arr['menu'];
        $arr['menu'] = [];
        var action = req.body.action = (typeof(req.param('action')) === 'undefined') ? 'language' : req.param('action');
        if (action == 'new') {
            $arr['menu']['addstore'] = 'active';
            common.tplFile('admincp/stores.tpl');
            common.headerSet(1);
            common.loadTemplateHeader(req, res, $arr);
        }
        else if (action == 'list') {
            $arr['menu']['liststores'] = 'active';
            req.body.page = (typeof(req.param('page')) !== 'undefined') ? req.param('page') : 1;
            q.all([stores.showStores(req, 0), stores.showStores(req, 1)]).then(function (ress) {

                $arr['stores'] = ress[0][0];
                $arr['storescount'] = ress[1][0].length;
                var paginator = new pagination.SearchPaginator({
                    prelink: '/admincp/stores/list/',
                    current: req.body.page,
                    rowsPerPage: 5,
                    totalResult: $arr['storescount']
                });
                $arr['pagination_html'] = paginator.render();
                common.tplFile('admincp/manage_stores.tpl');
                common.headerSet(1);
                common.loadTemplateHeader(req, res, $arr);
            });
        }

        else if (action == 'delete') {

            req.body.id = (typeof(req.param('id')) !== 'undefined') ? req.param('id') : 0;
            stores.deleteStore(req);
            res.redirect(config.url + '/admincp/stores/list');
        }

        else if (action == 'edit') {
            $arr['menu']['liststores'] = 'active';
            req.body.id = (typeof(req.param('id')) !== 'undefined') ? req.param('id') : 0;
            q.all(stores.showStores(req, 0, req.body.id)).then(function (ress) {
                $arr['stores'] = ress[0][0];
                common.tplFile('admincp/stores.tpl');
                common.headerSet(1);
                common.loadTemplateHeader(req, res, $arr);
            });
        }

        else if (action == 'view') {
            $arr['menu']['liststores'] = 'active';
            req.body.id = (typeof(req.param('id')) !== 'undefined') ? req.param('id') : 0;
            q.all(stores.showStores(req, 0, req.body.id)).then(function (ress) {
                $arr['stores'] = ress[0][0];
                common.tplFile('admincp/stores_view.tpl');
                common.headerSet(1);
                common.loadTemplateHeader(req, res, $arr);
            });
        }
    });


    app.post(['/stores/addEdit/'], function (req, res) {
        common.admincheckLogin(req, res, 1);
        req.body.cid = 0;
       // req.body.storeid = 0;
        if ((req.body.name) && (req.body.description)) {

            req.body.storeid = (typeof(req.body.storeid) !== 'undefined') ? req.body.storeid : 0;
            if(req.body.storeid > 0) {
                q.all(stores.updateStore(req)).then(function (result) {
                    stores.deleteCategories(req);
                    var async = require('async');
                    async.each(req.body.categories, function (cid, callback) {
                        req.body.cid = cid;
                        //req.body.storeid = result[0].insertId;
                        q.all(stores.addCategories(req)).then(function (res) {
                            callback();
                        });
                    }, function (err) {
                        // if any of the file processing produced an error, err would equal that error
                        if (err) {
                            // One of the iterations produced an error.
                            // All processing will now stop.
                            // console.log('A file failed to process');
                        } else {
                            res.redirect(config.url + '/admincp/stores/list');
                        }
                    });

                });
            }
            else
            {
                q.all(stores.addStore(req)).then(function (result) {
                    //stores.deleteCategories(req);
                    var async = require('async');
                    async.each(req.body.categories, function (cid, callback) {
                        req.body.cid = cid;
                        req.body.storeid = result[0].insertId;
                        q.all(stores.addCategories(req)).then(function (res) {
                            callback();
                        });
                    }, function (err) {
                        // if any of the file processing produced an error, err would equal that error
                        if (err) {
                            // One of the iterations produced an error.
                            // All processing will now stop.
                           // console.log('A file failed to process');
                        } else {
                            res.redirect(config.url + '/admincp/stores/list');
                        }
                    });

                });
            }
        }
        else
            res.end('error');

    });


};
