class IdeasController < ApplicationController
  def index
      @ideas = Idea.all
  end

  def create
     @ideas = Idea.new(ideas_params)
      if @ideas.save
          redirect_to"/ideas/"
      else
          flash[:errors] = @ideas.errors.full_messages
          redirect_to :back
      end
  end

  def index
  end

  def show
      @idea = Idea.find(params[:id])
      @users = Idea.find(params[:id])
  end

  private
     def ideas_params
       params.require(:ideas).permit(:content).merge(user_id: session[:user_id])
     end
end
