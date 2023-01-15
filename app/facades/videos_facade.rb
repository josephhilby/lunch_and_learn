class VideosFacade
	def self.get_videos(country)
    results(country).map do |data|
      Video.new(data)
    end
	end

	def self.results(country)
		YouTubeService.search_mr_history_by_country(country)[:items]
	end
end