# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  describe 'GET index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET search' do
    before { build_stubbed(:project) }

    it 'renders the search template without query string' do
      get :search, params: { q: nil }
      expect(response).to render_template('index')
    end

    it 'renders the search template with valid query string' do
      get :search, params: { q: 'MyString' }
      expect(response).to render_template('index')
    end

    it 'renders the search template with invalid query string' do
      get :search, params: { q: 'MyString---' }
      expect(response).to render_template('index')
    end
  end

  describe 'GET show' do
    it 'renders the show template' do
      project = create(:project)
      get :show, params: { id: project.id }
      expect(response).to render_template('show')
    end
  end
end
