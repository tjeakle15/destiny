require 'rails_helper'

RSpec.describe PlayerService, type: :model do
  
  it "returns valid xbox player when xbox is specified and valid player provided" do
    player_service = PlayerService.find(TestConstants::VALID_XBOX_GAMERTAG, MembershipType::XBOX)
    expect(player_service.Response.first.displayName.eql?(TestConstants::VALID_XBOX_GAMERTAG))
  end

  it "returns valid xbox player when valid player provided and no MembershipType" do
    player_service = PlayerService.find(TestConstants::VALID_XBOX_GAMERTAG)
    expect(player_service.Response.first.displayName.eql?(TestConstants::VALID_XBOX_GAMERTAG))
  end

  xit "returns valid playstation player when playstation is specified and valid player provided"

  it "returns nothing when invalid gamertag is specified for xbox" do
    player_service = PlayerService.find(TestConstants::INVALID_XBOX_GAMERTAG, MembershipType::XBOX)
    expect(player_service.ErrorCode.eql?(TestConstants::INVALID_GAMERTAG_ERROR_CODE))
  end

  xit "returns nothing when invalid gamertag is speficifed for playstaion"

  it "returns nothing when invalid platform is specified" do
    player_service = PlayerService.find(TestConstants::VALID_XBOX_GAMERTAG, TestConstants::INVALID_MEMBERSHIP_TYPE)
    expect(player_service.ErrorCode.eql?(TestConstants::INVALID_MEMBERSHIP_TYPE_ERROR_CODE))
  end

  it "popluates and returns valid data object" do
    player_service = PlayerService.find(TestConstants::VALID_XBOX_GAMERTAG, MembershipType::XBOX)
    expect(player_service.data_object.display_name.eql?(TestConstants::VALID_XBOX_GAMERTAG))
  end

end
