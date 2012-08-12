class User
  include Mongoid::Document
  field :login,           type: String
  field :juxtapose_id,    type: String   # Store the juxtapose user id to support juxtapose API calls

  embeds_one :position

  validates_uniqueness_of :login
end
