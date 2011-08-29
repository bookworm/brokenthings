# General

Stock data should come in and out in an abstracted way. We should be able to take a data set and throw into a collection, then analyze on just that.
Metadat about what wer're currently operating on should be a model with only one instance. Methods to get the the suggested stock, highest etc.
  
# Stocks

* Price is a model itself. That way we can query prices by time/date. Price method can just return most recent price.   

# Weights

* Abstracted So we can use muptle algorithims and add as needed. Any added algorwithim doesn't necessaryily effect the buy weight
* Weight is treated like chess eval. E.g 1 is buy, 0 is definitely not buy. less than zero is your screwed. the thigher over 1 etc the more more accurate the 
  prediction.

# Misc

* A price analytic is just a date range of prices or an array of price IDs. Run parse on that and generate stochastic weight etc. This allows us to use multiple price sets in the prediction.             
  
  
# Process

* Create DataSet with stock names. 
* Add price data for stocks.
* Add Analytic set to each stock and populate it with analytics for each stock.   
   
Saving an analytic should create a job to parse it.        

We need to get our data out sorted by stock with the highest weight. Then a fancy frontend view to list stocks in table. Thats it.
  
## Parsing an analytic should generate the analytic weight and update the analytic set value. The analytic-Set updates the stock weight.           


# Process Analytics

Stock should have the analytics. Everything goes through that.

self.analytics.add_semantic()
self.analtics.get_news
should perhaps pass symbol to colection get_news

when a semantic is save its weight is generated.

weight should be embedded on analytics.
save analytics weight is generated. NO SCRATCH that weight should be on stock for easy querying.
perhaps when save analytic it generates weight and save the stock. yeah that will work. do that.  

                     
# More Misc

stock when they move up in the rankings should send alert. we can accomplish by checking position using snippet. send ping to juggernaut surviver wich a growl client is sucbribed to. voila.
datasets need names.
previous rank sorted in mongomapper for now but later on use redis.    

# How I'll go about things.

I'll get a list of penny stocks. And then add these into a dataset. 

Then for each stock I want to be able to do. `stock.analytics.pull_in_news(:from_date, :to_date)`  and stock.analytics.pull_in_prices(:from_date, :to_date)`

Then view side I want a table of all the stocks sorted by the signal strength.                                                                                              