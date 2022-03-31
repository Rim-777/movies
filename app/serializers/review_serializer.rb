class ReviewSerializer
  include FastJsonapi::ObjectSerializer
  attributes :review_text, :stars

  belongs_to :user
end
