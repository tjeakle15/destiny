class MembershipType
=begin  
  const_set("XBOX", 1)
  const_set("PLAYSTATION", 2)
=end
  attr_accessor :id, :name

  def initialize(id, name)
    self.id = id
    self.name = name
  end

  const_set("XBOX", ClassType.new(1, "Xbox"))
  const_set("PLAYSTATION", ClassType.new(2, "Playstation"))

  def self.find(id)
    case id
      when MembershipType::XBOX.id
        return MembershipType::XBOX
      when MembershipType::PLAYSTATION.id
        return MembershipType::PLAYSTATION
      else
        raise "Invalid MembershipType"
      end 
  end

  def self.all
    [MembershipType::XBOX, MembershipType::PLAYSTATION]
  end

end
