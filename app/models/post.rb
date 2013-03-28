class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  field :message, :type => String, :default => ""

  mount_uploader :picture, ImageUploader

  embedded_in :baby
end
