$(document).ready(function() {    
  if ('undefined'===typeof(io)) {
      throw new Error("Application failed to load: Socket.IO not found");
  }  
  var socket = new io.Socket('localhost', { port: '8080' });       
  socket.connect(); 
  
  socket.on('message', function(data) {
    console.log('hit');
  });
  
  
  $('#imchat').submit(function() {        
    var $imElem = $('#im')
        , msg  = $imElem.val();    
        
        console.log(msg);

    if(msg) {
      socket.send(msg);
      renderChatData({message:msg});
      $imElem.value = ""; 
    }  

    $imElem.focus();
    return false;
  });
  
});    



var receiveData = function(data) { 
  console.log(data);
  if ("string"===typeof(data)) {
    data = JSON.parse(data);
  }
  renderChatData(data);    
};
           
var renderChatData = function(data) {
  var doc        = document
      , $chatBox = $('#chats');    
     
  var renderMessage = function(message) {
    var chatMsg    = message.message
        , chatElem = $('<li></li>')
        , msgElem  = $('<span></span>');
        
    chatElem.addClass('chat'); 
    msgElem.addClass('message');      
    $(msgElem).append(chatMsg); 
    $(msgElem).prependTo(chatElem); 
    return chatElem;  
  }; 
  
  if (data && data.message) {
    renderMessage(data).appendTo($chatBox);
  }  
  
};