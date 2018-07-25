
var datacenter = '';

var init = function (configEs) {
    datacenter = configEs.datacenter || ''
}

var counters = function (key, value, ts, bucket) {
    var listKeys = key.split('.');
    var act = listKeys.slice(3, listKeys.length).join('.');
    bucket.push({
		"dc": datacenter,
		"application": listKeys[0] || '',
		"host":listKeys[1] || '',
		"metric_type": 'C',
		"account_id":listKeys[2] || '',
		"metric":act || '',
		"val":value,
		"@timestamp": ts
	});
	return 1;
}

var gauges = function (key, value, ts, bucket) {
    var listKeys = key.split('.');
    var act = listKeys.slice(3, listKeys.length).join('.');
    bucket.push({
        "dc": datacenter,
		"application": listKeys[0] || '',
		"host":listKeys[1] || '',
		"metric_type": 'G',
		"account_id":listKeys[2] || '',
		"metric":act || '',
		"val":value,
		"@timestamp": ts
	});
	return 1;
}

var timers = function (key, series, ts, bucket) {
    var listKeys = key.split('.');
    var act = listKeys.slice(3, listKeys.length).join('.');
    for (keyTimer in series) {
      bucket.push({
		"application": listKeys[0] || '',
		"host":listKeys[1] || '',
		"metric_type": 'D',
		"account_id":listKeys[2] || '',
		"metric":act || '',
		"val":series[keyTimer],
		"@timestamp": ts
	 });
    }
	return series.length;
}

var timer_data = function (key, value, ts, bucket) {
    var listKeys = key.split('.');
    var act = listKeys.slice(3, listKeys.length).join('.');
    value["dc"] = datacenter;
    value["@timestamp"] = ts;
    value["application"]  = listKeys[0] || '';
    value["host"] = listKeys[1] || '';
    value["metric_type"] = 'T';
    value["account_id"] = listKeys[2] || '',
    value["metric"] = act || '';
    if (value['histogram']) {
      for (var keyH in value['histogram']) {
        value[keyH] = value['histogram'][keyH];
      }
      delete value['histogram'];
    }
    bucket.push(value);
}

exports.counters   = counters;
exports.timers     = timers;
exports.timer_data = timer_data;
exports.gauges     = gauges;
exports.init       = init;
