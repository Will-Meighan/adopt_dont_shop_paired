class FavoritesList
  attr_reader :pets_favorite

  def initialize(pets_favorite)
    @pets_favorite = pets_favorite || Hash.new(0)
  end

  def total_count
    @pets_favorite.values.sum
  end

  def add_pet(pet_id)
    @pets_favorite[pet_id.to_s] = count_of(pet_id) + 1
  end

  def count_of(pet_id)
    @pets_favorite[pet_id.to_s].to_i
  end

  def has_pet?(pet_id)
    @pets_favorite.keys.include?(pet_id.to_s)
  end

  def remove_pet(pet_id)
    @pets_favorite.delete(pet_id.to_s)
  end
end
