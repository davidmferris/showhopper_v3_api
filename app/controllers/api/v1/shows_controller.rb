module Api
  module V1
    class ShowsController < ApiController
      include HTTParty

      api! 'Returns a list of Shows in metro area'
      param :metro_area_id, :number, desc: 'ID of user\'s location',
                                     required: true
      param :per_page, :number, desc: 'Number of results per page'
      def index
        response = Showhopper::Songkick.new(query_params.to_h).shows
        render json: response.body
      end

      private

      def query_params
        params.permit(
          %i(
            metro_area_id
            per_page
            min_date
            max_date
          )
        )
      end
    end
  end
end
