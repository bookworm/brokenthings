title: "Don't Repeat Your Docs"          
type: 'default'
status: 'public' 
tags: [ 'docs', 'php', 'dbd', 'documentation', 'wiki']   
intro: |      

I hate re-writing code in multiple places, its redundant, difficult to maintain and just a waste time. Most other programmers would agree and this is why we
have the DRY (don't repeat yourself) rule. When it comes to documentation though, most of us are all too willing to repeat ourselves over and over over and
over. First we write documentation, then we write readmes, then we write wiki pages; and if we are really resilient (or a masochist) we start writing tutorials,
blog posts, articles & books......        

body: |          

I hate re-writing code in multiple places, its redundant, difficult to maintain and just a waste time. Most other programmers would agree and this is why we
have the DRY (don't repeat yourself) rule. When it comes to documentation though, most of us are all too willing to repeat ourselves over and over over and
over. 

First we write documentation, then we write readmes, then we write wiki pages; and if we are really resilient (or a masochist) we start writing tutorials,
blog posts, articles & books.

Over the course of all this we find ourselves duplicating things over and over. All the DBD code is going to be written in Natural Docs, parsed using a
reflection API and thrown into what is tentatively called the DBD hive. Instead of copying and pasting stuff into a forum post instead I'll write something like

`/apiv1/templatefaqs/how-to-create-new-template.ahah.({ "c"}, {})`

`/apiv1/faqs/IDorSLug.ahah.({ filters }, { selection })`

Which would be parsed and then translated into a URI version: /apiv1/faqs/IDorSLug.ahah?filters=jsonHERE&selection=jsonHERE. After thats called there will be
embedded within that forum post the relevant FAQ item. This parser API will be flexible and make its way into everything. I'll place such calls into code
documentation so that things like tutorials will be directly linked and embedded on the API docs site for a component.

Each item will reference its own template. In this case (returning an ahah fragment) the API will first call the template defined by the item and if that
doesn't exist it will use a default template for this item type. Then it will return it.

Nice huh?

If nothing exists for this current topic a new snippet will be created in the hive using yaml.

` 
 creatDoc 
  {
     // yaml goes here 
  } 
`   

YAML is a simple easy to write format that translates well into other formats like JSON. It will be used as the primary base format which things are written
in, the human friendly version of the more API/programming friendly format of JSON. DBD docs will be full of stuff like yaml and markdown, making the
documentation not only easy to read but easy to parse.

## Whats done so far?

The API for this is already built for the DBD wiki. I need to re-do the documentation from a php doc style in Simplex to a natural docs style. Why? Consistency
I hate leaving docs in an inconsistent format. Then I've got to code up a PHP reflection API powered code documentation parser.

This is going to be awesome.                            