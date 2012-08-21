class UserResource < ActiveResource::Base
  # include Mongoid::Document
  self.site = Configuration.juxtapose_api_url << "user/:user_id"
  self.element_name = "user"
  self.format = :json

end
