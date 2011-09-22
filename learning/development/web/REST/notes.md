At its heart REST is simply resources, verbs, and HTTP methods.

Its important to understand that resources can be nested. I've always been confused about whats the best way to do a complicated REST call where their are multiple resources.

Lets take for example the github issues there is a few different ways to do this. 

We could do either

1. `GET /repos/:user/:repo/issues/:id`    
or
2. `GET /issues/:id?repo_id=repoid`

What the fuck is the correct way? 

I think fundamentally these urls should reflect the underlying model structure. Are issues a separate entity that can just
happen to be connected with a repo? Or are they never independent from the repo? Is a issue ID unique, if yes, then why the
fuck are we going through the repos url?

I might use a comment model in multiple places or I might use entirely on the post. 

Comments/issues are really blurry. So lets say we have a Book and that book has Authors. Authors are clearly a separate
entity. 