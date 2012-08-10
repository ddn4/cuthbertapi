class Position
  include Mongoid::Document
  field :latitude,  type: Float
  field :longitude, type: Float
  field :timestamp, type: DateTime
  
  # embedded_in :User
end
