require 'rails-helper'

RSpec.decribe '/inventories', type: :request do
    let(:valid_attributes) do
        skip('Add a hash of attributes valid for your model')
    end
    let(:valid_attributes) do
        skip('Add a hash of attributes invalid for your model')
    end
    describe 'Get/index' do
        it 'renders a successful response' do
            inventory.create! valid_attributes
            get inventories_url
            expect(response). to be_successful
        end
    end
    describe 'Get/show' do
        it 'renders a successful response' do
            inventory = Inventory.create! valid_attributes
            get inventories_url(INVENTORY)
            expect(response). to be_successful
        end
    end
    describe 'Get/new' do
        it 'renders a successful response' do
            get new_inventories_url
            expect(response). to be_successful
        end
    end
    describe 'Get/edit' do
        it 'renders a successful response' do
            inventory = Inventory.create! valid_attributes
            get edit_inventories_url(inventory)
            expect(response). to be_successful
        end
    end

    describe 'POST/create' do
       context 'with valid parameters' do
        it 'creates a new Inventory' do
            expect do
                post inventories_url, params{ inventory: valid_attributes }
            end.to change(Inventory, :count).by(1)
        end
        it 'redirects to created inventory' do
            post inventories_url, params{ inventory: valid_attributes }
            expect(response).to redirect_to(inventory_url(Inventory.last))
        end
    end
    context 'with invalid parameters' do
        it 'does not create a new inventory' do
            expect do
                post inventories_url, params: { inventory: invalid_attributes}
            end.to change(Inventory, : count).by(0)
        end
        it "renders a response with 422 status(i.e. to display the 'new' template)" do
            post inventories_url, params{ inventory: valid_attributes }
            expect(response).to have_http_status(:unprocessable_entity)
        end
    end
end
decribe 'PATCH/update' do
    context 'with valid parameters' do
        let(:new_attributes) do
            skip('Add a hash of attributes valid for your model')
        end
        it 'update the requested inventory' do
            inventory = Inventory.create! valid_attributes
            patch inventory_url, params{ inventory: new_attributes }
            inventory.reload 
            skip('add assertions for update state')
        end
        it 'redirects to the inventory' do
            inventory = Inventory.create! valid_attributes
            patch inventory_url(inventory), params: {inventory: new_attributes}
            inventory.reload
            expect(response)to redirect_to(inventory_url(inventory))
        end
    end
    context 'with invalid parameters' do
    it "renders a response with 422 status(i.e. to display the 'edit' template)" do
        inventory = Inventory.create! valid_attributes
        patch inventory_url, params{ inventory: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
    end
end
end
describe 'DELETE/destroy' do
    it 'destroyed the requested inventory' do
        inventory = Inventory.create! valid_attributes
        expect do
            delete inventory_url(inventory)
        end.to change(Inventory, :count).by(-1)
    end

    it 'redirects to the inventories list' do
        inventory = Inventory.create! valid_attributes
        delete inventory_url(inventory)
        expect(response).to redirect_to(inventories_url)
    end
end
end
