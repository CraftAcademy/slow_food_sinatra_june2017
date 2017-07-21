require './lib/models/order.rb'

describe Order do
  it { is_expected.to have_property :id }
  it { is_expected.to have_property :order_date }
  it { is_expected.to have_property :total_price }
  it { is_expected.to have_property :order_status }
  # it { is_expected.to have_many(:dish).through(:order_item) }
  it { is_expected.to have_many :order_items }
end
