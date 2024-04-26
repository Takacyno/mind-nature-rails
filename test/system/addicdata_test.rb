require "application_system_test_case"

class AddicdataTest < ApplicationSystemTestCase
  setup do
    @addicdatum = addicdata(:one)
  end

  test "visiting the index" do
    visit addicdata_url
    assert_selector "h1", text: "Addicdata"
  end

  test "should create addicdatum" do
    visit addicdata_url
    click_on "New addicdatum"

    fill_in "Controlstimulusinstruction", with: @addicdatum.controlstimulusinstruction
    fill_in "Controlstimulustext", with: @addicdatum.controlstimulustext
    fill_in "Difficulties", with: @addicdatum.difficulties
    fill_in "Essay", with: @addicdatum.essay
    check "Essayok" if @addicdatum.essayok
    fill_in "Frequency", with: @addicdatum.frequency
    fill_in "Goal", with: @addicdatum.goal
    fill_in "Imaginationinstruction", with: @addicdatum.imaginationinstruction
    fill_in "Method", with: @addicdatum.method
    fill_in "Progress", with: @addicdatum.progress
    fill_in "Pseudoactinstruction", with: @addicdatum.pseudoactinstruction
    fill_in "Severity", with: @addicdatum.severity
    fill_in "Supplement", with: @addicdatum.supplement
    fill_in "Trouble", with: @addicdatum.trouble
    fill_in "What", with: @addicdatum.what
    click_on "Create Addicdatum"

    assert_text "Addicdatum was successfully created"
    click_on "Back"
  end

  test "should update Addicdatum" do
    visit addicdatum_url(@addicdatum)
    click_on "Edit this addicdatum", match: :first

    fill_in "Controlstimulusinstruction", with: @addicdatum.controlstimulusinstruction
    fill_in "Controlstimulustext", with: @addicdatum.controlstimulustext
    fill_in "Difficulties", with: @addicdatum.difficulties
    fill_in "Essay", with: @addicdatum.essay
    check "Essayok" if @addicdatum.essayok
    fill_in "Frequency", with: @addicdatum.frequency
    fill_in "Goal", with: @addicdatum.goal
    fill_in "Imaginationinstruction", with: @addicdatum.imaginationinstruction
    fill_in "Method", with: @addicdatum.method
    fill_in "Progress", with: @addicdatum.progress
    fill_in "Pseudoactinstruction", with: @addicdatum.pseudoactinstruction
    fill_in "Severity", with: @addicdatum.severity
    fill_in "Supplement", with: @addicdatum.supplement
    fill_in "Trouble", with: @addicdatum.trouble
    fill_in "What", with: @addicdatum.what
    click_on "Update Addicdatum"

    assert_text "Addicdatum was successfully updated"
    click_on "Back"
  end

  test "should destroy Addicdatum" do
    visit addicdatum_url(@addicdatum)
    click_on "Destroy this addicdatum", match: :first

    assert_text "Addicdatum was successfully destroyed"
  end
end
