# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProjectDecorator, type: :decorators do
  describe 'Project decorator' do
    fixtures :projects

    it 'return 100 when required_budget equal collected_budget' do
      project = projects(:project1).decorate
      expect(project.budget_completed_percentage).to eq(100)
    end

    it 'return value when required_budget different than collected_budget' do
      project = projects(:project2).decorate
      expect(project.budget_completed_percentage).to eq(27)
    end

    it 'return 0 when collected_budget is 0' do
      project = projects(:project_collected_budget_nil).decorate
      expect(project.budget_completed_percentage).to eq(0)
    end

    it 'return 0 when required_budget is 0' do
      project = projects(:project_required_budget_nil).decorate
      expect(project.budget_completed_percentage).to eq(nil)
    end
  end
end
