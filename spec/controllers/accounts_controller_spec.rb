# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AccountsController, type: :controller do
  describe 'GET #show' do
    let(:account) { create(:company) }

    it 'returns http success' do
      get :show, params: { id: account }
      expect(response).to render_template('show')
    end
  end
end
