class Initiative
  include Mongoid::Document

  field :name,        type: String
  field :description, type: String
  field :image,       type: String
  field :site,        type: String

  mount_uploader :image, HintImageUploader

  validates_presence_of :name
end
