class RestCountriesService
	def self.search(alleged_country)
		get_url("/v3.1/name/#{alleged_country}")
	end

  def self.all_countries
    get_url("/v3.1/all")
  end

	def self.get_url(url)
		JSON.parse(conn.get(url).body, symbolize_names: true)
	end

	def self.conn
		Faraday.new(url: 'https://restcountries.com') do |f|
			f.adapter Faraday.default_adapter
		end
	end
end