class ProjectsController < ApplicationController
  before_action :set_project, except: [:index, :new, :create]

  def index
    @projects = Project.all

    flash[:notice] = 'No current projects' if @project.empty?
  end

  def show; end

  def new
    require_user
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:notice] = 'Your project was created.'
      redirect_to projects_path
    else
      render :new
    end
  end

  def edit
    require_user
  end

  def update
    if @project.update(project_params)
      flash[:notice] = 'The project was updated'
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    require_user
    @project.destroy

    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end