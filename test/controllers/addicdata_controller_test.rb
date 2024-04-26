require "test_helper"

class AddicdataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @addicdatum = addicdata(:one)
  end

  test "should get index" do
    get addicdata_url
    assert_response :success
  end

  test "should get new" do
    get new_addicdatum_url
    assert_response :success
  end

  test "should create addicdatum" do
    assert_difference("Addicdatum.count") do
      post addicdata_url, params: { addicdatum: { controlstimulusinstruction: @addicdatum.controlstimulusinstruction, controlstimulustext: @addicdatum.controlstimulustext, difficulties: @addicdatum.difficulties, essay: @addicdatum.essay, essayok: @addicdatum.essayok, frequency: @addicdatum.frequency, goal: @addicdatum.goal, imaginationinstruction: @addicdatum.imaginationinstruction, method: @addicdatum.method, progress: @addicdatum.progress, pseudoactinstruction: @addicdatum.pseudoactinstruction, severity: @addicdatum.severity, supplement: @addicdatum.supplement, trouble: @addicdatum.trouble, what: @addicdatum.what } }
    end

    assert_redirected_to addicdatum_url(Addicdatum.last)
  end

  test "should show addicdatum" do
    get addicdatum_url(@addicdatum)
    assert_response :success
  end

  test "should get edit" do
    get edit_addicdatum_url(@addicdatum)
    assert_response :success
  end

  test "should update addicdatum" do
    patch addicdatum_url(@addicdatum), params: { addicdatum: { controlstimulusinstruction: @addicdatum.controlstimulusinstruction, controlstimulustext: @addicdatum.controlstimulustext, difficulties: @addicdatum.difficulties, essay: @addicdatum.essay, essayok: @addicdatum.essayok, frequency: @addicdatum.frequency, goal: @addicdatum.goal, imaginationinstruction: @addicdatum.imaginationinstruction, method: @addicdatum.method, progress: @addicdatum.progress, pseudoactinstruction: @addicdatum.pseudoactinstruction, severity: @addicdatum.severity, supplement: @addicdatum.supplement, trouble: @addicdatum.trouble, what: @addicdatum.what } }
    assert_redirected_to addicdatum_url(@addicdatum)
  end

  test "should destroy addicdatum" do
    assert_difference("Addicdatum.count", -1) do
      delete addicdatum_url(@addicdatum)
    end

    assert_redirected_to addicdata_url
  end
end
