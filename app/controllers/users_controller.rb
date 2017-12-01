# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.friendly.find(params[:id]).decorate

    @created_projects = Project.joins(:founders)
                               .where(founders: { role: Founder.roles[:leader], member: @user })
                               .decorate

    @engaged_projects = Project.joins(:engagements)
                               .where(engagements: { provider: @user })
                               .group('projects.id', 'engagements.provider_type', 'engagements.provider_id')
                               .decorate
  end
end
