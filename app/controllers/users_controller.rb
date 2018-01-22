class UsersController < ApplicationController
  # step1
  # form_tag + controllerベタがきスタイル
  # def index
  #   @id      = params[:id]
  #   @name    = params[:name]
  #   @address = params[:address]
  #   @sex     = params[:sex]
  #   @users = User.all
  #   @users = @users.where(id: @id) if @id.present?
  #   @users = @users.where('name like ?', "%#{@name}%") if @name.present?
  #   @users = @users.where(address: @address) if @address.present?
  #   @users = @users.where(sex: @sex) if @sex.present
  # end

  # step 2
  # form_object 利用スタイル
  def index
    @user_search = UserSearchForm.new(user_search_form_params)

    unless @user_search.valid?
      flash[:alert] = @user_search.errors.full_messages
    end

    @users = @user_search.search
  end

  private

  def user_search_form_params
    params.fetch(:user_search_form, {}).permit(
      :id,
      :name,
      :zip,
      :sex
    )
  end
end
