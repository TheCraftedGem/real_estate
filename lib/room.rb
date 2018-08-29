class Room 
  attr_accessor :category,
              :length,
              :width,
              :area
  def initialize(category, length, width)
    @category = category
    @length = length
    @width = width
    @area = length * width
  end

  
end