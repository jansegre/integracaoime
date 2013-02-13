class Highlight
  include Mongoid::Document
  include Mongoid::Timestamps

  field :image
  field :description
  field :title

  mount_uploader :image, HighlightUploader

  validates_presence_of :image, :description, :title

  attr_accessible :image, :image_cache, :description, :title

  belongs_to :company
end
