require 'test_helper'

class SubArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sub_articles_new_url
    assert_response :success
  end

  test "should get create" do
    get sub_articles_create_url
    assert_response :success
  end

  test "should get show" do
    get sub_articles_show_url
    assert_response :success
  end

  test "should get update" do
    get sub_articles_update_url
    assert_response :success
  end

  test "should get index" do
    get sub_articles_index_url
    assert_response :success
  end

  test "should get destroy" do
    get sub_articles_destroy_url
    assert_response :success
  end

end
