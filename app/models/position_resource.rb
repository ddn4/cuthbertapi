class PositionResource < ActiveResource::Base
  # Position is a nested reource under User in Juxtapose
  # Append User to base site to hande nested route
  self.site = Configuration.juxtapose_api_url
  self.prefix = "/users/:user_id/"
  self.element_name = "position"
  self.format = :json

  schema do
    float :latitude, :longitude
    datetime :timestamp
  end

  validates_presence_of :latitude, :longitude, :timestamp
  validates_numericality_of :latitude, :longitude
  validates_format_of :timestamp, :with => /\A(20)\d\d[-](0[1-9]|(1[0-2]))[-](0[1-9]|[12][0-9]|3[01])[ ](0[0-9]|1[0-9]|2[0-4])[:]([0-5]\d)[:]([0-5]\d)\Z/i,
                                  :message => "Invalid format, expecting YYYY-MM-DD HH:MM:SS"

    # erorrs.add(:happened_at, 'must be a valid datetime') if ((DateTime.parse(happened_at) rescue ArgumentError) == ArgumentError)
    # dd-mm-yyyy /(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d/
    # yyyy-mm-dd hh:mm:ss /(20)\d\d[-](0[1-9]|(1[0-2]))[-](0[1-9]|[12][0-9]|3[01])[ ](0[0-9]|1[0-9]|2[0-4])[:]([0-5]\d)[:]([0-5]\d)
end
