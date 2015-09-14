class Restaurant
  attr_accessor :name, :thumb_url_image, :food_type, :desc

  def initialize(restaurant_info)
    @name = restaurant_info["name"]
    @thumb_url_image = restaurant_info["thumb_url_image"]
    @food_type = restaurant_info["food_type"]
    @desc = restaurant_info["desc"]
  end
end
