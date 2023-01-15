class YouTubeService
	def self.search_mr_history_by_country(country)
		get_url("/youtube/v3/search?part=snippet&channelId=UCluQ5yInbeAkkeCndNnUhpw&q=#{country}&type=video")
	end

	def self.get_url(url)
		JSON.parse(conn.get(url).body, symbolize_names: true)
	end

	def self.conn
		Faraday.new(url: 'https://youtube.googleapis.com') do |f|
			f.adapter Faraday.default_adapter
      f.params['key'] = ENV['yt_key']
		end
	end
end