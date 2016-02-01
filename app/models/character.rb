class Character

  attr_accessor :id, :class_type, :level, :light_level, :emblem_background_path, :emblem_path, :emblem_background_url, :emblem_url

  def initialize(id, class_type_id, level, light_level, emblem_background_path, emblem_path)
    self.id = id
    self.class_type = ClassType.find(class_type_id)
    self.level = level
    self.light_level = light_level
    self.emblem_background_path = emblem_background_path
    self.emblem_path = emblem_path
    self.emblem_background_url = Destiny::LINK_ROOT + emblem_background_path
    self.emblem_url = Destiny::LINK_ROOT + emblem_path
  end

end