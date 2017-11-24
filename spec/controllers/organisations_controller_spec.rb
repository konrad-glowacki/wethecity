require 'rails_helper'

RSpec.describe OrganisationsController, type: :controller do

  describe "GET #show" do    
    it "returns http success" do
      get :show
      expect(response).to render_template('show')
    end

    describe "responds with organization" do 
      before do
        let(:organization) { FactoryBot.build_stubbed(:organization) } 
      end

      it "returns organisation" do 
      	get :show, id: organization.id
        expect(organization).to be_truthy
      end

      it "returns organization's projects" do 
        get :show, id: organization.id
        expect(organization).to be_truthy
      end
    end
  end

end
