require 'rails_helper'
require 'selenium-webdriver'

RSpec.describe 'Sessions', type: :system do
  describe 'Login' do
    let(:user) { create(user) }


    context 'Log in with the correct user information' do
      it 'Success Login' do
        logged_in
        expect(page).to have_content 'Login successful'
      end
    end

    context 'Login fails due to incorrect user information' do
      it 'Failed Login' do
        expect(page).not_to have_content 'Login failed'
      end
    end

    context 'Logout' do
      it 'Success Logout' do
        expect(page).not_to have_content 'Logout failed'
      end
    end
  end
end
