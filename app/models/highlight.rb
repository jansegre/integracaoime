class Highlight
  include Mongoid::Document
  include Mongoid::Timestamps

  field :image, type: String
  field :description, type: String

  mount_uploader :image, HighlightUploader

  validates_presence_of :image, :description

  attr_accessible :image, :image_cache, :description

  has_one :company
end
