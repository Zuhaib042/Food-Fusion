require 'rails_helper'

RSpec.describe 'Index page of Food', type: :system do
  before do
    user4 = User.create(id: 4, name: 'Zaki', email: 'zaki@spec.check', password: '123456')
    user4.save
    recipe2 =  user4.recipes.new(name: 'Eggs', preparation_time: '0.25 hour', cooking_time: '0.25', description: 'Easy cook', public: true)
    recipe2.save
  end

  describe 'publicRecipe index page testing' do
    before :each do
      visit '/public_recipes'
      fill_in 'Email', with: 'zaki@spec.check'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      click_link 'Public Recipes'
    end

    it 'should display the Public Recipes' do
      expect(page).to have_text('Public Recipes')
    end

    it 'should display the Tect' do
      expect(page).to have_text('By: Zaki')
    end

    it 'should display the name of' do
      expect(page).to have_text('Eggs')
    end

    it 'should display the describtion' do
      expect(page).to have_text('Easy cook')
    end

    it 'should the text of' do
      expect(page).to have_text('Public')
    end
  end
end
