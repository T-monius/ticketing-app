class TagsController < ApplicationController
  before_action :set_tag, only: [:edit, :update, :destroy]

  def index
    @tags = Tag.all
  end

  def new
    require_user
    @tag = Tag.new
  end

  def create
    if @tag = Tag.create(tag_params)
      flash[:notice] = 'The tag was created.'
      redirect_to tags_path
    else
      flash[:error] = 'Could not create tag.'
      render :new
    end
  end

  def edit
    # FIXME: Edit form submits to a GET even though PATH exists
    redirect_to tags_path
  end

  def update
    if @tag.save
      flash[:notice] = 'The tag was updated.'
      redirect_to tag_path(@tag)
    else
      flash[:error] = 'Could not update.'
      render :edit
    end
  end

  def destroy
    if logged_in?
      @tag.destroy
    else
      flash[:error] = 'Must be logged in to do that.'
    end

    redirect_to tags_path
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])    
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end