require 'httparty'
require 'json'

class Postcodesio

  include HTTParty
  attr_accessor :single_postcode_results, :multiple_postcode_results

    base_uri 'https://api.postcodes.io/' # put the end of the service at the end of this url // Will always be used

    def single_postcode_search postcode
      @single_postcode_results = self.class.get("/postcodes/#{postcode}")
      puts JSON.parse(@single_postcode_results.body)
    end

    def multiple_postcode_search postcode_array
      # postcode_array = []
      @multiple_postcode_results = self.class.post("/postcodes/", :body => { 'postcodes': postcode_array})
      puts JSON.parse(@multiple_postcode_results.body)

    end

end

single = Postcodesio.new

# single.single_postcode_search('b601ja')

single.multiple_postcode_search(['b601ja', 'sw155du'])
