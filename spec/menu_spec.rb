require './lib/models/menu.rb'

describe Menu do
  it { is_expected.to have_property :id }
  it { is_expected.to have_property :name }
  it { is_expected.to have_property :description }
end
