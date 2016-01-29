class PlayerService < DestinyResource
  
  self.site = "http://www.bungie.net/Platform/Destiny/SearchDestinyPlayer/:membership_type/:gamertag/?ignorecase=true"

  def exists?
    self.Response.size > 0
  end

  def account_service
    AccountService.find(self.data_object.membership_id)
  end

  def data_object
    PlayerService.data_object(self.Response.first.attributes)
  end


  def self.find(*arguments)
    if arguments.size > 2 or arguments.size == 0
      raise "Can only pass two arguement for accounts and must pass in more than zero."
    elsif arguments.size == 1
      arguments.push(MembershipType::XBOX.id)
    elsif arguments[1].to_s.empty?
      arguments[1] = MembershipType::XBOX.id
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
    path = PlayerService.site.to_s.sub(":gamertag", scope[0].gsub(" ", "%20").downcase).sub(":membership_type", scope[1].to_s.gsub(" ", "%20").downcase).sub("http://www.bungie.net", "")
    #raise "path: #{path}"
    instantiate_record(format.decode(connection.get(path, headers).body), prefix_options)
  end
end
