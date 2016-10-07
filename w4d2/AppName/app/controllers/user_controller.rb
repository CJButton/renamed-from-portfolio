



class UserController < ApplicationController

  def create
    # these user_params are passed in from the private method below
    @user = User.new(user_params)

    # how do we know if they are saving?
    if @user.save
      render json: @user
    else
      render json: @user.errors.full_messages
    end
  end

  def new
    # what is this one doing? no params are passed in, nor is it saved
    @user = User.new
  end

  private
  def user_params
    # this data is parsed from one of three places
    # it is combined in a hash for us to access
    # we only allow those that have a key of :user to use the #UserController.
    params.require(:user).permit(:username, :password)
  end

end
