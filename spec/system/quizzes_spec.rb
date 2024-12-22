require 'rails_helper'

RSpec.describe 'Quizzes', type: :system do
  let(:user) { create(:user) }
  let(:category) { create(:category, name: "お金") }
  let(:user_category) { create(:user_category, user: user, category: category) }
  let(:quiz_question) { create(:quiz_question)}

  context 'Quiz Question' do
    it 'Display Success Quiz Question' do
      post api_v1_login_path, params: { email: user.email, password: user.password }
      get api_v1_quiz_question_path(id: 1), params: { category_id: user_category.category_id }
      
      expect(response).to have_http_status(200)
    end

    it 'Display Failure Quiz Question' do
      post api_v1_login_path, params: { email: user.email, password: user.password }
      get api_v1_quiz_question_path(id: 1)

      expect(response).to have_http_status(422)
    end
  end
end
