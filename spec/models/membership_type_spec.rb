require 'rails_helper'

RSpec.describe MembershipType, type: :model do
  # Look at Bungie's docs to find out constants and they need to match that
  it "xbox should be type 1" do
    expect(MembershipType::XBOX.eql?(1))
  end
  it "playstation should be type 2" do
    expect(MembershipType::PLAYSTATION.eql?(2))
  end
end
