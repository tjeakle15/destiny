require 'active_resource'  
class DestinyResource < ActiveResource::Base
  self.include_format_in_path = false
  headers["X-API-Key"] = "894450e853b644668604043f1ba7fa25" # boo hiss, I want it dynamically!

  def self.find(*arguments)
    if arguments.size != 1
      raise "Can only pass one arguement for accounts"
    else
      scope   = arguments.slice!(0)
      options = arguments.slice!(0)
      #raise "scope: #{scope.class}, options: #{options}"
      find_single(scope, options)
    end
  end

  private

  def self.data_object(object)
    mash = Hashie::Mash.new
    for key, value in object
      mash[key.underscore] = value
    end
    mash
  end

end