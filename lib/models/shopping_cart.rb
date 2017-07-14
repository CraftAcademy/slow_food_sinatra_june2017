class Shopping_cart

  def initialize(session)
    if session[:cart].nil?
      session[:cart] = []
    end
    @session = session
  end

  def add_to_cart(dish_id)
    dish = Dish.get(dish_id)
    item = Shopping_cart_item.new(dish)
    add_to_session(item)
  end

  def show_cart()
    @session[:cart]
  end

  def add_to_session(item)
    found_item = @session[:cart].find { |cart_item| cart_item.dish_id == item.dish_id }
    if found_item.nil?
      @session[:cart] << item
    else
      found_item.quantity += 1
    end
  end

  def clear_cart()
    @session[:cart] = []
  end
end
