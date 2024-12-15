require 'rails_helper'

RSpec.describe 'Sessions', type: :system do
  let(:user) { create(:user) }

  context 'Login' do
    it 'Login is successful if the user information is correct' do
      post api_v1_login_path, params: { email: user.email, password: user.password }

      expect(response).to have_http_status(200)
    end

    it 'Login fails when user information is invalid' do
      post api_v1_login_path, params: { user: { email: "test@example.com", password: "password" } }
      expect(response).to have_http_status(401)
    end
  end

  context 'Logout' do
    it 'Success Logout' do
      post api_v1_login_path, params: { email: user.email, password: user.password }
      delete api_v1_logout_path
      expect(response).to have_http_status(200)
    end

    it 'Failed Logout (when already logged out)' do
      delete api_v1_logout_path

      expect(response).to have_http_status(401)
    end
  end
end
