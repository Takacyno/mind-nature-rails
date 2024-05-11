require "application_system_test_case"

class ImaginationtextsTest < ApplicationSystemTestCase
  setup do
    @imaginationtext = imaginationtexts(:one)
  end

  test "visiting the index" do
    visit imaginationtexts_url
    assert_selector "h1", text: "Imaginationtexts"
  end

  test "should create imaginationtext" do
    visit imaginationtexts_url
    click_on "New imaginationtext"

    fill_in "Addicdatum", with: @imaginationtext.addicdatum_id
    click_on "Create Imaginationtext"

    assert_text "Imaginationtext was successfully created"
    click_on "Back"
  end

  test "should update Imaginationtext" do
    visit imaginationtext_url(@imaginationtext)
    click_on "Edit this imaginationtext", match: :first

    fill_in "Addicdatum", with: @imaginationtext.addicdatum_id
    click_on "Update Imaginationtext"

    assert_text "Imaginationtext was successfully updated"
    click_on "Back"
  end

  test "should destroy Imaginationtext" do
    visit imaginationtext_url(@imaginationtext)
    click_on "Destroy this imaginationtext", match: :first

    assert_text "Imaginationtext was successfully destroyed"
  end
end
