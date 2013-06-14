class Sponsor
  include Mongoid::Document
  include Mongoid::Timestamps

  field :image
  field :title
  field :content
  field :link
  field :active, type: Boolean, default: false

  mount_uploader :image, HintImageUploader

  validates_presence_of :image, :content, :title

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
