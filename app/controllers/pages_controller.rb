class PagesController < ApplicationController
before_action :authenticate_user!, only: [:gossip]

def gossip
  @gossip = Gossip.all
  @user = current_user
end

def index
end

end
