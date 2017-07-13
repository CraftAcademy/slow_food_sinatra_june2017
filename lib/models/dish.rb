class Dish
  include DataMapper::Resource

  property :id, Serial, key: true
  property :name, String
  property :description, String
  property :price, Integer
  belongs_to :category, :model => 'Category', :child_key => [:categoryId]
end
