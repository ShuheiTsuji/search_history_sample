# step3
# service層利用スタイル
module Search
  class UserService
    attr_reader :user_activerecord_relation

    def initialize(user_form)
      @user_form = user_form

      @relation = User.all
      set_conditions
    end

    private

    def set_conditions
      set_id
      set_name
      set_zip
      set_sex
    end

    def set_id
      return if @user_form.id.blank?

      @relation = @relation.where(id: @user_form.id)
    end

    def set_name
      return if @user_form.name.blank?

      @relation = @relation.where('name like ?', "%#{@user_form.name}%")
    end

    def set_zip
      return if @user_form.zip.blank?

      @relation = @relation.where(zip: @user_form.zip)
    end

    def set_sex
      return if @user_form.sex.blank?

      @relation = @relation.where(sex: @user_form.sex)
    end
  end
end