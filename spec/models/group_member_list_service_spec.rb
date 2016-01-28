require 'rails_helper'

RSpec.describe GroupMemberListService, type: :model do
  
  it "returns a list of 10 group members for xbox with no params" do
    result = GroupMemberListService.find_ten_members(TestConstant::VALID_XBOX_GROUP_ID)
    expect(result.Response.results.size == 10)
  end

  it "returns a list of 10 group members for xbox with type param" do
    result = GroupMemberListService.find_ten_members(TestConstant::VALID_XBOX_GROUP_ID, MembershipType::XBOX)
    expect(result.Response.results.size == 10)
  end

  it "returns a list of 10 group members for xbox with type param and page no" do
    result = GroupMemberListService.find_ten_members(TestConstant::VALID_XBOX_GROUP_ID, MembershipType::XBOX, 1)
    expect(result.Response.results.size == 10)
  end

  it "returns a list of 10 group members for playstation with type param " do
    result = GroupMemberListService.find_ten_members(TestConstant::VALID_PLAYSTATION_GROUP_ID, MembershipType::PLAYSTATION)
    expect(result.Response.results.size == 10)
  end

  it "returns a list of 10 group members for playstation with type param and page no" do
    result = GroupMemberListService.find_ten_members(TestConstant::VALID_PLAYSTATION_GROUP_ID, MembershipType::PLAYSTATION, 1)
    expect(result.Response.results.size == 10)
  end

  it "returns the full data object list of group members for xbox without param" do
    result = GroupMemberListService.find_all_members_data_object(TestConstant::VALID_XBOX_GROUP_ID)
    expect(result.size > 10)
  end

  it "returns the full data object list of group members for xbox with member type param" do
    result = GroupMemberListService.find_all_members_data_object(TestConstant::VALID_XBOX_GROUP_ID, MembershipType::XBOX)
    expect(result.size > 10)
  end


  it "returns the full data object list of group members for playstation" do
    result = GroupMemberListService.find_all_members_data_object(TestConstant::VALID_PLAYSTATION_GROUP_ID, MembershipType::PLAYSTATION)
    expect(result.size > 10)
  end

end
