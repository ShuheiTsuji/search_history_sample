class Sample3UserSearchForm
  include ActiveModel::Model
  include ActiveModelAttributes

  attribute :id, :integer
  attribute :name, :string
  attribute :zip, :zip
  attribute :sex, :string

  validates :id, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 100_000_000 }, allow_blank: true
  validates :name, length: { maximum: 100 }
  validates :zip, length: { is: 7 }, allow_blank: true

  def search
    search_user_service = Search::UserService.new(self)

    search_user_service.relation
  end
end
