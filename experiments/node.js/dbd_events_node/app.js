require.paths.unshift(__dirname + '/lib');

var express      = require('express')
    , crypto     = require('crypto') 
    , io         = require('socket.io')       
    , mongoose   = require('mongoose').Mongoose   
    , db         = mongoose.connect('mongodb://localhost/dbd_club_development') 
    , db2        = mongoose.connect('mongodb://localhost/dbd_user_development')  
    , MongoStore = require('connect-mongo.js')   
    , json       = JSON.stringify;      
       
var app = express.createServer();      

app.set('views', __dirname + '/views');
app.set('view options', {
    layout: false
});

app.set('view engine', 'ejs'); 

app.use(express.bodyDecoder());
app.use(express.cookieDecoder());
app.use(express.session({ key: "dbd_club", store: new MongoStore({ dbname: "dbd_club_development", collection: "sessions", key: "dbd_club"}) }) );         
app.use(express.staticProvider(__dirname + '/public'));      
app.use(express.errorHandler({ dumpExceptions: true, showStack: true }));   
  

mongoose.model('Account',{
  
  collection : 'accounts', // (optional) if not present uses the model name instead.
   
  properties: [
  ],  
  
  /*
  'crypted_password',
  'salt',
  {'roles': []},
  {'purchases': []},
  'created_at',
  'updated_at',
  */
  

  // defines your data structure
  cast: {
  },

  indexes : [
  ],

  static : {}, // adds methods onto the Model.
  methods : { }, // adds methods to Model instances.

  setters: { // custom setters
  },

  getters: { // custom getters
  },
   
});  

var User = db.model('Account');  
var current_author;     
var parent_author;     

mongoose.model('Event',{

  collection : 'events', // (optional) if not present uses the model name instead.
   
  properties: [
    {'subsribers': []},
    'author_id', 
    'document',
    'link_to_event',  
    'type',
    'created_at',
    'updated_at',
  ],
  

  // defines your data structure
  cast: {
    _id : Object, // if not defined, Mongoose automatically defines for you.
    subscribers : Array,
    author_id : Object, 
    link_to_event : String,
    type : String,
    created_at : Date,
    updated_at : Date,
  },

  indexes : [
  ],

  static : {}, // adds methods onto the Model.
  methods : {     
    author: function(author_id) {
      User.find({ _id: author_id }).first(function(user){   
        return user;
      });
    },
    toJSoN: function() {              
      User.find({ _id: this.author_id }).first(function(user) { 
        current_author = user;   
      });   
      this.__doc.author = current_author;
      if (this.__doc.author)  {
        var author_hash = crypto.createHash('md5').update(this.__doc.author.email).digest("hex");   
        if(this.__doc.document.reply_to) {  
          this.__doc.author.__doc.gravatar_url = "http://www.gravatar.com/avatar/" + author_hash + "?s=34";
        } else {
          this.__doc.author.__doc.gravatar_url = "http://www.gravatar.com/avatar/" + author_hash + "?s=70";
        }   
      }      
      // TODO Change this to use this.__doc.document.reply_to 
      // and to check for reply_to first.   
      if(this.__doc.document.reply_to) {    
        User.find({ _id: '4ca21aa1480fa92731000003' }).first(function(user) {
          parent_author = user;   
        });                  
        this.__doc.p_author = parent_author;    
        if(this.__doc.p_author)  {
          var p_author_hash = crypto.createHash('md5').update(this.__doc.p_author.email).digest("hex");
          this.__doc.p_author.__doc.gravatar_url = "http://www.gravatar.com/avatar/" + p_author_hash + "?s=70"
        }   
      } 
      console.log(JSON.stringify(this.__doc));
      return JSON.stringify(this.__doc);
    },
  }, // adds methods to Model instances.

  setters: { // custom setters
  },

  getters: { // custom getters
  },
      
});  

var Event = db2.model('Event');     
                                      
app.listen(8080);      

var socket   = io.listen(app);
    
var clients = [];

socket.on('connection', function(client) {    
  
  client.on('message', function(d) {  
    try {
      var data = JSON.parse(d); 
    } catch(err) {
      var data = d; 
    }     
    if(data.type == 'initial_send') {     
      var client_dat =  { 'session_id' : data.s, 'client_obj' : client };
      clients.push(client);  
    }
  }); 
  
}); 

app.post('/update', function(req, res){           
  Event.find({ _id: req.body.event_id }).first(function(event){  
    socket.broadcast(event.toJSoN());
  });     
  res.send('new_event'); 
});   