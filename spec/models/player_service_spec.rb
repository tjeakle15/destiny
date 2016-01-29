require 'rails_helper'

RSpec.describe PlayerService, type: :model do
  
  it "returns valid xbox player when xbox is specified and valid player provided" do
    player_service = PlayerService.find(TestConstant::VALID_XBOX_GAMERTAG, MembershipType::XBOX.id)
    expect(player_service.Response.first.displayName.eql?(TestConstant::VALID_XBOX_GAMERTAG))
  end

  it "returns valid xbox player when valid player provided and no MembershipType" do
    player_service = PlayerService.find(TestConstant::VALID_XBOX_GAMERTAG)
    expect(player_service.Response.first.displayName.eql?(TestConstant::VALID_XBOX_GAMERTAG))
  end

  it "returns valid playstation player when playstation is specified and valid player provided" do
    player_service = PlayerService.find(TestConstant::VALID_XBOX_GAMERTAG)
    expect(player_service.Response.first.displayName.eql?(TestConstant::VALID_PLAYSTATION_GAMERTAG))
  end

  it "returns nothing when invalid gamertag is specified for xbox" do
    player_service = PlayerService.find(TestConstant::INVALID_XBOX_GAMERTAG, MembershipType::XBOX.id)
    expect(player_service.ErrorCode.eql?(TestConstant::INVALID_GAMERTAG_ERROR_CODE))
  end

  it "returns nothing when invalid gamertag is speficifed for playstaion" do
    player_service = PlayerService.find(TestConstant::INVALID_PLAYSTATION_GAMERTAG, MembershipType::PLAYSTATION.id)
    expect(player_service.ErrorCode.eql?(TestConstant::INVALID_GAMERTAG_ERROR_CODE))
  end

  it "returns nothing when invalid platform is specified" do
    player_service = PlayerService.find(TestConstant::VALID_XBOX_GAMERTAG, TestConstant::INVALID_MEMBERSHIP_TYPE)
    expect(player_service.ErrorCode.eql?(TestConstant::INVALID_MEMBERSHIP_TYPE_ERROR_CODE))
  end

  it "popluates and returns valid data object" do
    player_service = PlayerService.find(TestConstant::VALID_XBOX_GAMERTAG, MembershipType::XBOX.id)
    expect(player_service.data_object.display_name.eql?(TestConstant::VALID_XBOX_GAMERTAG))
  end

  it "returns an account linked to the player" do
    player_service = PlayerService.find(TestConstant::VALID_XBOX_GAMERTAG, MembershipType::XBOX.id)
    expect(player_service.account_service.data_object.membership_id.eql?(player_service.data_object.membership_id))
  end

  it "returns true when player exists" do
    player_service =  PlayerService.find(TestConstant::VALID_XBOX_GAMERTAG, MembershipType::XBOX.id)
    expect(player_service.exists?.eql?(true))
  end 

  it "returns false when no player exists" do
    player_service =  PlayerService.find(TestConstant::INVALID_XBOX_GAMERTAG, MembershipType::XBOX.id)
    expect(player_service.exists?.eql?(false))
  end 


end
