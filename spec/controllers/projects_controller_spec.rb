# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  describe 'GET show/:id' do
    it 'assigns @project' do
      project = Project.first
      get :show, params: { id: project.id }
      expect(assigns(:project)).to eq project
    end

    it 'renders show template' do
      project = Project.first
      get :show, params: { id: project.id }
      expect(response).to render_template :show
    end
  end
end
