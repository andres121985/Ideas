class SessionsController < ApplicationController
    def new
    end

  # Login method
    def create
    	@user = User.find_by(email: params[:user][:email])
    	if @user
    		if @user.authenticate(params[:user][:password])
    			session[:user_id] = @user.id
                redirect_to "/users/#{@user.id}"
            else
    			flash[:errors] = ['Invalid email/password combination']
    			redirect_to :back
    		end
    	else
  		flash[:errors] = ['User not found. Please check you email, or register']
  		redirect_to :back
  	end
    end

  # Logout method
    def destroy
    	reset_session
    	redirect_to '/users/new'
    end
  end
