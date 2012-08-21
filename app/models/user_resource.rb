class UserResource < ActiveResource::Base
  # include Mongoid::Document
  self.site = Configuration.juxtapose_api_url
  self.element_name = "user"
  self.format = :json

end
