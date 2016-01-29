class PlayersController < ApplicationController

  def index
    
  end

  def search

    player_service = PlayerService.find(params[:gamertag], params[:membership_type_id])

    if player_service.exists?
      return redirect_to player_url(player_service.data_object.display_name.downcase)
    else
      flash = { error: "#{params[:gamertag]} does not exist on the platform." }
      return redirect_to root_url
    end

  end

  def show
    @player = PlayerService.find(params[:id], params[:membership_type_id])
  end
end
