class LearningResource
  attr_reader :country, :video, :images
  def initialize(country, video, images)
    @country = country.country
    @video = {
      title: video.title,
      youtube_video_id: video.youtube_video_id
    }
    @images = images.map { |image| {
      alt_tag: image.alt_tag,
      url: image.url } }
  end
end