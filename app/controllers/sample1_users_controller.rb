class Sample1UsersController < ApplicationController
  def show
    @id   = params[:id]
    @name = params[:name]
    @zip  = params[:zip]
    @sex  = params[:sex]
    @users = User.all
    @users.where!(id: @id) if @id.present?
    @users.where!('name like ?', "%#{@name}%") if @name.present?
    @users.where!(zip: @zip) if @zip.present?
    @users.where!(sex: @sex) if @sex.present?
  end
end
