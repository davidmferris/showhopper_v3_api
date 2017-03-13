require 'rails_helper'

RSpec.describe Api::V1::LocationsController, type: :controller do
  describe '#index' do
    let(:songkick_response) do
      double(body: { 'name' => 'Portland OR' })
    end

    it 'initializes a Songkick client object' do
      expect_any_instance_of(Showhopper::Songkick)
        .to receive(:locations).and_return(songkick_response)
      get :index, params: { format: :json, query: 'Portland' }

      expect(JSON.parse(response.body)).to eq(songkick_response.body)
    end
  end
end
