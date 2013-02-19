class Gallery
  include Mongoid::Document

  field :title
  has_many :medias
  belongs_to :page

  validates_presence_of :title
end
