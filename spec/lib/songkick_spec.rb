require 'rails_helper'

describe Showhopper::Songkick do
  describe '#locations' do
    let(:client) do
      Showhopper::Songkick.new(query: 'Portland')
    end

    it 'asks the Songkick API for location data matching given query' do
      VCR.use_cassette('songkick_locations') do
        resp = client.locations
        expect(
          resp['resultsPage']['results']['location'][0]['city']['displayName']
        ).to eq('Portland')
      end
    end
  end

  describe '#shows' do
    let(:client) do
      Showhopper::Songkick.new(metro_area_id: 12283)
    end

    it 'asks the Songkick API for shows in the given metro area' do
      VCR.use_cassette('songkick_shows') do
        resp = client.shows
        expect(resp['resultsPage']['status']).to eq('ok')
      end
    end
  end
end
