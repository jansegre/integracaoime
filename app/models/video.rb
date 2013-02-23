class Video < Media
  field :video

  validates_presence_of :video
end
