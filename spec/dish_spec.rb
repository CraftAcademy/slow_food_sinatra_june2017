require './lib/models/dish.rb'

describe Dish do
  it { is_expected.to have_property :id }
  it { is_expected.to have_property :name }
  it { is_expected.to have_property :description }
  it { is_expected.to have_property :price }
  it { is_expected.to belong_to :order_item }
  # it { is_expected.to have_many(:order).through(:order_item) }
end
