require "application_system_test_case"

class ImaginationsTest < ApplicationSystemTestCase
  setup do
    @imagination = imaginations(:one)
  end

  test "visiting the index" do
    visit imaginations_url
    assert_selector "h1", text: "Imaginations"
  end

  test "should create imagination" do
    visit imaginations_url
    click_on "New imagination"

    fill_in "Addicdatum", with: @imagination.addicdatum_id
    click_on "Create Imagination"

    assert_text "Imagination was successfully created"
    click_on "Back"
  end

  test "should update Imagination" do
    visit imagination_url(@imagination)
    click_on "Edit this imagination", match: :first

    fill_in "Addicdatum", with: @imagination.addicdatum_id
    click_on "Update Imagination"

    assert_text "Imagination was successfully updated"
    click_on "Back"
  end

  test "should destroy Imagination" do
    visit imagination_url(@imagination)
    click_on "Destroy this imagination", match: :first

    assert_text "Imagination was successfully destroyed"
  end
end
