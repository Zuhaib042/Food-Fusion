require 'rails_helper'

RSpec.describe PublicRecipesController, type: :request do
  before(:each) do
    @user = User.create(name: 'Faranosh', created_at: Time.now, updated_at: Time.now,
                        email: 'faranosh.amini4@gmail.com', encrypted_password: '123456')
    @user.confirmed_at
    @user2 = User.create(name: 'Test', created_at: Time.now, updated_at: Time.now,
                         email: 'test@gmail.com', encrypted_password: '1234567')
    @user2.confirmed_at
    @recipe = Recipe.create(name: 'pizza', preparation_time: '1 Hour', cooking_time: '2 hour',
                            description: 'This is  the first recipe', public: true, created_at: Time.now, updated_at: Time.now, user_id: @user_id)
    @recipe2 = Recipe.create(name: 'chicken', preparation_time: '1 Hour', cooking_time: '2 hour',
                             description: 'This is  the second recipe', public: true, created_at: Time.now, updated_at: Time.now, user_id: @user_id)
    @recipe3 = Recipe.create(name: 'fish', preparation_time: '1 Hour', cooking_time: '2 hour',
                             description: 'This is  the third recipe', public: true, created_at: Time.now, updated_at: Time.now, user_id: @user_id)
    get public_recipes_path
  end
  describe 'Testing methods of public Recipe' do
    it 'index page should have http status 200' do
      expect(response).to have_http_status :ok
    end
    it 'Should redirect to index page' do
      expect(response).to render_template :index
    end
    it 'Should have some html' do
      expect(response.body).to have_text('pizza')
      expect(response.body).to have_text('chicken')
    end
    it 'Should not render that item which is not public' do
      expect(response.body).not.to have_text('fish')
    end
  end
end
