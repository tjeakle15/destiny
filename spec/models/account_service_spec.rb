require 'rails_helper'

RSpec.describe AccountService, type: :model do
  VALID_XBOX_PLAYER = "tj71587"
  INVALID_MEMBERSHIP_ID = "11111111111111111111111111111111"
  VALID_XBOX_PLAYER_CHARACTER_NUMBER = 3
  INVALID_MEMBERSHIP_ID_ERROR_CODE = 7

  it "finds an account with a valid membership id" do
    player_service = PlayerService.find("tj71587")
    account_service = AccountService.find(player_service.data_object.membership_id)
    expect(account_service.Response.data.characters.size.eql?(VALID_XBOX_PLAYER_CHARACTER_NUMBER))
  end

  it "does not find an account with an invalid membership id" do
    account_service = AccountService.find(INVALID_MEMBERSHIP_ID)
    expect(account_service.ErrorCode.eql?(INVALID_MEMBERSHIP_ID_ERROR_CODE))
  end

  it "returns the data object with valid membership id" do
    player_service = PlayerService.find("tj71587")
    account_service = AccountService.find(player_service.data_object.membership_id)
    expect(account_service.data_object.characters.size.eql?(VALID_XBOX_PLAYER_CHARACTER_NUMBER))
    byebug
  end
end
