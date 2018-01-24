class User < ApplicationRecord
  enum sex: { 'man': 0, 'woman': 1 }

  scope :search, Users::SearchQuery
end
