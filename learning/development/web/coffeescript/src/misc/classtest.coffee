class X
      @foo: "foo"  
      getFoo: ->
        X.foo
      getBar: ->       
        @bar = 'joe'
        @bar   
      getBarTwo: ->      
        @bar

x = new X
console.log x.getFoo()
console.log x.getBar()      
console.log x.getBarTwo()