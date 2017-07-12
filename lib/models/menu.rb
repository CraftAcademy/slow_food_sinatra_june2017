class Menu
  include DataMapper::Resource

  property :id, Serial, key: true
  property :name, String
  property :description, String
end
