class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :set_ticket, only: [:create, :edit, :update, :destroy]

  def create
    @comment = Comment.new(comment_params)
    @comment.update(creator_id: current_user.id, ticket_id: @ticket.id)

    if @comment.save
      @ticket.update(status: params[:status])

      flash[:notice] = 'Comment created!'
      redirect_to ticket_path(@ticket)
    else
      flash[:error] = 'Could not create comment.'
      render "tickets/show"
    end
  end

  def edit
    if logged_in? && @comment.creator_id == current_user.id
      render :edit
    else
      flash[:error] = 'Must be logged in as comment creator to edit.'
      redirect_to ticket_path(@ticket)
    end
  end

  def update
    if @comment.update(comment_params)
      flash[:notice] = 'Comment edited.'
      redirect_to ticket_path(@ticket)
    else
      flash[:error] = 'Could not update the comment.'
      render :edit
    end    
  end

  def destroy
    if logged_in? && @comment.creator_id == current_user.id
      @comment.destroy
      flash[:notice] = 'Comment deleted.'
    else
      flash[:error] = 'Could not delete. Must login as comment creator.'
    end

    redirect_to ticket_path(@ticket)
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :ticket_id)
  end
end