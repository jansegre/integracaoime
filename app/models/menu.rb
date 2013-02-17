class Menu
  include Mongoid::Document
  include Mongoid::Tree
  include Mongoid::Tree::Ordering

  field :title
  field :slug
  field :active, type: Boolean, default: true
  #belongs_to :page

  validates_presence_of :title

  index({ active: 1 }, { background: true })
  index({ slug: 1 }, { unique: true, background: true })

  def active_children
    children.where(active: true)
  end

  class << self
    def root_menu
      find_by(slug: "root")
    end
  end
end
