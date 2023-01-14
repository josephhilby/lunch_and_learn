class EdamamRecipeService
	def self.search(country)
		get_url("/api/recipes/v2?type=public&q=#{country}")
	end

	def self.get_url(url)
		JSON.parse(conn.get(url).body, symbolize_names: true)
	end

	def self.conn
		Faraday.new(url: 'https://api.edamam.com') do |f|
			f.adapter Faraday.default_adapter
      f.params['app_id'] = ENV['edam_app_id']
      f.params['app_key'] = ENV['edam_app_key']
		end
	end
end