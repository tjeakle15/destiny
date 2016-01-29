require 'rails_helper'

RSpec.describe ClassType, type: :model do
  # Look at Bungie's docs to find out constants and they need to match that

  it "has a titan constant that should be type 0" do
    expect(ClassType::TITAN.eql?(TestConstant::VALID_CLASS_TYPE_TITAN_ID))
  end

  it "has a hunter constant that hunter should be type 1" do
    expect(ClassType::HUNTER.eql?(TestConstant::VALID_CLASS_TYPE_HUNTER_ID))
  end

  it "has a warlock constant that warlock should be type 2" do
    expect(ClassType::WARLOCK.eql?(TestConstant::VALID_CLASS_TYPE_WARLOCK_ID))
  end

  it "should return the titan class type object" do
    expect(ClassType.find(TestConstant::VALID_CLASS_TYPE_TITAN_ID).eql?(ClassType::TITAN))
  end

  it "should return the hunter class type object" do
    expect(ClassType.find(TestConstant::VALID_CLASS_TYPE_HUNTER_ID).eql?(ClassType::HUNTER))
  end

  it "should return the warlock class type object" do
    expect(ClassType.find(TestConstant::VALID_CLASS_TYPE_WARLOCK_ID).eql?(ClassType::WARLOCK))
  end

  it "should raise error with invalid id" do
    expect{
            ClassType.find(TestConstant::INVALID_CLASS_TYPE_ID)
          }.to raise_error(RuntimeError)
  end
  
end