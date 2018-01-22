class UserSearchForm
  include ActiveModel::Model
  include ActiveModelAttributes

  attribute :id, :integer
  attribute :name, :string
  attribute :zip, :zip
  attribute :sex, :integer

  validates :id, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 100 }, allow_blank: true
  validates :name, length: { maximum: 100 }
  validates :zip, format: { with: /\A\d{3}\-?\d{4}\z/ }

  # step2 / step3
  # def initialize(params = {})
  #   @id   = params[:id]
  #   @name = params[:name]
  #   @zip  = params[:zip]
  #   @sex  = params[:sex]
  #   @users = User.all
  # end

  # step 2
  # form_object利用スタイル
  # def search
  #   @users = @users.where(id: id) if id.present?
  #
  #   @users = @users.where('name like ?', "%#{name}%") if name.present?
  #
  #   @users = @users.where(zip: zip) if zip.present?
  #
  #   @users = @users.where(sex: sex) if sex.present?
  #
  #   @users
  # end

  # step3
  # service層利用スタイル
  # def search
  #   search_user_service = Search::UserService.new(self)
  #
  #   search_user_service.user_activerecord_relation
  # end

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
