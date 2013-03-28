class Baby
  include Mongoid::Document
  include Mongoid::Timestamps

  ## Protect against mass-assignment
  attr_accessible :username, :user_id, :first_name, :last_name, :birthday

  ## Baby Details
  field :username,   :type => String, :default => ""
  field :first_name, :type => String, :default => ""
  field :last_name,  :type => String, :default => ""
  field :birthday,   :type => Date, :default => ""

  validates_presence_of :username, :first_name, :last_name, :birthday
  index({ username: 1 }, { unique: true })

  ## Relations
  belongs_to :user
  embeds_many :posts

end
