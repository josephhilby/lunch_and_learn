class CleanDbJob
  include Sidekiq::Job

  def perform(*args)
    if UsersFavorite.where(favorite_id: args).empty?
      Favorite.delete(args)
    end
  end
end
