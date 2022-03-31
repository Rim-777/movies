module Api
  module V1
    class ActorsController < BaseController
      def index
        actors =
          Actors::Index
          .call(filter_params)
          .result.page(params[:page])

        serializer =
          ActorSerializer.new(
            actors,
            links: pagination_links(actors)
          )

        render json: serializer.serialized_json
      end

      private

      def filter_params
        params.permit(:name).to_h.symbolize_keys
      end
    end
  end
end
