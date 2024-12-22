require 'rails_helper'

RSpec.describe 'Quizzes', type: :system do
  let(:user) { create(:user) }
  let(:category) { create(:category, name: :money) }
  let(:user_category) { create(:user_category, user: user, category: category) }
  let(:quiz_question) { create(:quiz_question) }
  let(:quiz_answer) { create(:quiz_answer, quiz_option: "純利益") }
  let(:quiz_answer) { create(:quiz_answer, quiz_option: "消費税") }
  let(:quiz_answer) { create(:quiz_answer, quiz_option: "所得控除") }
  let(:quiz_answer) { create(:quiz_answer, quiz_option: "税額控除") }

  context 'Quiz Question and Options' do
    it 'Display Success Quiz Question and Options' do
      post api_v1_login_path, params: { email: user.email, password: user.password }
      get api_v1_quiz_question_path(id: 1), params: { category_id: user_category.category_id }

      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)['quiz_options']).to_not eq nil
    end

    it 'Display Failure Quiz Question and Options' do
      post api_v1_login_path, params: { email: user.email, password: user.password }
      get api_v1_quiz_question_path(id: 1)

      expect(response).to have_http_status(422)
      expect(JSON.parse(response.body)['quiz_options']).to eq nil
    end
  end
end
