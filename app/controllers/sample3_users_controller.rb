class Sample3UsersController < ApplicationController
  def show
    @sample3_user_search = Sample3UserSearchForm.new(user_search_form_params)

    unless @sample3_user_search.valid?
      flash.now[:alert] = @sample3_user_search.errors.full_messages
    end

    @users = @sample3_user_search.search
  end

  private

  def user_search_form_params
    params.fetch(:sample3_user_search_form, {}).permit(
      :id,
      :name,
      :zip,
      :sex
    )
  end
end
