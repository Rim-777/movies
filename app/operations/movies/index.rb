module Movies
  class Index
    prepend BaseOperation

    attr_reader :result

    def call
      @result =
        Movie.select('movies.*')
             .joins(:reviews)
             .group('movies.id')
             .order('avg(reviews.stars) desc')
    end
  end
end
