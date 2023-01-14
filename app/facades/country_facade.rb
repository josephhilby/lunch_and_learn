class CountryFacade
	def self.random_country
    RestCountriesService.all_countries.sample[:name][:common]
	end

	def self.is_a_country(alleged_country)
    if results(alleged_country)
		  results(alleged_country)[:name][:common]
    else
      return nil
    end
	end

	def self.results(alleged_country)
		RestCountriesService.search(alleged_country)[0]
	end
end