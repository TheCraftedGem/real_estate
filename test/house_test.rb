require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'


class HouseTest < Minitest::Test
  
  def test_it_exists
    house = House.new("$400000", "123 sugar lane")
    assert_instance_of House, house
  end

  def test_attributes_of_house
    house = House.new("$400000", "123 sugar lane")
    assert_equal "$400000", house.price
    assert_equal "123 sugar lane", house.address
  end  

  def test_rooms_empty
    house = House.new("$400000", "123 sugar lane")
    assert_equal [], house.rooms
  end
  
  def test_it_can_add_rooms
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    house.add_room(room_1)
    house.add_room(room_2)
    assert_equal [room_1, room_2], house.rooms
  end

  def test_index_rooms_from_category
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)
    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)
    expected = [room_1, room_2]
    assert_equal expected, house.rooms_from_category(:bedroom)
  end

  def test_calculate_house_area
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)
    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)
    assert_equal 1900, house.area
  end
  
  def test_price_per_sq_foot
   
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)
    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)
    assert_equal 210.53, house.price_per_square_foot
  end
  
  def test_sort_by_area
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)
    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)
    expected = [room_1, room_2, room_3, room_4]
    assert_equal expected, house.rooms_sorted_by_area
  end

  def test_convert_price
    house = House.new("$400000", "123 sugar lane")
    assert_equal 400000, house.convert_price_to_interger
  end

  
end