require 'rails_helper'

RSpec.describe PlayerService, type: :model do
  #Constants used in tests
  VALID_XBOX_PLAYER = "tj71587"
  INVALID_XBOX_PLAYER = "tj717171717"
  INVALID_MEMBERSHIP_TYPE = "100"
  INVALID_PLAYER_ERROR_CODE = 1
  INVALID_MEMBERSHIP_TYPE_ERROR_CODE = 7

  it "returns valid xbox player when xbox is specified and valid player provided" do
    player_service = PlayerService.find(VALID_XBOX_PLAYER, MembershipType::XBOX)
    expect(player_service.Response.first.displayName.eql?(VALID_XBOX_PLAYER))
  end

  it "returns valid xbox player when valid player provided and no MembershipType" do
    player_service = PlayerService.find(VALID_XBOX_PLAYER)
    expect(player_service.Response.first.displayName.eql?(VALID_XBOX_PLAYER))
  end

  xit "returns valid playstation player when playstation is specified and valid player provided"

  it "returns nothing when invalid gamertag is specified for xbox" do
    player_service = PlayerService.find(INVALID_XBOX_PLAYER, MembershipType::XBOX)
    expect(player_service.ErrorCode.eql?(INVALID_PLAYER_ERROR_CODE))
  end

  xit "returns nothing when invalid gamertag is speficifed for playstaion"

  it "returns nothing when invalid platform is specified" do
    player_service = PlayerService.find(VALID_XBOX_PLAYER, INVALID_MEMBERSHIP_TYPE)
    expect(player_service.ErrorCode.eql?(INVALID_MEMBERSHIP_TYPE_ERROR_CODE))
  end

  it "popluates and returns valid data object" do
    player_service = PlayerService.find(VALID_XBOX_PLAYER, MembershipType::XBOX)
    expect(player_service.data_object.display_name.eql?(VALID_XBOX_PLAYER))
  end

end
