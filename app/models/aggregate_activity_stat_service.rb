class AggregateActivityStatService < DestinyResource

  #TODO: FIGURE OUT AND TEST STUFF!!!
  #TODO: ADD MORE IF I EVER USE THIS!
  
  self.site = "http://www.bungie.net/Platform/Destiny/Stats/AggregateActivityStats/:membership_type_id/:membership_id/:character_id/"

  def self.find(*arguments)
    #if arguments.size > 2 or arguments.size == 0
    #  raise "Can only pass two arguement for accounts and must pass in more than zero."
    #elsif arguments.size == 1
    #  arguments.push(MembershipType::XBOX)
    #elsif arguments[1].to_s.empty?
    #  arguments[1] = MembershipType::XBOX
    #end
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
    path = AggregateActivityStatService.site.to_s.sub(":membership_type_id", scope[0].to_s.gsub(" ", "%20").downcase).sub(":membership_id", scope[1].to_s.gsub(" ", "%20").downcase).sub(":character_id", scope[2].to_s.gsub(" ", "%20").downcase).sub("http://www.bungie.net", "")
    #raise "path: #{path}"
    instantiate_record(format.decode(connection.get(path, headers).body), prefix_options)
  end

end
