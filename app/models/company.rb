class Company
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :legal_name
  field :cnpj
  field :address
  field :subscriber, type: Boolean
  field :site
  field :logo
  field :headline

  mount_uploader :logo, HintImageUploader

  has_many :users
  has_one :highlight
  belongs_to :page

  validates_presence_of :name, :legal_name, :cnpj, :address

  index({ name: 1 }, { unique: true, background: true })
end
