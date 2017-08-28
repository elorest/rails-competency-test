require "test_helper"

describe ArticlesController do
  describe '#index' do
    it 'should be a success' do
      get articles_url
      assert_response :success
    end
  end

  describe '#new' do
    describe 'guest' do
      it 'should redirct to sign_in page' do
        get new_article_path

        assert_redirected_to new_user_session_path
        assert_equal('You need to sign in or sign up before continuing.', flash[:alert])
      end
    end

    describe 'user' do
      let(:user) { FactoryGirl.create(:user) }
      it 'should deny permission' do
        sign_in user
        get new_article_path

        assert_equal('Permission Denied', flash[:notice])
      end
    end

    describe 'admin' do
      let(:admin) { FactoryGirl.create(:admin) }
      it 'should deny permission' do
        sign_in admin
        get new_article_path

        assert_equal('Permission Denied', flash[:notice])
      end
    end

    describe 'editor' do
      let(:editor) { FactoryGirl.create(:editor) }
      it 'should be a success' do
        sign_in editor
        get new_article_path

        assert_response :success
      end
    end
  end

  describe '#create' do
    let(:article_params) { { article: { title: 'some title', category: 'totez category', content: 'so much content' } } }
    describe 'editor' do
      let(:editor) { FactoryGirl.create(:editor) }
      it 'should be a success' do
        sign_in editor

        assert_difference('Article.count') do
          post articles_path, params: article_params
        end

        assert_redirected_to articles_path
        assert_equal 'Article created!', flash[:notice]
      end
    end

    describe 'admin' do
      let(:admin) { FactoryGirl.create(:admin) }

      it 'should deny permission' do
        sign_in admin
        post articles_path, params: article_params

        assert_equal('Permission Denied', flash[:notice])
      end
    end

    describe 'user' do
      let(:user) { FactoryGirl.create(:user) }

      it 'should deny permission' do
        sign_in user
        post articles_path, params: article_params

        assert_equal('Permission Denied', flash[:notice])
      end     
    end

    describe 'guest' do
      it 'should deny permission' do
        post articles_path, params: article_params

        assert_redirected_to new_user_session_path
        assert_equal('You need to sign in or sign up before continuing.', flash[:alert])
      end     
    end
  end

  describe 'edit' do
    describe 'editor' do
      let(:editor) { FactoryGirl.create(:editor) }
      let(:article) { FactoryGirl.create(:article, user_id: editor.id) }

      it 'should be a success' do
        sign_in editor
        get edit_article_path(article.id)

        assert_response :success
      end
    end

    describe 'admin' do
      let(:admin) { FactoryGirl.create(:admin) }
      let(:article) { FactoryGirl.create(:article, user_id: admin.id) }

      it 'should deny permission' do
        sign_in admin
        get edit_article_path(article.id)

        assert_equal('Permission Denied', flash[:notice])
      end
    end
    
    describe 'user' do
      let(:user) { FactoryGirl.create(:user) }
      let(:article) { FactoryGirl.create(:article, user_id: user.id) }

      it 'should deny permission' do
        sign_in user
        get edit_article_path(article.id)

        assert_equal('Permission Denied', flash[:notice])
      end
    end

    describe 'guest' do
      let(:admin) { FactoryGirl.create(:admin) }
      let(:article) { FactoryGirl.create(:article, user_id: admin.id) }

      it 'send to sign in page' do
        get edit_article_path(article.id)

        assert_redirected_to new_user_session_path
        assert_equal('You need to sign in or sign up before continuing.', flash[:alert])
      end
    end
  end

  describe '#update' do
    let(:article_params) { { article: { title: 'some title', category: 'totez category', content: 'so much content' } } }

    describe 'editor' do
      let(:editor) { FactoryGirl.create(:editor) }
      let(:article) { FactoryGirl.create(:article, user_id: editor.id) }

      it 'should be a success' do
        sign_in editor
        patch article_path(article.id), params: article_params

        assert_redirected_to article_path(article.id)
        assert_equal('Article updated!', flash[:notice])
        assert_equal(article.reload.title, 'some title')
        assert_equal(article.reload.category, 'totez category')
        assert_equal(article.reload.content, 'so much content')
      end
    end

    describe 'admin' do
      let(:admin) { FactoryGirl.create(:admin) }
      let(:article) { FactoryGirl.create(:article, user_id: admin.id) }

      it 'should deny permission' do
        sign_in admin
        patch article_path(article.id), params: article_params

        assert_equal('Permission Denied', flash[:notice])
      end
    end
    
    describe 'user' do
      let(:user) { FactoryGirl.create(:user) }
      let(:article) { FactoryGirl.create(:article, user_id: user.id) }

      it 'should deny permission' do
        sign_in user
        patch article_path(article.id), params: article_params

        assert_equal('Permission Denied', flash[:notice])
      end
    end

    describe 'guest' do
      let(:admin) { FactoryGirl.create(:admin) }
      let(:article) { FactoryGirl.create(:article, user_id: admin.id) }

      it 'send to sign in page' do
        put article_path(article.id), params: article_params

        assert_redirected_to new_user_session_path
        assert_equal('You need to sign in or sign up before continuing.', flash[:alert])
      end
    end   
  end

  describe '#show' do
    describe 'editor' do
      let(:editor) { FactoryGirl.create(:editor) }
      let(:article) { FactoryGirl.create(:article, user_id: editor.id) }

      it 'should be a success' do
        sign_in editor
        get article_path(article.id)

        assert_response :success
      end
    end

    describe 'admin' do
      let(:admin) { FactoryGirl.create(:admin) }
      let(:article) { FactoryGirl.create(:article, user_id: admin.id) }

      it 'should deny permission' do
        sign_in admin
        get article_path(article.id)

        assert_response :success
      end
    end
    
    describe 'user' do
      let(:user) { FactoryGirl.create(:user) }
      let(:article) { FactoryGirl.create(:article, user_id: user.id) }

      it 'should deny permission' do
        sign_in user
        get article_path(article.id)

        assert_response :success
      end
    end

    describe 'guest' do
      let(:admin) { FactoryGirl.create(:admin) }
      let(:article) { FactoryGirl.create(:article, user_id: admin.id) }

      it 'send to sign in page' do
        get article_path(article.id)

        assert_redirected_to new_user_session_path
        assert_equal('You need to sign in or sign up before continuing.', flash[:alert])
      end
    end
  end

  describe '#destroy' do
    describe 'editor' do
      let(:editor) { FactoryGirl.create(:editor) }
      let(:article) { FactoryGirl.create(:article, user_id: editor.id) }

      it 'should redirect to the articles index' do
        sign_in editor
        delete article_path(article)

        assert_redirected_to articles_path
        assert_equal('Article deleted!', flash[:notice])
      end
    end

    describe 'admin' do
      let(:admin) { FactoryGirl.create(:admin) }
      let(:article) { FactoryGirl.create(:article, user_id: admin.id) }

      it 'should deny permission' do
        sign_in admin
        delete article_path(article.id)

        assert_equal('Permission Denied', flash[:notice])
      end
    end
    
    describe 'user' do
      let(:user) { FactoryGirl.create(:user) }
      let(:article) { FactoryGirl.create(:article, user_id: user.id) }

      it 'should deny permission' do
        sign_in user
        delete article_path(article.id)

        assert_equal('Permission Denied', flash[:notice])
      end
    end

    describe 'guest' do
      let(:admin) { FactoryGirl.create(:admin) }
      let(:article) { FactoryGirl.create(:article, user_id: admin.id) }

      it 'send to sign in page' do
        delete article_path(article.id)

        assert_redirected_to new_user_session_path
        assert_equal('You need to sign in or sign up before continuing.', flash[:alert])
      end
    end   
  end
end
