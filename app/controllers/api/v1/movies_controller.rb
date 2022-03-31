module Api
  module V1
    class MoviesController < BaseController
      def index
        movies = Movies::Index.call.result.page(params[:page])

        serializer =
          MovieSerializer.new(
            movies,
            include: %i[
              directors
              actors
              filming_locations
              countries
              reviews
            ],
            links: pagination_links(movies)
          )

        render json: serializer.serialized_json
      end
    end
  end
end
