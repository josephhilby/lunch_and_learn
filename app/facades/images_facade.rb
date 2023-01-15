class ImagesFacade
	def self.get_images(country)
		result_array = results(country)
		if result_array
			result_array.map do |data|
				Image.new(data)
			end
		else
			return []
		end
	end

	def self.results(country)
		PixleImageService.search_by_country(country)[:photos]
	end
end