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
      let(:user_params) do
        {
          email: Faker::Internet.email,
          password: 'mypasssword',
          password_confirmation: 'mypasssword'
        }
      end

      it 'should create a user' do
        expect { post :create, params: { user: user_params } }.to change(User, :count).by(1)
      end
    end

    context 'with invalid params' do
      let(:user_params) do
        {
          password: 'mypasssword',
          password_confirmation: 'mypasssword'
        }
      end

      it 'renders the new template' do
        post :create, params: { user: user_params }
        expect(response).to render_template('new')
      end

      it 'should not create a user' do
        expect { post :create, params: { user: user_params } }.to change(User, :count).by(0)
      end
    end
  end

  describe 'login user' do
    login_user

    describe 'PUT update' do
      let(:update_params) do
        {
          first_name: Faker::Name.unique.first_name,
          last_name: Faker::Name.unique.last_name,
          volunteer: true,
          biography: 'test'
        }
      end

      it 'update user data' do
        put :update, params: { id: subject.current_user.id, user: update_params }

        user = subject.current_user.reload
        expect(response).to redirect_to(root_path)
        expect(user.first_name).to eq update_params[:first_name]
        expect(user.last_name).to eq update_params[:last_name]
        expect(user.volunteer).to eq update_params[:volunteer]
        expect(user.biography).to eq update_params[:biography]
      end
    end
  end
end
