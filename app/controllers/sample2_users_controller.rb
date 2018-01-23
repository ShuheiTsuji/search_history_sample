class Sample2UsersController < ApplicationController
  def show
    @sample2_user_search = Sample2UserSearchForm.new(user_search_form_params)

    unless @sample2_user_search.valid?
      flash.now[:alert] = @sample2_user_search.errors.full_messages
    end

    @users = @sample2_user_search.search
  end

  private

  def user_search_form_params
    params.fetch(:sample2_user_search_form, {}).permit(
      :id,
      :name,
      :zip,
      :sex
    )
  end
end
