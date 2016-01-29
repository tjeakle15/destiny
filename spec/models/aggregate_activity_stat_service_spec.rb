require 'rails_helper'

RSpec.describe AggregateActivityStatService, type: :model do
  
  it "returns a successful array of stats" do
    player_service = PlayerService.find(TestConstant::VALID_XBOX_GAMERTAG) 
    expect(AggregateActivityStatService.find(MembershipType::XBOX.id, player_service.data_object.membership_id, player_service.account_service.character_data_objects.first.character_id).ErrorCode == TestConstant::VALID_AGGREGATE_STATS_ERROR_CODE)
  end

  #TODO: Add more if I actually use this!
end
