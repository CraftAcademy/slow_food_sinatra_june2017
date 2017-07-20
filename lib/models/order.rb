class Order
  include DataMapper::Resource

  property :id, Serial, key: true
  property :order_date, Date
  property :total_price, Integer
  property :order_status, String

  belongs_to :user
  has n, :order_items
end
