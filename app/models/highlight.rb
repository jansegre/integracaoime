class Highlight
  include Mongoid::Document
  include Mongoid::Timestamps

  field :image
  field :description
  field :title
  field :link
  field :active, type: Boolean, default: false

  belongs_to :company

  mount_uploader :image, HighlightUploader

  validates_presence_of :image, :description, :title

  index({ active: 1 }, { background: true })

  def activate!
    self.active = true
  end

  def deactivate!
    self.active = false
  end

  class << self
    def all_active
      where active: true
    end
  end
end
