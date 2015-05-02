class Facebook < ActiveRecord::Base
  require "koala"

  @@graph = Koala::Facebook::API.new([ENV["FACEBOOK_API_KEY"]])

  def self.page_feed
    @@graph.get_connection("477172595731068", "posts")
  end

  def self.page_albums
    @@graph.get_connection("477172595731068", 
      "albums",
      {fields: ['message', 'id', 'from', 'type',
        'picture', 'link', 'created_time', 
        'updated_time']})
  end

end
