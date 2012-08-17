# Class used to interface with the juxtapose API
class Juxtapose
  # include Mongoid::Document
  include HTTParty
  format  :json
  base_uri Configuration.juxtapose_api_url.to_s

  def self.post_new_position(id, lat, lon, timestamp)
    post('/users/' + id.to_s  + '/positions.json',
      :body => { :position => {:latitude => lat, :longitude => lon, :timestamp => timestamp } }
    )
  end  

  def self.get_users
    get('/users.json')
  end
end
