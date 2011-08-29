require 'rubygems'           
require "bundler/setup"
require 'ankusa'
require 'ankusa/cassandra_storage'   

storage = Ankusa::CassandraStorage.new 
c = Ankusa::NaiveBayesClassifier.new storage              

Dir.chdir('/Users/kenerickson/nlp_data/financial_news_polarity/pos')

Dir.foreach("/Users/kenerickson/nlp_data/financial_news_polarity/pos") do |fname|  
  unless File.directory?(fname)
    c.train :news_positive, File.read(fname)
  end
end



