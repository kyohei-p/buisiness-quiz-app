require 'rails_helper'

RSpec.describe 'Categories', type: :system do
  let(:user) { create(:user) }
  let(:category) { create(:category) }

  context 'Category list' do
    it 'Display Success Category list' do
      post api_v1_login_path, params: { email: user.email, password: user.password }
      get api_v1_categories_path

      expect(response).to have_http_status(200)
    end

    it 'Display Failure Category list' do
      get api_v1_categories_path

      expect(response).to have_http_status(401)
    end
  end
end
