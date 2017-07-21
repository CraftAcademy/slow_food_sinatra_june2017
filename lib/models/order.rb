class Order
  include DataMapper::Resource

  property :id, Serial, key: true
  property :order_date, DateTime
  property :total_price, Integer
  property :order_status, String

  belongs_to :user
  has n, :order_items

  before :save, :default_values

  def default_values
    self.order_date = DateTime.now
    self.order_status = 'new'
    calc_total_cost
  end

  def calc_total_cost
    self.total_price = 0
    order_items.each do |item|
      self.total_price += item.price * item.quantity
    end
  end
end
