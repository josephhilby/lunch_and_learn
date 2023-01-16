class FavoritesSerializer
    include JSONAPI::Serializer

    set_type :favorite
    set_id :id
    attributes :recipe_title, :recipe_link, :country, :created_at
end