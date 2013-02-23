class Company
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :subscriber, :type => Boolean
  validates_presence_of :name

  has_many :users
  has_one :highlight

  attr_accessible :name, :subscriber, :user_ids

  index({ name: 1}, {unique: true, background: true})
end
