class LikesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    idea = Idea.find params[:idea_id]
    like = current_user.likes.new
    like.idea = idea
    if like.save
      redirect_to idea, notice: "liked!"
    else
      redirect_to idea, alert: "Can't like"
    end
  end

  def destroy
    like = current_user.likes.find params[:id]
    like.destroy
    redirect_to like.idea, alert: "Unliked!"
  end

end
