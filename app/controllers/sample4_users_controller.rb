class Sample4UsersController < ApplicationController
  def show
    @sample4_user_search = Sample4UserSearchForm.new(user_search_form_params)

    unless @sample4_user_search.valid?
      flash.now[:alert] = @sample4_user_search.errors.full_messages
    end

    @users = @sample4_user_search.search
  end

  private

  def user_search_form_params
    params.fetch(:sample4_user_search_form, {}).permit(
        :id,
        :name,
        :zip,
        :sex
    )
  end
end
