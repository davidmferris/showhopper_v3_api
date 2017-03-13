module Api
  module V1
    class LocationsController < ApiController
      include HTTParty

      api! 'Returns a list of Metro Areas'
      param :query, String, desc: 'Name of user\'s location', required: true
      param :per_page, :number, desc: 'Number of results per page'
      def index
        response = Showhopper::Songkick.new(query_params.to_h).locations
        render json: response.body
      end

      private

      def query_params
        params.permit(%i(query per_page))
      end
    end
  end
end
