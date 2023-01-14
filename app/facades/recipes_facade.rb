class RecipesFacade
	def self.get_recipes(country)
    results(country).map do |data|
      Recipe.new(data[:recipe], country)
    end
	end

	def self.results(country)
		EdamamRecipeService.search_by_country(country)[:hits]
	end
end