class GossipsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(
      title: params[:title],
      content: params[:content],
      user: current_user
    )
    if @gossip.save
      redirect_to gossip_path(@gossip.id)
    else
      render :new
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(gossip_params)
      redirect_to gossip_path(@gossip.id)
    else
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to root_path
  end

  private 
  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end
end
