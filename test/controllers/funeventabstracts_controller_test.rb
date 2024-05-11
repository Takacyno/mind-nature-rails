require "test_helper"

class FuneventabstractsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @funeventabstract = funeventabstracts(:one)
  end

  test "should get index" do
    get funeventabstracts_url
    assert_response :success
  end

  test "should get new" do
    get new_funeventabstract_url
    assert_response :success
  end

  test "should create funeventabstract" do
    assert_difference("Funeventabstract.count") do
      post funeventabstracts_url, params: { funeventabstract: {  } }
    end

    assert_redirected_to funeventabstract_url(Funeventabstract.last)
  end

  test "should show funeventabstract" do
    get funeventabstract_url(@funeventabstract)
    assert_response :success
  end

  test "should get edit" do
    get edit_funeventabstract_url(@funeventabstract)
    assert_response :success
  end

  test "should update funeventabstract" do
    patch funeventabstract_url(@funeventabstract), params: { funeventabstract: {  } }
    assert_redirected_to funeventabstract_url(@funeventabstract)
  end

  test "should destroy funeventabstract" do
    assert_difference("Funeventabstract.count", -1) do
      delete funeventabstract_url(@funeventabstract)
    end

    assert_redirected_to funeventabstracts_url
  end
end
