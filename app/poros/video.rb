class Video
	attr_reader :title, :youtube_video_id
	def initialize(attributes)
		@title = attributes[:snippet][:title]
		@youtube_video_id = attributes[:id][:videoId]
	end
end