class PlayersController < ApplicationController

  def index
    
  end

  def search

    if params[:gamertag].nil? or params[:gamertag].empty?
      flash[:error] = "You must enter a gamertag to search for a player."
      return redirect_to root_url
    end

    player_service = PlayerService.find(params[:gamertag], params[:membership_type_id])

    if player_service.exists?
      return redirect_to player_url(player_service.data_object.display_name.downcase)
    else
      flash[:error] = "#{params[:gamertag]} does not exist on the platform."
      return redirect_to root_url
    end

  end

  def show
    @player = PlayerService.find(params[:id], params[:membership_type_id])
    @characters = Array.new
    for character in @player.account_service.Response.data.characters
      @characters.push(Character.new(character.characterBase.characterId, 
                                     character.characterBase.classType, 
                                     character.baseCharacterLevel, 
                                     character.characterBase.powerLevel, 
                                     character.backgroundPath, 
                                     character.emblemPath))
    end
  end
end
