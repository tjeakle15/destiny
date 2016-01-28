class PlayerService < DestinyResource
  #1 is xbox
  self.site = "http://www.bungie.net/Platform/Destiny/SearchDestinyPlayer/:membership_type/:gamertag/?ignorecase=true"

  def data_object
    PlayerService.data_object(self.Response.first.attributes)
  end


  def self.find(*arguments)
    if arguments.size > 2 or arguments.size == 0
      raise "Can only pass two arguement for accounts and must pass in more than one."
    elsif arguments.size == 1
      arguments.push(MembershipType::XBOX)
    end
    scope   = arguments
    options = arguments
    find_single(scope, options)
  end

  private
  def self.find_single(scope, options)
    #prefix_options, query_options = split_options(options[:params])
    prefix_options = nil
    #path = element_path(scope, prefix_options, query_options)
    #raise "site: #{Account.site}, scope: #{scope}, options: #{options}"
    path = PlayerService.site.to_s.sub(":gamertag", scope[0]).sub(":membership_type", scope[1].to_s).sub("http://www.bungie.net", "")
    #raise "path: #{path}"
    instantiate_record(format.decode(connection.get(path, headers).body), prefix_options)
  end
end
