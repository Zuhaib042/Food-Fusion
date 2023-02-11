require 'rails_helper'

RSpec.describe 'Index page of Inventory', type: :system do
  before do
    user3 = User.create(id: 3, name: 'Spec', email: 'spec@test.check', password: '123456')
    user3.save
    inventory1 = user3.inventories.new(name: 'New_Inventory')
    inventory1.save
  end

  describe 'inventory index page testing' do
    before :each do
      visit '/inventories'
      fill_in 'Email', with: 'spec@test.check'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      click_link 'Inventories'
    end

    it 'should display the Inventory name' do
      expect(page).to have_text('New_Inventory')
    end

    it 'should have a remove button' do
      expect(page).to have_text('Remove')
    end

    it 'should display Inventory details' do
      expect(page).to have_text('Lorem ipsum dolor sit amet consectetur adipisicing elit.')
    end

    it 'should have an Add inventory button' do
      expect(page).to have_text('Add Inventory')
    end
  end
end
