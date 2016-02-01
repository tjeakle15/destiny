require 'rails_helper'

RSpec.describe DestinyUtility, type: :model do

  it "returns the most recent Tuesday" do
    expect((DestinyUtility.reset_start_date.tuesday? and DestinyUtility.reset_start_date <= Date.today))
  end

  it "returns next Tuesday" do
    expect(DestinyUtility.reset_start_date.eql?(DestinyUtility.next_reset_start_date + 7))
  end

end
