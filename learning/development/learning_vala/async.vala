async void display_jpeg(string fnam) {
  //
}

async int fetch_webpage(string url, out string text) throws IOError
{
  text = result;

  return status;
}

display_jpeg("test.jpg");
display_jpeg.begin("test.jpg");
display_jpeg.begin("test.jpg", (obj, res) => {
  display_jpeg.end(res);
});

fetch_webpage.begind("http://example.org", (obj, res) => {
  try {
    string text;
    var status = fetch_webpage.end(res, out text);
  } catch(IOError e) {
    //
  }
}); 

Idle.add(fetch_webpage.callback);
yield;

SourceFunc callback = fetch_webpage.callback;
[... store 'callback' somewhere ...]
yield;