class Video < Media
  field :video

  validates_presence_of :video

  def thumb i=1
    url = self.video
    if url.include? "youtube" or url.include? "youtu.be"
      id = url.match(/^(?:http:\/\/)?(?:www\.)?\w*\.\w*\/(?:watch\?v=)?((?:p\/)?[\w\-]+)/)[1]
      "http://img.youtube.com/vi/#{id}/#{i}.jpg"
    end
  end
end
