require "test_helper"

class ControlstimulusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @controlstimulu = controlstimulus(:one)
  end

  test "should get index" do
    get controlstimulus_url
    assert_response :success
  end

  test "should get new" do
    get new_controlstimulu_url
    assert_response :success
  end

  test "should create controlstimulu" do
    assert_difference("Controlstimulu.count") do
      post controlstimulus_url, params: { controlstimulu: { addicdatum_id_id: @controlstimulu.addicdatum_id_id, num: @controlstimulu.num } }
    end

    assert_redirected_to controlstimulu_url(Controlstimulu.last)
  end

  test "should show controlstimulu" do
    get controlstimulu_url(@controlstimulu)
    assert_response :success
  end

  test "should get edit" do
    get edit_controlstimulu_url(@controlstimulu)
    assert_response :success
  end

  test "should update controlstimulu" do
    patch controlstimulu_url(@controlstimulu), params: { controlstimulu: { addicdatum_id_id: @controlstimulu.addicdatum_id_id, num: @controlstimulu.num } }
    assert_redirected_to controlstimulu_url(@controlstimulu)
  end

  test "should destroy controlstimulu" do
    assert_difference("Controlstimulu.count", -1) do
      delete controlstimulu_url(@controlstimulu)
    end

    assert_redirected_to controlstimulus_url
  end
end
