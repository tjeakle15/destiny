require 'rails_helper'

RSpec.describe Character, type: :model do
  # Look at Bungie's docs to find out constants and they need to match that

  it "creates a new character" do
    #initialize(id, class_type_id, level, light_level, emblem_background, emblem)
    character = Character.new("1", TestConstant::VALID_CLASS_TYPE_TITAN_ID, "1", "1", "here.jpg", "there.png")
    expect(character.id.eql?("1"))
    expect(character.class_type.eql?(ClassType::TITAN))
    expect(character.level.eql?("1"))
    expect(character.level.eql?("1"))
    expect(character.emblem_path.eql?("here.jpg"))
    expect(character.emblem_background_path.eql?("there.jpg"))
    expect(character.emblem_path.eql?("#{Destiny::LINK_ROOT}here.jpg"))
    expect(character.emblem_background_path.eql?("#{Destiny::LINK_ROOT}there.jpg"))
  end


end