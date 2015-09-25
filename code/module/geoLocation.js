/**
 * Created by dinesh on 21/09/15.
 */
var mysql = require('mysql'), q = require('q'), common = require('../module/common'), mysqli = require('./mysqli');

module.exports = (function () {
    var geoLocation = function (options) {
        options = options || {};
        this.geoLocation = new geoLocation(options);
        this.geoLocation.country = options.refId || false;
        this.geoLocation = '';
    };
    geoLocation.getStateOrProvince = function (countryCode) {
        $mysqli = {};
        strQuery = mysqli.mysqli($mysqli, 275);
        //console.log(strQuery);
        var defered = q.defer();
        var escape_data = [countryCode];
        query = global.mysql.query(strQuery, escape_data, defered.makeNodeResolver());

        return defered.promise;
    };
    return geoLocation;
})();