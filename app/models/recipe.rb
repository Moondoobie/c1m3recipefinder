class Recipe < ActiveRecord::Base

      key_value = ENV[’FOOD2FORK_KEY’]
      hostport = ENV[’FOOD2FORK_SERVER_AND_PORT’] #|| ’www.food2fork.com’ # test both
      base_uri "http://#{hostport}/api"
      default_params fields: "key_value"

	def self.for (keyword)
        get("/search", query: { q: keyword})["recipes"]
      end
	   

	  # take a keyword to query
      # query the Food2Fork API for a result.
      # add the HTTP query parameter key (your developer key) to each outgoing
      # URL request to http://food2fork.com/api using HTTParty default params.
      # obtain the key value from an environment variable FOOD2FORK_KEY
      # obtain the url (and/or port) value from an environment variable
      # FOOD2FORK_SERVER_AND_PORT

      # You will use the http://food2fork.com/api host and port# (default=:80)
      # during development and Heroku deployment. However, your
      # assignment will be graded off-line and should get its host and port# from
      # the FOOD2FORK SERVER AND PORT environment variable. Your assignment
      # must use the defined value if present and default to the real value otherwise.

	

end

# --------------------------------old assignment-------------------------------
# require 'httparty'

# class Recipe
#   include HTTParty
#   base_uri "http://food2fork.com/api"
#   default_params key: ENV['FOOD2FORK_KEY']
#   format :json

#   def self.for (keyword)
#     get("/search", query: { q: keyword})["recipes"]
#   end

# end


# All search requests should be made to the base search API URL.
# http://food2fork.com/api/search 
#
# All recipe requests should be made to this URL: http://food2fork.com/api/get

# Request: http://food2fork.com/api/search?key={API_KEY}&q=shredded%20chicken 
# key: API Key
# q: (optional) Search Query (Ingredients should be separated by commas). 
# If this is omitted top rated recipes will be returned.
# sort: (optional) How the results should be sorted. See Below for details.
# page: (optional) Used to get additional results

# GET Recipe
# key: API Key
# rId: Id of desired recipe as returned by Search Query
