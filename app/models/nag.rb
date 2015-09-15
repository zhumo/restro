class Nag
  attr_accessor :contents, :status

  def initialize(restaurant_info)
    @contents = restaurant_info[:contents]
    @status = restaurant_info[:status]
  end
end
