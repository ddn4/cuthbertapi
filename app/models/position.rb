class Position
  include Mongoid::Document
  field :latitude,  type: Float
  field :longitude, type: Float
  field :timestamp, type: DateTime
  
  # embedded_in :User
  belongs_to  :user # Fixing heroku error matching juxt position model
end
