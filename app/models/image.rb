class Image < Media
  field :image
  mount_uploader :image, ImageUploader

  validates_presence_of :image
end
