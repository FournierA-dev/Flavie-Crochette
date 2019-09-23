require 'test_helper'

class BlogArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get blog_articles_index_url
    assert_response :success
  end

  test "should get show" do
    get blog_articles_show_url
    assert_response :success
  end

  test "should get new" do
    get blog_articles_new_url
    assert_response :success
  end

  test "should get destroy" do
    get blog_articles_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get blog_articles_edit_url
    assert_response :success
  end

  test "should get create" do
    get blog_articles_create_url
    assert_response :success
  end

  test "should get update" do
    get blog_articles_update_url
    assert_response :success
  end

end
