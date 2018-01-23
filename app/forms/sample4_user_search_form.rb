class Sample4UserSearchForm
  include ActiveModel::Model
  include ActiveModelAttributes

  attribute :id, :integer
  attribute :name, :string
  attribute :zip, :zip
  attribute :sex, :integer

  validates :id, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 100 }, allow_blank: true
  validates :name, length: { maximum: 100 }

  def search
    User.search(params_for_search)
  end

  private

  def params_for_search
    {
        id: id,
        name: name,
        zip: zip,
        sex: sex
    }
  end
end
