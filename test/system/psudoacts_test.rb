require "application_system_test_case"

class PsudoactsTest < ApplicationSystemTestCase
  setup do
    @psudoact = psudoacts(:one)
  end

  test "visiting the index" do
    visit psudoacts_url
    assert_selector "h1", text: "Psudoacts"
  end

  test "should create psudoact" do
    visit psudoacts_url
    click_on "New psudoact"

    fill_in "Addicdatum", with: @psudoact.addicdatum_id
    click_on "Create Psudoact"

    assert_text "Psudoact was successfully created"
    click_on "Back"
  end

  test "should update Psudoact" do
    visit psudoact_url(@psudoact)
    click_on "Edit this psudoact", match: :first

    fill_in "Addicdatum", with: @psudoact.addicdatum_id
    click_on "Update Psudoact"

    assert_text "Psudoact was successfully updated"
    click_on "Back"
  end

  test "should destroy Psudoact" do
    visit psudoact_url(@psudoact)
    click_on "Destroy this psudoact", match: :first

    assert_text "Psudoact was successfully destroyed"
  end
end
