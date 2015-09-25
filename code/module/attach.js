var fs = require('fs');
/*var configure =  require('../configure');
 config = configure.app();*/
exports.save = function (obj, req, res) {


    var isupload = false, file = '', path = "", dest = "";
    /*if(obj == 'product' && typeof(req.files.product_image) !== 'undefined')
     {

     var file = req.files.product_image;
     var path = config.path+'/uploads/'+file.name;
     var dest = config.path+'/uploads/product/'+file.name;
     var isupload = true;
     }*/
    if (typeof(req.files.product_image) !== 'undefined') {
        file = req.files.product_image;
    }
    if (typeof(req.files.profile_image) !== 'undefined') {
        file = req.files.profile_image;
    }
    if (typeof(req.files.blog_image) !== 'undefined') {
        file = req.files.blog_image;
    }
    if (typeof(req.files.product_image[0]) == "undefined") { // Single file upload
        if (file != '') {
            path = config.path + 'public/uploads/' + file.name;
            dest = config.path + 'public/uploads/' + obj + '/' + file.name;
            isupload = true;
            if (isupload) {
                fs.rename(path, dest, function (err) {
                    console.log(err);
                    fs.unlink(path, function (err) {
                    });
                });
            }
        }
    } else { // Multi dimensional array
        for (var i = 0; i < file.length; i++) { // Iterate through each image and save it in appropriate folder
            if (file[i] != '') {
                path = config.path + 'public/uploads/' + file[i].name;
                dest = config.path + 'public/uploads/' + obj + '/' + file[i].name;
                isupload = true;
                if (isupload) {
                    fs.rename(path, dest, function (err) {
                        console.log(err);
                        fs.unlink(path, function (err) {
                        });
                    });
                }
            }
        }
    }
};
