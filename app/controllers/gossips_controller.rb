class GossipsController < ApplicationController

  def index
  	@gossips = Gossip.all
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @user = current_user
    @gossip = @user.gossips.new(person_params)
      if @gossip.save
        flash.now[:success] = "Votre gossip a ete ajoute"
        redirect_to '/gossip'
      else
        render 'new'
        flash.now[:error] = "Le gossip n'a pas été créé"
      end
  end

  def show
    @user = current_user
    @gossip = Gossip.find(params[:id])
  end

  def edit
    @gossip = Gossip.find(params[:id])
    @user = current_user
  end

  def update
    @user = current_user
    @gossip = Gossip.find(params[:id])
    if @gossip.update(person_params)
     redirect_to @gossip
    end
  end

  def destroy
    @user = current_user
    @gossip = Gossip.find(params[:id])
    if @gossip.user_id == current_user.id
      @gossip.destroy
      redirect_to '/gossip'
    else
     flash.now[:error] = "Vous n'etes pqs qutorise a supprimer ce gossip"
     redirect_to '/gossip'
    end
  end


  private
    def person_params
      params.require(:gossip).permit(:content, :user_name)
    end

end
