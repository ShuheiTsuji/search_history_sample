class Sample2UserSearchForm
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
    users = User.all

    return users unless valid?

    users.where!(id: id) if id.present?
    users.where!('name like ?', "%#{name}%") if name.present?
    users.where!(zip: zip) if zip.present?
    users.where!(sex: sex) if sex.present?
    users
  end
end
