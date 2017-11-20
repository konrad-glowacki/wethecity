# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProjectsController do
  fixtures :projects

  describe 'GET index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET search' do
    before { projects(:project1) }

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
      project = projects(:project1)
      get :show, params: { id: project.id }
      expect(response).to render_template('show')
    end
  end
end
