class Image
	attr_reader :alt_tag, :url
	def initialize(attributes)
		@alt_tag = attributes[:alt]
		@url = attributes[:src][:original]
	end
end