require 'rails_helper'

RSpec.describe Food, type: :request do
  before(:each) do
    @user = User.new(name: 'Faranosh Amini', created_at: Time.now, updated_at: Time.now,
                     email: 'faranosh.amini4@gmail.com', encrypted_password: '123456')
    @user.confirm
    sign_in @user
    @recipe = Recipe.new(name: 'pizza', preparation_time: '1 Hour', cooking_time: '2 hour',
                         description: 'This is  the first recipe', public: true, created_at: Time.now, updated_at: Time.now, user_id: @user_id)
    get public_recipes_path
  end
  describe 'Food Controller' do
    it 'gets the index page' do
      expect(response).to have_http_status :ok
    end
    it 'renders the index page' do
      expect(response).to have render_template(:index)
    end
    it 'Should have some html' do
      expect(response.body).to include '<h4 class="text-lg font-semibold">Instructions</h4>'
    end
  end
  describe 'Testing the show method' do
    before(:example) { get recipe_path(@recipe) }
    it 'should have http status of 200' do
      expect(response).to have_http_status :ok
    end

    it 'should redirect to show page' do
      expect(response).to render_template :show
    end

    it 'should have some html' do
      expect(response.bodu).to include '<span><%= @recipe.description %></span>'
    end
  end
  describe 'Testing the new method' do
    before(:example) { Get new_recipe_path }
    it 'Should redirect to add recipe page' do
      expect(response).to have_http_status :ok
    end
    it 'should render recipe page' do
      expect(response).to render_template :new
    end
    it 'should have some html' do
      expect(response.body).to include ' <h1 class="mb-4 text-xl font-extrabold text-gray-900  md:text-2xl lg:text-3xl"><span class="text-transparent bg-clip-text bg-gradient-to-r to-emerald-600 from-sky-400">Create your</span> Recipe here.</h1>'
    end
  end
  describe 'should create recipe' do
    it 'should create new recipe' do
      expect(@recipe).to be_valid
    end
    it 'should be the person of id' do
      expext(@user.recipes.count).to be 1
    end
  end
  describe 'should delete food' do
    it 'should be the person of id' do
      expect(@user.recipes.count).to be 1
      @recipe.destroy
      expect(@user..recipes.count).to be 0
    end
  end
end
