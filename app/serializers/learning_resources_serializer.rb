class LearningResourcesSerializer
  include JSONAPI::Serializer

  set_id {nil}
  set_type :learning_resource
  attributes :country, :video, :images
end