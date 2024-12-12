require 'rails_helper'

RSpec.describe UserCategory, type: :model do
  context 'Soft Delete' do
    it 'Soft deleted of UserCategory is nil' do
      user_category = create(:user_category)

      expect(user_category.discarded_at).to be_nil
    end

    it 'Soft deleted of UserCategory is exist' do
      user_category = create(:user_category)
      user_category.discard

      expect(user_category.discarded_at).to be_present
    end

    it 'Soft deleted of UserCategory is restored' do
      user_category = create(:user_category)
      user_category.discard
      user_category.undiscard

      expect(user_category.discarded_at).to be_nil
    end
  end
end
