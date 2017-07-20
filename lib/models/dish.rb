class Dish
  include DataMapper::Resource

  property :id, Serial, key: true
  property :name, String
  property :description, String
  property :price, Integer

  belongs_to :category
  belongs_to :order_item
end
