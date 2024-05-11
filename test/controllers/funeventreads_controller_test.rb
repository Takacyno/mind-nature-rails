require "test_helper"

class FuneventreadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @funeventread = funeventreads(:one)
  end

  test "should get index" do
    get funeventreads_url
    assert_response :success
  end

  test "should get new" do
    get new_funeventread_url
    assert_response :success
  end

  test "should create funeventread" do
    assert_difference("Funeventread.count") do
      post funeventreads_url, params: { funeventread: {  } }
    end

    assert_redirected_to funeventread_url(Funeventread.last)
  end

  test "should show funeventread" do
    get funeventread_url(@funeventread)
    assert_response :success
  end

  test "should get edit" do
    get edit_funeventread_url(@funeventread)
    assert_response :success
  end

  test "should update funeventread" do
    patch funeventread_url(@funeventread), params: { funeventread: {  } }
    assert_redirected_to funeventread_url(@funeventread)
  end

  test "should destroy funeventread" do
    assert_difference("Funeventread.count", -1) do
      delete funeventread_url(@funeventread)
    end

    assert_redirected_to funeventreads_url
  end
end
