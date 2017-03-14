require 'rails_helper'

RSpec.describe Api::V1::ShowsController, type: :controller do
  describe '#index' do
    let(:songkick_response) do
      double(body: { 'resultsPage' => { 'status' => 'ok' } })
    end

    it 'initializes a Songkick client object' do
      expect_any_instance_of(Showhopper::Songkick)
        .to receive(:shows).and_return(songkick_response)
      get :index, params: { format: :json, metro_area_id: 12283 }

      expect(JSON.parse(response.body)).to eq(songkick_response.body)
    end
  end
end
