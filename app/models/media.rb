class Media
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :description

  validates_presence_of :title
end
