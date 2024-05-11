require "application_system_test_case"

class FuneventabstractsTest < ApplicationSystemTestCase
  setup do
    @funeventabstract = funeventabstracts(:one)
  end

  test "visiting the index" do
    visit funeventabstracts_url
    assert_selector "h1", text: "Funeventabstracts"
  end

  test "should create funeventabstract" do
    visit funeventabstracts_url
    click_on "New funeventabstract"

    click_on "Create Funeventabstract"

    assert_text "Funeventabstract was successfully created"
    click_on "Back"
  end

  test "should update Funeventabstract" do
    visit funeventabstract_url(@funeventabstract)
    click_on "Edit this funeventabstract", match: :first

    click_on "Update Funeventabstract"

    assert_text "Funeventabstract was successfully updated"
    click_on "Back"
  end

  test "should destroy Funeventabstract" do
    visit funeventabstract_url(@funeventabstract)
    click_on "Destroy this funeventabstract", match: :first

    assert_text "Funeventabstract was successfully destroyed"
  end
end
