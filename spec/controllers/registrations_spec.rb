# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  before(:each) do
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end
  describe 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template('new')
    end
  end
  describe 'POST #create' do
    context 'with valid params' do
      it 'should create a user' do
        user_params = { email: Faker::Internet.email,
                        password: 'mypasssword',
                        password_confirmation: 'mypasssword' }
        expect { post :create, params: { user: user_params } }.to change(User, :count).by(1)
      end
    end
    context 'with invalid params' do
      it 'renders the new template' do
        user_params = { password: 'mypasssword',
                        password_confirmation: 'mypasssword' }
        post :create, params: { user: user_params }
        expect(response).to render_template('new')
      end
      it 'should not create a user' do
        user_params = { password: 'mypasssword',
                        password_confirmation: 'mypasssword' }
        expect { post :create, params: { user: user_params } }.to change(User, :count).by(0)
      end
    end
  end
  # describe 'PUT update/:id' do
  #   let(:user_params) do
  #     { first_name: Faker::Name.unique.first_name,
  #       last_name: Faker::Name.unique.last_name,
  #       volunteer: true,
  #       about: 'test' }
  #   end

  #   before(:each) do
  #     @user = User.create(email: Faker::Internet.email,
  #                         password: 'mypasssword',
  #                         password_confirmation: 'mypasssword')
  #     sign_in(@user)
  #     put :update, params: { id: @user.id, user: user_params }
  #     @user.reload
  #   end

  #   describe 'initialized in before(:each)' do
  #     it { expect(response).to redirect_to('/') }
  #     it { expect(@user.first_name).to eq user_params[:first_name] }
  #     it { expect(@user.last_name).to eq user_params[:last_name] }
  #     it { expect(@user.volunteer).to eq user_params[:volunteer] }
  #     it { expect(@user.about).to eq user_params[:about] }
  #   end
  # end
end
