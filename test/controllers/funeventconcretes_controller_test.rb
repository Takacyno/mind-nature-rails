require "test_helper"

class FuneventconcretesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @funeventconcrete = funeventconcretes(:one)
  end

  test "should get index" do
    get funeventconcretes_url
    assert_response :success
  end

  test "should get new" do
    get new_funeventconcrete_url
    assert_response :success
  end

  test "should create funeventconcrete" do
    assert_difference("Funeventconcrete.count") do
      post funeventconcretes_url, params: { funeventconcrete: {  } }
    end

    assert_redirected_to funeventconcrete_url(Funeventconcrete.last)
  end

  test "should show funeventconcrete" do
    get funeventconcrete_url(@funeventconcrete)
    assert_response :success
  end

  test "should get edit" do
    get edit_funeventconcrete_url(@funeventconcrete)
    assert_response :success
  end

  test "should update funeventconcrete" do
    patch funeventconcrete_url(@funeventconcrete), params: { funeventconcrete: {  } }
    assert_redirected_to funeventconcrete_url(@funeventconcrete)
  end

  test "should destroy funeventconcrete" do
    assert_difference("Funeventconcrete.count", -1) do
      delete funeventconcrete_url(@funeventconcrete)
    end

    assert_redirected_to funeventconcretes_url
  end
end
