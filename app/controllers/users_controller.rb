class UsersController < ApplicationController
  def new
  end
  def create
  	@user = User.new(user_params)
  	if @user.save
  		session[:user_id] = @user.id
  		redirect_to "/users/#{@user.id}"
  	else
  		flash[:errors] = @user.errors.full_messages
  		redirect_to :back
  	end
  end

  def show
      @user = User.find(params[:id])
  end

  def view
      @user = User.find(params[:id])
  end

  def destroy
      @user = User.find(params[:current_user])
      if @user.id == session[:id]
          @user.destroy
          reset_session
          redirect_to :root
      else
          flash[:errors] = ['You are not authorized to delete this user.']
          redirect_to :back
      end
  end

  private
	  def user_params
	  	params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
	  end

 end
