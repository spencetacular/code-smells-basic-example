class Owner < ActiveRecord::Base
  has_many :cats, dependent: :destroy



  def update_all_cats_to_the_same_info_that_i_am_passing_in(name, age, fur_color, ft, update_food = false)
    self.cats.each do |cat|
      cat.name = name
      cat.age = age
      cat.fur_color = fur_color
      cat.eye_color = ec
      cat.food_type = ft
      cat.save
    end
  end
end
