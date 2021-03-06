require 'rails_helper'

RSpec.describe AccountService, type: :model do

  it "finds an account with a valid membership id" do
    player_service = PlayerService.find(TestConstant::VALID_XBOX_GAMERTAG)
    account_service = AccountService.find(player_service.data_object.membership_id)
    expect(account_service.Response.data.characters.size.eql?(TestConstant::VALID_XBOX_GAMERTAG_CHARACTER_NUMBER))
  end

  it "does not find an account with an invalid membership id" do
    account_service = AccountService.find(TestConstant::INVALID_MEMBERSHIP_ID)
    expect(account_service.ErrorCode.eql?(TestConstant::INVALID_MEMBERSHIP_ID_ERROR_CODE))
  end

  it "returns the data object with valid membership id" do
    player_service = PlayerService.find(TestConstant::VALID_XBOX_GAMERTAG)
    account_service = AccountService.find(player_service.data_object.membership_id)
    expect(account_service.data_object.characters.size.eql?(TestConstant::VALID_XBOX_GAMERTAG_CHARACTER_NUMBER))
  end

  it "returns three character data objects" do
    player_service = PlayerService.find(TestConstant::VALID_XBOX_GAMERTAG)
    expect(player_service.account_service.character_data_objects.size.eql?(3))
  end
end
