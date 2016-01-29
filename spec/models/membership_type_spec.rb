require 'rails_helper'

RSpec.describe MembershipType, type: :model do
  # Look at Bungie's docs to find out constants and they need to match that

  it "xbox should be type 1" do
    expect(MembershipType::XBOX.id.eql?(TestConstant::VALID_XBOX_MEMBERSHIP_TYPE_ID))
  end

  it "playstation should be type 2" do
    expect(MembershipType::PLAYSTATION.id.eql?(TestConstant::VALID_PLAYSTATION_MEMBERSHIP_TYPE_ID))
  end

  xit "finds xbox with the xbox id"
  xit "finds playstation with the playstation id"
  xit "errors with an invald id"
  xit "all returns xbox and playstation"

end
