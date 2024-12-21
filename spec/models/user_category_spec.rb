require 'rails_helper'

RSpec.describe UserCategory, type: :model do
  context 'Soft Delete' do
    let(:category) { create(:category, name: 'コミュニケーション') }
    let(:user_category) { create(:user_category, user: create(:user), category: category) }

    it 'Soft deleted of UserCategory is nil' do
      expect(user_category.discarded_at).to be_nil
    end

    it 'Soft deleted of UserCategory is exist' do
      user_category.discard

      expect(user_category.discarded_at).to be_present
    end

    it 'Soft deleted of UserCategory is restored' do
      user_category = create(:user_category, user: create(:user), category: create(:category, name: 'テスト用'))
      user_category.discard
      user_category.undiscard

      expect(user_category.discarded_at).to be_nil
    end
  end
end
