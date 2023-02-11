require 'rails_helper'

RSpec.describe Food, type: :request do
  before(:each) do
    @user = User.create(name: 'Faranosh Amini', created_at: Time.now, updated_at: Time.now,
                        email: 'faranosh.amini4@gmail.com', encrypted_password: '123456')
    # @user.skip_confirmation!
    @user.save
    post @user_session_path, params: { user: { email: @user.email, password: @user.password } }
    # sign_in @user
    get foods_path
  end
  describe 'Food Controller' do
    it 'gets the index page' do
      expect(response).to have_http_status :ok
    end
    it 'renders the index page' do
      expect(response).to render_template(:index)
    end
    #   it 'Should have some html' do
    #     expect(response.body).to include '<table class="w-6/12 bg-stone-200">'
    #   end
    # end
    # describe 'Testing the new method' do
    #     before(:example) { get new_food_path }
    #     it 'should redirect to add food page' do
    #         expect(response).to have_http_status :ok
    #     end
    #     it 'Should render food page' do
    #        expect(response).to render_template :new
    #     end
    #     it 'Should have some html' do
    #         expect(response.body).to include '<th scope="col">Food</th>'
    #     end
    # end
    #  describe 'should create a food' do
    #     before(:each) do
    #      @food = Food.new(name: 'Apple', measurement_unit: 'kg', price: '100', created_at: Time.now, updated_at: Time.now, user_id: @user.id)
    #     end
    #     it 'Should create new food' do
    #         expect(@food).to be_valid
    #     end
    #     it 'should be the person of id' do
    #         expect(@user.foods.count).to be 1
    #     end
    # end
    # describe 'Should delete food' do
    #     before(:each) do
    #         @food = Food.new(name: 'Apple', measurement_unit: 'kg', price: '100', created_at: Time.now, updated_at: Time.now, user_id: @user.id)
    #     end
    #     it 'Should be the person of id' do
    #         expect(@user.foods.count).to be 1
    #     @food.destroy
    #     expect(@user.foods.count).to be 0
    #     end
  end
end
