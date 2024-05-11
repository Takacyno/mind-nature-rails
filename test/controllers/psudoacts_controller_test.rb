require "test_helper"

class PsudoactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @psudoact = psudoacts(:one)
  end

  test "should get index" do
    get psudoacts_url
    assert_response :success
  end

  test "should get new" do
    get new_psudoact_url
    assert_response :success
  end

  test "should create psudoact" do
    assert_difference("Psudoact.count") do
      post psudoacts_url, params: { psudoact: { addicdatum_id: @psudoact.addicdatum_id } }
    end

    assert_redirected_to psudoact_url(Psudoact.last)
  end

  test "should show psudoact" do
    get psudoact_url(@psudoact)
    assert_response :success
  end

  test "should get edit" do
    get edit_psudoact_url(@psudoact)
    assert_response :success
  end

  test "should update psudoact" do
    patch psudoact_url(@psudoact), params: { psudoact: { addicdatum_id: @psudoact.addicdatum_id } }
    assert_redirected_to psudoact_url(@psudoact)
  end

  test "should destroy psudoact" do
    assert_difference("Psudoact.count", -1) do
      delete psudoact_url(@psudoact)
    end

    assert_redirected_to psudoacts_url
  end
end
