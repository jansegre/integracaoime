class Menu
  include Mongoid::Document
  include Mongoid::Tree
  include Mongoid::Tree::Ordering

  field :title
  field :slug
  field :active, type: Boolean, default: true

  belongs_to :page

  validates_presence_of :title

  index({ active: 1 }, { background: true })
  index({ slug: 1 }, { unique: true, background: true })

  def active_children
    children.where active: true
  end

  def active_siblings
    siblings.where active: true
  end

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

    def root_menu
      find_by slug: "__root__"
    end

    def company_menu
      find_by slug: "__company__"
    end
  end
end
