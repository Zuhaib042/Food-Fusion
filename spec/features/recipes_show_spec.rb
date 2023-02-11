# require 'rails_helper'

# RSpec.describe 'show page of Recipe', type: :system do
#   before do
#     user1 = User.create(id: 1, name: 'ali', email: 'ali@example.com', password: '123456')
#     user1.save
#     recipe2 = user1.recipes.new(name: 'Biryani', preparation_time: '1 hour', cooking_time: '2 hour', description: 'lorem ipsum')
#     recipe1.save
#   end

#   describe 'recipes index page testing' do
#     before :each do
#       visit '/recipes'
#       fill_in 'Email', with: 'ali@example.com'
#       fill_in 'Password', with: '123456'
#       click_button 'Log in'
#       click_link 'Recipes'
#     end

#     it 'should display the recipes List' do
#       expect(page).to have_text('All Recipes')
#     end

#     it 'should display the recipe name' do
#       expect(page).to have_text('Biryani')
#     end

#     it 'should display the description' do
#       expect(page).to have_text('lorem ipsum')
#     end

#     it 'should have an Add Recipe button' do
#       expect(page).to have_text('Add new Recipe')
#     end
#   end
# end
