class User
  include Mongoid::Document
  field :username,           type: String
  # field :juxtapose_id,    type: String   # Store the juxtapose user id to support juxtapose API calls

  # embeds_one :position

  # has_many  :positions  # Fixing heroku error, matching juxta user model
  # validates_uniqueness_of :login
end
