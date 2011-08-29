title: Posting Stuff Via API and Growl.
body: |   

At all my blogs I post things using a md -> yaml -> json -> mongodb workflow. This makes it quick and easy to build scripts to push my docs from various apps,
text editors, task managers (things FTW!) and of course the trusty standalone file. The only problem is detemring when my posts go through, I post then head
over to the server to run a command and check, often I just lazily refresh because most don't have caching. Isn't mongodb wonderful?

 This brings about a need for a better alert system one more efficient better suited to my needs. In from stage left comes ruby-growl. The following is my
Textmate command for pushing to [http://kerickson.me](http://kerickson.me)

```ruby   
#!/usr/bin/env ruby

require 'rubygems'
require 'yaml' 
require 'rest_client'  
require 'json'
require 'ruby-growl'

g = Growl.new "127.0.0.1", "ruby-growl", ["ruby-growl Notification"]

opts = {:filename => #{ENV['TM_FILEPATH']}, :url => "http://kerickson.me/api/posts/create"}  

post = YAML::load(File.open(opts[:filename])) 
resp = RestClient.post opts[:url], :post => post.to_json

if resp.code == 200 
  g.notify "ruby-growl Notification", "Posted Successfully For:", "#{post['title']}"
else 
  g.notify "ruby-growl Notification", "Posted Failed For:", "#{post['title']}"
end
```   
  
To get ruby-growl working you might to follow [this guide](http://bbrinck.com/post/73830054/getting-ruby-growl-to-work this).
Have fun be sure to checkout my [github](http://github.com/bookworm) for actual apps with APIs that the above command can work with. Like the [notebook]((http://github.com/bookworm/dbd_notebook) and [me](http://github.com/bookworm/me)  