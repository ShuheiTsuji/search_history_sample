class User < ApplicationRecord
  enum sex: %i( man woman )

  scope :search, Users::SearchQuery
end
