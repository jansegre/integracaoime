class Page
  include Mongoid::Document
  include Mongoid::Timestamps

  field :content
  field :name
  has_one :gallery
  has_many :menus
  field :show_companies, type: Boolean, default: false
  field :show_members, type: Boolean, default: false

  validates_presence_of :content, :name
end
