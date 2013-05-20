class Logo
  include Mongoid::Document

  field :name
  field :image_svg
  field :image_png
  field :height, type: Integer
  field :width, type: Integer
  field :is_sponsor, type: Boolean
  field :active, type: Boolean, default: false

  mount_uploader :image_svg, LogoSvgUploader
  mount_uploader :image_png, LogoPngUploader

  validates_presence_of :name, :image_svg, :image_png, :is_sponsor, :height, :width

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
