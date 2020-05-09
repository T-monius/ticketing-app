class TicketsController < ApplicationController
  before_action :find_project, only: [:create, :destroy, :edit, :update]

  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Project.comments.
  end

  def create
    @ticket = @project.comments.build(ticket_params)

    if @ticket.save
      flash[:success] = 'You have successfully created the ticket.'
      redirect_to project_path(@project)
    else
      @project.reload.tickets
      flash.now[:error] = "Couldn't create the ticket. See errors."
      render 'tickets/show'
    end
  end

  def edit
    @ticket = @project.tickets.find(params[:id])
  end

  def update
    @ticket = @project.tickets.find(params[:id])

    if @ticket.update(ticket_params)
      flash[:notice] = 'The ticket was updated.'
      redirect_to project_path(@project)
    else
      flash.now(:error) = 'Ticket could not be updated.'
      rended 'tickets/show'
    end
  end

  def destroy
    @project.comments.destroy(params[:id])
  end

  private

  def ticket_params
    params.require(:ticket).permit(:name, :body, :status)
  end

  def find_project
    @project = Post.find(params[:project_id])
  end
end