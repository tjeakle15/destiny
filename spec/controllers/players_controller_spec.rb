require 'rails_helper'

RSpec.describe PlayersController, type: :controller do

  describe "GET #search" do
    it "redirects to player page when player exists" do
      get :search, {membership_type_id: 1, gamertag: TestConstant::VALID_XBOX_GAMERTAG}
      expect(response).to redirect_to(player_url(TestConstant::VALID_XBOX_GAMERTAG)) 
    end

    it "redirects to player page when player exists (with spaces)" do
      get :search, {membership_type_id: 1, gamertag: TestConstant::VALID_XBOX_GAMERTAG_WITH_SPACES}
      expect(response).to redirect_to(player_url(TestConstant::VALID_XBOX_GAMERTAG_WITH_SPACES.downcase)) 
    end

    it "redirects to index page when player does not exist" do
      get :search, {membership_type_id: 1, gamertag: TestConstant::INVALID_XBOX_GAMERTAG}
      expect(response).to redirect_to(root_url)
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success with empty membership_type_id" do
      get :show, {membership_type_id: "", id: TestConstant::VALID_XBOX_GAMERTAG}
      expect(response).to have_http_status(:success)
    end

    it "returns http success with xbox membership_type_id" do
      get :show, {membership_type_id: MembershipType::XBOX.id, id: TestConstant::VALID_XBOX_GAMERTAG}
      expect(response).to have_http_status(:success)
    end

    it "returns http success with playstation membership_type_id" do
      get :show, {membership_type_id: MembershipType::PLAYSTATION.id, id: TestConstant::VALID_PLAYSTATION_GAMERTAG}
      expect(response).to have_http_status(:success)
    end
  end

end
