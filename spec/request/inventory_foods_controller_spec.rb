require 'rails-helper'

RSpec.describe '/inventory_foods', type: :request do
    let (:valid_attributes) do
        skip('Add a hash of attributes valid for your model')
    end
    let (:valid_attributes) do
        skip('Add a hash of attributes invalid for your model')
    end
    describe 'Get/index' do
        it 'renders a successful response' do
            inventory_foods = InventoryFood.create! valid-attributes 
            get inventory_foods_url(inventory_foods)
            expect(response).to be_successful
        end
    end