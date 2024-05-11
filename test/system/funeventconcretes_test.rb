require "application_system_test_case"

class FuneventconcretesTest < ApplicationSystemTestCase
  setup do
    @funeventconcrete = funeventconcretes(:one)
  end

  test "visiting the index" do
    visit funeventconcretes_url
    assert_selector "h1", text: "Funeventconcretes"
  end

  test "should create funeventconcrete" do
    visit funeventconcretes_url
    click_on "New funeventconcrete"

    click_on "Create Funeventconcrete"

    assert_text "Funeventconcrete was successfully created"
    click_on "Back"
  end

  test "should update Funeventconcrete" do
    visit funeventconcrete_url(@funeventconcrete)
    click_on "Edit this funeventconcrete", match: :first

    click_on "Update Funeventconcrete"

    assert_text "Funeventconcrete was successfully updated"
    click_on "Back"
  end

  test "should destroy Funeventconcrete" do
    visit funeventconcrete_url(@funeventconcrete)
    click_on "Destroy this funeventconcrete", match: :first

    assert_text "Funeventconcrete was successfully destroyed"
  end
end
