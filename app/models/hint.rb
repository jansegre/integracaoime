class Hint
  include Mongoid::Document
  include Mongoid::Timestamps

  field :image,       type: String
  field :description, type: String
  field :published,   type: Date

  mount_uploader :image, HintImageUploader

  validates_presence_of :description

  attr_accessible :image, :image_cache, :description, :published

  def self.all_published
    where(:published.ne => nil)
  end
end
