require './lib/models/category.rb'

describe Category do
  it { is_expected.to have_property :id }
  it { is_expected.to have_property :name }
end
