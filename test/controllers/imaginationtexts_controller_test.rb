require "test_helper"

class ImaginationtextsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @imaginationtext = imaginationtexts(:one)
  end

  test "should get index" do
    get imaginationtexts_url
    assert_response :success
  end

  test "should get new" do
    get new_imaginationtext_url
    assert_response :success
  end

  test "should create imaginationtext" do
    assert_difference("Imaginationtext.count") do
      post imaginationtexts_url, params: { imaginationtext: { addicdatum_id: @imaginationtext.addicdatum_id } }
    end

    assert_redirected_to imaginationtext_url(Imaginationtext.last)
  end

  test "should show imaginationtext" do
    get imaginationtext_url(@imaginationtext)
    assert_response :success
  end

  test "should get edit" do
    get edit_imaginationtext_url(@imaginationtext)
    assert_response :success
  end

  test "should update imaginationtext" do
    patch imaginationtext_url(@imaginationtext), params: { imaginationtext: { addicdatum_id: @imaginationtext.addicdatum_id } }
    assert_redirected_to imaginationtext_url(@imaginationtext)
  end

  test "should destroy imaginationtext" do
    assert_difference("Imaginationtext.count", -1) do
      delete imaginationtext_url(@imaginationtext)
    end

    assert_redirected_to imaginationtexts_url
  end
end
