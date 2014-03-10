
var exec = require('child_process').exec;
var config = require('../config');
var log = function(message) {
  var now = new Date().toISOString();
  console.log(now + ' ' + message);
};
/*
 * GET /update 
 */
var updating = false;
exports.update = function(req, res){
  if (updating) {
    return onError('update in progress');
  }
  updating = true;

  var start = Date.now();

  var onComplete = function() {
    var end = Date.now();
    var now = new Date().toISOString();
    log('Updated');
    res.send({
      'updated': now,
      'elapsed': end - start
    });
    updating = false;
  };

  var onError = function(err) {
    log('Error: ' + err);
    res.send({'error': err});
    updating = false;
  };

  exec('cd ' + config.path + ' && git pull && make build', function(err, stdout, stderr) {
    if (err) {
      onError('could not update: ' + err);
    } else {
      onComplete();
    }
  });
  onComplete();
};
