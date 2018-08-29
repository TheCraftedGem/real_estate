require 'pry'
class House
  attr_reader :price,
              :address,
              :rooms
  def initialize(price, address)
     @price = price
     @address = address
     @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def rooms_from_category(category)
    @rooms.keep_if do |element|
      element.category == category
    end
  end

  def area
    @rooms.sum do |element|
      element.area
    end
  end

  def price_per_square_foot
   sq_ft_price = convert_price_to_interger.to_f / area
   sq_ft_price.round(2)
  end

  def rooms_sorted_by_area
    @rooms.sort_by do |element|
      element.area
    end
  end

  def convert_price_to_interger
   price_string_array = @price.chars
   dropped_dollar_sign_array = price_string_array.drop(1)
   @converted_intergers = dropped_dollar_sign_array.map do |element|
     element.to_i
   end.join.to_i
  end
end
  