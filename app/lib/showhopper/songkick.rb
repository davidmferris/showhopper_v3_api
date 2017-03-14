module Showhopper
  class Songkick
    include HTTParty
    base_uri 'api.songkick.com/api/3.0'

    def initialize(options)
      @options = { query: options.merge(apikey: ENV['SONGKICK_API_KEY']) }
    end

    def locations
      self.class.get('/search/locations.json', @options)
    end

    def shows
      self.class.get(
        "/metro_areas/#{@options[:query][:metro_area_id]}/calendar.json",
        @options
      )
    end
  end
end
