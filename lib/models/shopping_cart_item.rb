class Shopping_cart_item

  attr_accessor :dish_id, :dish_name, :quantity

  def initialize (dish)
    @dish_id = dish.id
    @dish_name = dish.name
    @quantity = 1
  end


end
