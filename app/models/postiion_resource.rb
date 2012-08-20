class PostiionResource < ActiveResource::Base
  # include Mongoid::Document
  self.site = Configuration.juxtapose_api_url + '/users/:user_id'
  self.element_name = "position"
  self.format = :json
end
