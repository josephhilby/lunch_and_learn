class LearningResourcesSerializer
    include JSONAPI::Serializer

    set_id {nil}
    set_type :learning_resource
    attributes :country, :show_video, has_many :images

    def show_video
		{
		title: video.title,
		youtube_video_id: video.@youtube_video_id
		}
	end
end