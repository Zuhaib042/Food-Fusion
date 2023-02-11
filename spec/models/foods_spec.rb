require 'rails_helper'

RSpec.describe Food, type: :model do
  before(:each) do
    @food = Food.new(name: 'Apple', measurement_unit: 'g', price: 1.5)
  end

  it 'should have a name' do
    @food.name = nil
    expect(@food).to_not be_valid
  end

  it 'should have a measurement unit' do
    @food.measurement_unit = nil
    expect(@food).to_not be_valid
  end

  it 'should have a price' do
    @food.price = nil
    expect(@food).to_not be_valid
  end

  it 'should associate with a logged in user' do
    @food.user_id = nil
    expect(@food).to_not be_valid
  end

  it 'should have a name that is at least 3 characters long' do
    @food.name = 'Ap'
    expect(@food).to_not be_valid
  end
end
