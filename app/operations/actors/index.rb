module Actors
  class Index
    prepend BaseOperation

    option :name, optional: true, type: Dry::Types['strict.string']

    attr_reader :result

    def call
      get_all
      filter_by_name
    end

    private

    def get_all
      @result = Actor.includes(:movies)
    end

    def filter_by_name
      return unless @name

      @result = @result.where('name ilike ?', "#{@name}%")
    end
  end
end
