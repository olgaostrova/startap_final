require "application_system_test_case"

class TagTypesTest < ApplicationSystemTestCase
  setup do
    @tag_type = tag_types(:one)
  end

  test "visiting the index" do
    visit tag_types_url
    assert_selector "h1", text: "Tag types"
  end

  test "should create tag type" do
    visit tag_types_url
    click_on "New tag type"

    fill_in "Name", with: @tag_type.name
    click_on "Create Tag type"

    assert_text "Tag type was successfully created"
    click_on "Back"
  end

  test "should update Tag type" do
    visit tag_type_url(@tag_type)
    click_on "Edit this tag type", match: :first

    fill_in "Name", with: @tag_type.name
    click_on "Update Tag type"

    assert_text "Tag type was successfully updated"
    click_on "Back"
  end

  test "should destroy Tag type" do
    visit tag_type_url(@tag_type)
    click_on "Destroy this tag type", match: :first

    assert_text "Tag type was successfully destroyed"
  end
end
