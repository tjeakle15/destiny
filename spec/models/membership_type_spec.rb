require 'rails_helper'

RSpec.describe MembershipType, type: :model do
  # Look at Bungie's docs to find out constants and they need to match that

  it "xbox should be type 1" do
    expect(MembershipType::XBOX.id.eql?(TestConstant::VALID_XBOX_MEMBERSHIP_TYPE_ID))
  end

  it "playstation should be type 2" do
    expect(MembershipType::PLAYSTATION.id.eql?(TestConstant::VALID_PLAYSTATION_MEMBERSHIP_TYPE_ID))
  end

  it "finds xbox with the xbox id" do
    expect(MembershipType::XBOX.id.eql?(MembershipType.find(TestConstant::VALID_XBOX_MEMBERSHIP_TYPE_ID).id))
  end

  it "finds playstation with the playstation id" do
    expect(MembershipType::PLAYSTATION.id.eql?(MembershipType.find(TestConstant::VALID_PLAYSTATION_MEMBERSHIP_TYPE_ID).id))
  end

  it "errors with an invald id" do
    expect{
            MembershipType.find(TestConstant::INVALID_MEMBERSHIP_TYPE_ID)
          }.to raise_error(RuntimeError)
  end

  it "all returns xbox and playstation" do
    expect(MembershipType.all.eql?([MembershipType::XBOX, MembershipType::PLAYSTATION]))
  end

end
