class IdeasController < ApplicationController
  before_action :authenticate_user!
  def index
    @ideas = Idea.all
  end

  def new 
  @idea = Idea.new
end
def update
  @idea = Idea.find(params[:id])
  if @idea.update(idea_params)
    redirect_to ideas_path(@idea), notice: "Idea updated!"
  else
    flash[:notice] = "Please fix errors"
  end
end

def create
  @idea = current_user.ideas.new(idea_params)
  if @idea.save
    flash[:notice] = "Idea Created Succesfully!"
    redirect_to ideas_path
  else
    render :new
  end

end


def edit
  @idea = Idea.find(params[:id])
end

def show
 @idea = Idea.find(params[:id])
 @comment = Comment.new

end
def destroy
  @idea = Idea.find(params[:id])
  @idea.destroy
  redirect_to ideas_path, notice: "Idea deleted succesfully!"
end

private
def idea_params
  params.require(:idea).permit(:title, :body)
end


end
