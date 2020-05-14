class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def index
    @tickets = Ticket.all
  end

  def new
    require_user
    @ticket = Ticket.new
  end

  def show
    @comment = Comment.new
  end

  def create
    @ticket = Ticket.new(ticket_params.merge(creator_id: current_user.id))
    @ticket.update(assignee_id: params[:assignee_id][:user_id])

    if @ticket.save
      flash[:success] = 'You have successfully created the ticket.'
      redirect_to ticket_path(@ticket)
    else
      flash.now[:error] = "Couldn't create the ticket. See errors."
      render 'new'
    end
  end

  def edit
    require_user
  end

  def update
    if @ticket.update(ticket_params)
      flash[:notice] = 'The ticket was updated.'
      redirect_to ticket_path(@ticket)
    else
      flash.now[:error] = 'Ticket could not be updated.'
      render 'tickets/show'
    end
  end

  def destroy
    if logged_in?
      @ticket.destroy
    else
      flash[:error] = 'Must be logged in to do that.'
    end

    redirect_to tickets_path
  end

  private

  def ticket_params
    params.require(:ticket).permit(:name, :body, :status, :project_id, :assignee_id, tag_ids: [])
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end
end