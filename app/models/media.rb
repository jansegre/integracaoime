class Media
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :description
  belongs_to :gallery

  validates_presence_of :title
end
