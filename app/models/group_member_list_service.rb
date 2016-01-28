class GroupMemberListService < DestinyResource
  self.site ="http://www.bungie.net/Platform/Group/:group_id/Members/?lc=en&fmt=true&currentPage=:page_no&platformType=:membership_type"

  def self.find_all_members_data_object(group_id, membership_type = MembershipType::XBOX, page_no = 1)
    result = GroupMemberListService.find_ten_members(group_id, membership_type, page_no)
    records = result.Response.results
    if records.size%10 == 0 and records.size > 0
      records.concat(GroupMemberListService.find_all_members_data_object(group_id, membership_type, page_no + 1))
    end
    records
  end


  def self.find_ten_members(group_id, membership_type = MembershipType::XBOX, page_no = 1)
    GroupMemberListService.find(group_id, page_no, membership_type)
  end

  def self.find(*arguments)
    if arguments.size > 3 or arguments.size == 0
      raise "Can only pass three arguement for accounts and must pass in more than zero."
    elsif arguments.size == 1
      arguments.push(1) #view first page
      arguments.push(MembershipType::XBOX)
    elsif arguments.size == 2
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
    #raise "HELLOW ClanPlayer::SITE: #{ClanPlayer::SITE}"
    path = self.site.to_s.sub(":group_id", scope[0].to_s).sub(":membership_type", scope[2].to_s).sub(":page_no", scope[1].to_s).sub("http://www.bungie.net", "")
    #raise "path: #{path}"
    #raise "i did it! path: #{path}"
    instantiate_record(format.decode(connection.get(path, headers).body), prefix_options)
  end

end
