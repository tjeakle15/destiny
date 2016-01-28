class AccountService < DestinyResource

  self.site = "http://www.bungie.net/Platform/Destiny/1/Account/:membership_id/Summary/?ignorecase=true"
  
  def data_object
    AccountService.data_object(self.Response.data.attributes)
  end

  private
  
  def self.find_single(scope, options)
    #prefix_options, query_options = split_options(options[:params])
    prefix_options = nil
    #path = element_path(scope, prefix_options, query_options)
    #raise "site: #{Account.site}, scope: #{scope}, options: #{options}"
    path = AccountService.site.to_s.sub(":membership_id", scope).sub("http://www.bungie.net", "")
    #raise "path: #{path}"
    instantiate_record(format.decode(connection.get(path, headers).body), prefix_options)
  end

end
