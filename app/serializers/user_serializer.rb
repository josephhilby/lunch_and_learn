class UserSerializer
    include JSONAPI::Serializer

    set_type :user
    set_id :id
    attributes :name, :email, :api_key
end