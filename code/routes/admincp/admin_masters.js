module.exports.include_masters = function (app,csv,common,q,admin,pagination,config) {
 app.get(['/masters/:action/'], function(req, res){
   common.admincheckLogin(req,res,1);
    delete $arr['menu'];$arr['menu'] =[];
    var action = req.body.action = (typeof(req.param('action')) === 'undefined') ? 'language' : req.param('action');
	$arr['menu'][action+'mastermenu'] = 'active';
    if(action == 'managebid')
     {
           common.tplFile('admincp/managebid_package.tpl');
           common.headerSet(1);
           common.loadTemplateHeader(req,res,$arr);
     }
	 else if(action == 'addbid')
     {
           common.tplFile('admincp/addbid_package.tpl');
           common.headerSet(1);
           common.loadTemplateHeader(req,res,$arr);
     }
	 else if(action == 'bonus')
     {
           common.tplFile('admincp/bonus.tpl');
           common.headerSet(1);
           common.loadTemplateHeader(req,res,$arr);
     }
	 else if(action == 'bonussettings')
     {
           common.tplFile('admincp/bonus_settings.tpl');
           common.headerSet(1);
           common.loadTemplateHeader(req,res,$arr);
     }
	 else if(action == 'deposit')
     {
           common.tplFile('admincp/master_deposits.tpl');
           common.headerSet(1);
           common.loadTemplateHeader(req,res,$arr);
     }
	 else if(action == 'voucher')
     {
           common.tplFile('admincp/master_voucher.tpl');
           common.headerSet(1);
           common.loadTemplateHeader(req,res,$arr);
     }
	 else if(action == 'addvoucher')
     {
           common.tplFile('admincp/add_voucher.tpl');
           common.headerSet(1);
           common.loadTemplateHeader(req,res,$arr);
     }
	 else if(action == 'news')
     {
           common.tplFile('admincp/master_news.tpl');
           common.headerSet(1);
           common.loadTemplateHeader(req,res,$arr);
     }
	 else if(action == 'gateway')
     {
           common.tplFile('admincp/master_gateway.tpl');
           common.headerSet(1);
           common.loadTemplateHeader(req,res,$arr);
     }
	 else if(action == 'emailtemplate')
     {
           common.tplFile('admincp/emailtemplates.tpl');
           common.headerSet(1);
           common.loadTemplateHeader(req,res,$arr);
     }
	 else if(action == 'newsletter')
     {
           common.tplFile('admincp/newsletter.tpl');
           common.headerSet(1);
           common.loadTemplateHeader(req,res,$arr);
     }
	 else if(action == 'modules')
     {
           common.tplFile('admincp/master_modules.tpl');
           common.headerSet(1);
           common.loadTemplateHeader(req,res,$arr);
     }
});
};
