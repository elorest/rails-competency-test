require "test_helper"

describe Article do
  describe 'invalid' do
    let(:article) { Article.new }

    it { assert_equal(article.valid?, false) }

    it 'should have the correct error messages' do
      article.valid?
      assert_includes(article.errors.full_messages, "Title can't be blank")
      assert_includes(article.errors.full_messages, "Content can't be blank")
      assert_includes(article.errors.full_messages, "Category can't be blank")
      assert_includes(article.errors.full_messages, 'User must exist')
    end
  end

  describe 'valid' do
    let(:user) { User.create(email: 'totez@email.com', password: 'totezpassword1', password_confirmation: 'totezpassword1') }
    let(:article) { Article.new(title: 'totez article', content: 'totez content', category: 'totez category', user: user) }

    it 'must be valid' do
      assert_equal(article.valid?, true)
    end
  end
end
