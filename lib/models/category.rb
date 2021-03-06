class Category
  include DataMapper::Resource

  property :id, Serial, key: true
  property :name, String
  has n, :dishes
end
