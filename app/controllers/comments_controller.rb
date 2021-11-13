class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create!(
      content: params[:content], 
      user: current_user, 
      gossip: Gossip.find(params[:gossip_id])
    )
    redirect_to gossip_path(@comment.gossip_id)
  end

  def edit
    @comment = Comment.find(params[:id])
    @gossip = Gossip.find(params[:gossip_id])
  end

  def update # UPDATE NON FOCNTIONNEL REVOIR A LA FIN
    @comment = Comment.find(params[:id])
    @comment.update( content: params[:comment][:content], gossip: Gossip.find(params[:gossip_id]), user: current_user)
    redirect_to gossip_path(@comment.gossip_id)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to gossip_path(@comment.gossip_id)
  end

end
