class Media
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  validates_presence_of :title
end
