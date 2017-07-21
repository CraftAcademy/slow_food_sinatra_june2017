class OrderItem
  include DataMapper::Resource

  property :id, Serial, key: true
  property :quantity, Integer
  property :price, Integer

  belongs_to :order
  has 1, :dish, through: Resource
end
