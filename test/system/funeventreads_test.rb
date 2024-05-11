require "application_system_test_case"

class FuneventreadsTest < ApplicationSystemTestCase
  setup do
    @funeventread = funeventreads(:one)
  end

  test "visiting the index" do
    visit funeventreads_url
    assert_selector "h1", text: "Funeventreads"
  end

  test "should create funeventread" do
    visit funeventreads_url
    click_on "New funeventread"

    click_on "Create Funeventread"

    assert_text "Funeventread was successfully created"
    click_on "Back"
  end

  test "should update Funeventread" do
    visit funeventread_url(@funeventread)
    click_on "Edit this funeventread", match: :first

    click_on "Update Funeventread"

    assert_text "Funeventread was successfully updated"
    click_on "Back"
  end

  test "should destroy Funeventread" do
    visit funeventread_url(@funeventread)
    click_on "Destroy this funeventread", match: :first

    assert_text "Funeventread was successfully destroyed"
  end
end
