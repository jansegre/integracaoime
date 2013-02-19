class Page
  include Mongoid::Document
  include Mongoid::Timestamps

  field :content
  field :name
  has_one :gallery
  has_many :menus

  validates_presence_of :content, :name
end
