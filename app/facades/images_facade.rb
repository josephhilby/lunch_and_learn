class ImagesFacade
	def self.get_images(country)
    results(country).map do |data|
      Image.new(data)
    end
	end

	def self.results(country)
		PixleImageService.search_by_country(country)
	end
end