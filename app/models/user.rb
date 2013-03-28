class User
  include Mongoid::Document
  include Mongoid::Timestamps

  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable, :omniauthable

  ## Protect against mass-assignment
  attr_accessible :email, :password, :remember_me, :name, :avatar, :provider,
    :uid, :remote_avatar_url

  ## Database authenticatable
  field :email,              :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""

  validates_presence_of :email
  validates_presence_of :encrypted_password
  validates_uniqueness_of :email, :case_sensitive => false

  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  ## user detail
  field :name, :type => String

  field :provider, :type => String
  field :uid,      :type => String

  field :facebook_id
  field :facebook_token

  ## avatar
  mount_uploader :avatar, AvatarUploader

  ## Relations
  has_many :babies

  class << self
    def find_for_facebook_oauth(auth, signed_in_resource = nil)
      user = User.where(:provider => auth.provider, :uid => auth.uid).first
      unless user
        # TODO: Merge existing account
        user = User.create(provider: auth.provider,
                           uid: auth.uid,
                           email: auth.info.email,
                           name: auth.info.name,
                           password:Devise.friendly_token[0, 20],
                           remote_avatar_url: auth.info.image.gsub("square",
                                                                   "large"))
      end

      user
    end
  end

  def babynames
    babies.map(&:username)
  end
end
