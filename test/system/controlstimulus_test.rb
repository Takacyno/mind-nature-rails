require "application_system_test_case"

class ControlstimulusTest < ApplicationSystemTestCase
  setup do
    @controlstimulu = controlstimulus(:one)
  end

  test "visiting the index" do
    visit controlstimulus_url
    assert_selector "h1", text: "Controlstimulus"
  end

  test "should create controlstimulu" do
    visit controlstimulus_url
    click_on "New controlstimulu"

    fill_in "Addicdatum id", with: @controlstimulu.addicdatum_id_id
    fill_in "Num", with: @controlstimulu.num
    click_on "Create Controlstimulu"

    assert_text "Controlstimulu was successfully created"
    click_on "Back"
  end

  test "should update Controlstimulu" do
    visit controlstimulu_url(@controlstimulu)
    click_on "Edit this controlstimulu", match: :first

    fill_in "Addicdatum id", with: @controlstimulu.addicdatum_id_id
    fill_in "Num", with: @controlstimulu.num
    click_on "Update Controlstimulu"

    assert_text "Controlstimulu was successfully updated"
    click_on "Back"
  end

  test "should destroy Controlstimulu" do
    visit controlstimulu_url(@controlstimulu)
    click_on "Destroy this controlstimulu", match: :first

    assert_text "Controlstimulu was successfully destroyed"
  end
end
