class Hint
  include Mongoid::Document
  include Mongoid::Timestamps

  field :image
  field :description
  field :published
  field :url

  mount_uploader :image, HintImageUploader

  validates_presence_of :description

  def title
    self.description
  end

  class << self
    def all_published
      where(:published.ne => nil)
    end
  end
end
