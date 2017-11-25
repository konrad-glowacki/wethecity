class AccountsController < ApplicationController
  def show
    @account = Account.friendly.find(params[:id])
    @projects = @account.projects.decorate
  end
end
