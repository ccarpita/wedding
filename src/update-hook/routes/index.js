
var exec = require('child_process').exec;
var config = require('../config');

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
    res.send({
      'updated': Date.now(),
      'elapsed': end - start
    });
    updating = false;
  };

  var onError = function(err) {
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
