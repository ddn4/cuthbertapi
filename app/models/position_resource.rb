class PositionResource < ActiveResource::Base
  # Position is a nested reource under User in Juxtapose
  # Append User to base site to hande nested route
  self.site = Configuration.juxtapose_api_url
  self.prefix = "/users/:user_id/"
  self.element_name = "position"
  self.format = :json
end
