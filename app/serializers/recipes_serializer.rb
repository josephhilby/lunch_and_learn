class RecipesSerializer
    include JSONAPI::Serializer

    set_id {nil}
    set_type :recipe
    attributes :title, :url, :country, :image
end