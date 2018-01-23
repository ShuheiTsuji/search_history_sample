class Sample2UserSearchForm
  include ActiveModel::Model
  include ActiveModelAttributes

  attribute :id, :integer
  attribute :name, :string
  attribute :zip, :zip
  attribute :sex, :integer

  validates :id, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 100 }, allow_blank: true
  validates :name, length: { maximum: 100 }

  def search
    users = User.all

    users.where!(id: id) if id.present?

    users.where!('name like ?', "%#{name}%") if name.present?

    users.where!(zip: zip) if zip.present?

    users.where!(sex: sex) if sex.present?

    users
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
