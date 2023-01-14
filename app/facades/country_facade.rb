class CountryFacade
	def self.random_country
    RestCountriesService.all_countries.sample[:name][:official]
	end

	def self.is_a_country(alleged_country)
		reusults(alleged_country).first
	end

	def self.results(alleged_country)
		RestCountriesService.search(alleged_country)
	end
end