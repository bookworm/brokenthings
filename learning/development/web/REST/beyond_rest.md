REST is great but how do move beyond it .A common case where REST has no formal convention is views. Thats alright because we
can continue with the same basic principle of REST and use verbs.      

So we start to map everything as verbs that occur on the model.

Lets take a posts model.

We might map LIST to `GET /posts/list` but wait this veerb list is basically a default verb. 
Lets just use `GET /posts`.

What about instance creating resources. Sure we send the form data to `POST /posts` but what about our view?.

How should the view correspond. Well, its another verb. If we think about mostly what we're doing is constructing the models
values, initializing it and then to save it we POST those values. We typically use `new` for initialization/construction in
programming languages. So we will stick with that convention, new it is.   

So its `GET /posts/new` now things get interesting. What else can we do with this well a few pretty neat things. We can use
accepts headers just like with any REST request. e.g we could give information about the structure of posts model if json is requested.

```json
{
  title: "Post Tile",
  body: "Post Body",
  author: "Author Name"
}
````

In my web applications I often have full new pages and then fragments that
return just the form. We use the request headers for this. I its an ajax request return the AHAH, if its not return a full
view page.  