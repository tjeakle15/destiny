class ClassType

  attr_accessor :id, :name

  def initialize(id, name)
    self.id = id
    self.name = name
  end

  const_set("TITAN", ClassType.new(0, "Titan"))
  const_set("HUNTER", ClassType.new(1, "Hunter"))
  const_set("WARLOCK", ClassType.new(2, "Warlock"))

  def self.find(id)
    case id
      when ClassType::TITAN.id
        return ClassType::TITAN
      when ClassType::HUNTER.id
        return ClassType::HUNTER
      when ClassType::WARLOCK.id
        return ClassType::WARLOCK
      else
        raise "Invalid ClassType"
      end
        
  end

end
