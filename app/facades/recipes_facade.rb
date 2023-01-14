class RecipesFacade
	def self.get_recipes(country)
    results(country)
	end

	def self.results(country)
		EdamamRecipeService.search_by_country(country)
	end
end