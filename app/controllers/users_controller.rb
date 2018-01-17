class UsersController < ApplicationController
  def index
    @id      = params[:id]
    @name    = params[:name]
    @address = params[:address]
    @sex     = params[:sex]

    @users = User.all
    @users = @users.where(id: @id) if @id.present?
    @users = @users.where('name like ?', "%#{@name}%") if @name.present?
    @users = @users.where(address: @address) if @address.present?
    @users = @users.where(sex: @sex) if @sex.present
  end
end
