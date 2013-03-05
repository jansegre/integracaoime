class Partner
  include Mongoid::Document

  field :name
  field :link
  field :active, type: Boolean, default: true

  index({ active: 1 })

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
