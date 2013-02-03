class Resume
  include Mongoid::Document
  include Mongoid::Timestamps

  field :references, type: Array

  belongs_to :user
end
