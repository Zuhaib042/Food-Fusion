require 'rails_helper'

RSpec.describe Recipe, type: :request do
  before(:each) do
    user = User.create(name: 'Hammas', created_at: Time.now, updated_at: Time.now,
                        email: 'test@email.com', encrypted_password: 'hammas')
    user.confirm
    sign_in user
    @recipe = Recipe.create(name: 'Pizza', preparation_time: '1 hour', cooking_time: '1 hour',
                            description: 'Today we are making pizza', public: true, created_at: Time.now,
                            updated_at: Time.now, user_id: user.id)
    get recipes_path
  end
  describe 'Food Controller' do
    it 'gets the index page' do
      expect(response).to have_http_status :ok
    end

    it 'renders the index page' do
      expect(response).to render_template(:index)
    end

    it 'should have some html' do
      expect(response.body).to include '<h2 class="recipe_name">Pizza</h2>'
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
      expect(response.body).to include '<li>Cooking Time: 1 hour</li>'
    end
  end
  describe 'Testing the new method' do
    before(:example) { get new_recipe_path }
    it 'should redirect to add recipe page' do
      expect(response).to have_http_status :ok
    end

    it 'should render recipe page' do
      expect(response).to render_template :new
    end

    it 'should have some html' do
      expect(response.body).to include '<h1 class="recipe_form_heading">Add new recipe</h1>'
    end
  end
  describe 'should create recipe' do
    it 'should create new recipe' do
      expect(@recipe).to be_valid
    end

    it 'should be of the person of id' do
      expect(user.recipes.count).to be 1
    end
  end
  describe 'should delete food' do
    it 'should be of the person of id' do
      expect(user.recipes.count).to be 1
      @recipe.destroy
      expect(user.recipes.count).to be 0
    end
  end
end