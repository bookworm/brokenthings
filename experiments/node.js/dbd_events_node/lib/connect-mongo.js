
/*!
 * Connect - Mongo
 * Copyright(c) 2010 Vladimir Dronnikov <dronnikov@gmail.com>
 * MIT Licensed
 */

/**
 * Module dependencies.
 */

var sys = require('sys'),
  Store = require('connect/middleware/session/store'),
  DB = require('mongodb/db').Db,
  Server = require("mongodb/connection").Server;  

/**
 * Initialize MongoStore with the given `options`.
 *
 * @param {Object} options
 * @api public
 */

var MongoStore = module.exports = function MongoStore(options) {
  options = options || {};
  Store.call(this, options);
  var self = this;
  var connection = new DB(options.dbname, new Server(options.host || '127.0.0.1', options.port || 27017, {}), {});
  connection.open(function(err, db){
      db.collection(options.collection || 'Session', function(err, collection){
          self.client = collection;
      });
  });  
};

sys.inherits(MongoStore, Store);

/**
 * Attempt to fetch session by the given `hash`.
 *
 * @param {String} hash
 * @param {Function} fn
 * @api public
 */

MongoStore.prototype.get = function(hash, fn){
  this.client.findOne({_id: hash}, function(err, data){
      try {
          if (data) delete data._id;
          // TODO: fail if expired
          fn(null, data);
      } catch (err) {
          fn(err);
      }
  }); 
};

/**
 * Commit the given `sess` object associated with the given `hash`.
 *
 * @param {String} hash
 * @param {Session} sess
 * @param {Function} fn
 * @api public
 */

MongoStore.prototype.set = function(hash, sess, fn){
  var self = this; 
  var d = new Date(sess.lastAccess);  
  var cleanDate = d.toString();        
  sess.t = cleanDate;
  try {
	sess._id = hash;
      this.client.update({_id: hash}, sess, {upsert: true}, function(err, data){
          if (data) delete data._id;
          fn && fn.apply(this, arguments);
      });
  } catch (err) {
      fn && fn(err);
  }     
};

/**
 * Destroy the session associated with the given `hash`.
 *
 * @param {String} hash
 * @api public
 */

MongoStore.prototype.destroy = function(hash, fn){
   this.client.remove({_id: hash}, fn);
};

/**
 * Fetch number of sessions.
 *
 * @param {Function} fn
 * @api public
 */

MongoStore.prototype.length = function(fn){
  this.client.count({}, fn);
};

/**
 * Clear all sessions.
 *
 * @param {Function} fn
 * @api public
 */

MongoStore.prototype.clear = function(fn){
   this.client.drop(fn);
};
