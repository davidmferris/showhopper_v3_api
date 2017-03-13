module Showhopper
  class Songkick
    include HTTParty
    base_uri 'api.songkick.com/api/3.0/search'

    def initialize(options)
      @options = { query: options.merge(apikey: ENV['SONGKICK_API_KEY']) }
    end

    def locations
      self.class.get('/locations.json', @options)
    end
  end
end
