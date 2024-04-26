require "test_helper"

class Admin::CounsellorsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_counsellors_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_counsellors_edit_url
    assert_response :success
  end

  test "should get show" do
    get admin_counsellors_show_url
    assert_response :success
  end

  test "should get index" do
    get admin_counsellors_index_url
    assert_response :success
  end
end
