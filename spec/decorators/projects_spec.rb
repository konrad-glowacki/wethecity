# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProjectDecorator, type: :decorators do
  describe 'Project decorator' do
    it 'return 100 when required_budget equal collected_budget' do
      project = build_stubbed(:project, required_budget: 200, collected_budget: 200).decorate
      expect(project.budget_completed_percentage).to eq(100)
    end

    it 'return value when required_budget different than collected_budget' do
      project = build_stubbed(:project, required_budget: 200, collected_budget: 100).decorate
      expect(project.budget_completed_percentage).to eq(50)
    end

    it 'return nil when collected_budget is nil' do
      project = build_stubbed(:project, required_budget: 200, collected_budget: nil).decorate
      expect(project.budget_completed_percentage).to eq(nil)
    end

    it 'return nil when required_budget is nil' do
      project = build_stubbed(:project, required_budget: nil, collected_budget: 200).decorate
      expect(project.budget_completed_percentage).to eq(nil)
    end

    it 'return nil when required_budget and collected_budget are nil' do
      project = build_stubbed(:project, required_budget: nil, collected_budget: nil).decorate
      expect(project.budget_completed_percentage).to eq(nil)
    end
  end
end
