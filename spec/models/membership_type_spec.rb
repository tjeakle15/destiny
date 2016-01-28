require 'rails_helper'

RSpec.describe MembershipType, type: :model do
  # Look at Bungie's docs to find out constants and they need to match that

  it "xbox should be type 1" do
    expect(MembershipType::XBOX.eql?(TestConstant::VALID_XBOX_MEMBERSHIP_TYPE))
  end

  it "playstation should be type 2" do
    expect(MembershipType::PLAYSTATION.eql?(TestConstant::VALID_PLAYSTATION_MEMBERSHIP_TYPE))
  end
end
