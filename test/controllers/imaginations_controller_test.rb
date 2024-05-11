require "test_helper"

class ImaginationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @imagination = imaginations(:one)
  end

  test "should get index" do
    get imaginations_url
    assert_response :success
  end

  test "should get new" do
    get new_imagination_url
    assert_response :success
  end

  test "should create imagination" do
    assert_difference("Imagination.count") do
      post imaginations_url, params: { imagination: { addicdatum_id: @imagination.addicdatum_id } }
    end

    assert_redirected_to imagination_url(Imagination.last)
  end

  test "should show imagination" do
    get imagination_url(@imagination)
    assert_response :success
  end

  test "should get edit" do
    get edit_imagination_url(@imagination)
    assert_response :success
  end

  test "should update imagination" do
    patch imagination_url(@imagination), params: { imagination: { addicdatum_id: @imagination.addicdatum_id } }
    assert_redirected_to imagination_url(@imagination)
  end

  test "should destroy imagination" do
    assert_difference("Imagination.count", -1) do
      delete imagination_url(@imagination)
    end

    assert_redirected_to imaginations_url
  end
end
