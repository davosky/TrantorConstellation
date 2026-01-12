require "application_system_test_case"

class TransportsTest < ApplicationSystemTestCase
  setup do
    @transport = transports(:one)
  end

  test "visiting the index" do
    visit transports_url
    assert_selector "h1", text: "Transports"
  end

  test "should create transport" do
    visit transports_url
    click_on "New transport"

    fill_in "Name", with: @transport.name
    fill_in "Position", with: @transport.position
    fill_in "User", with: @transport.user_id
    click_on "Create Transport"

    assert_text "Transport was successfully created"
    click_on "Back"
  end

  test "should update Transport" do
    visit transport_url(@transport)
    click_on "Edit this transport", match: :first

    fill_in "Name", with: @transport.name
    fill_in "Position", with: @transport.position
    fill_in "User", with: @transport.user_id
    click_on "Update Transport"

    assert_text "Transport was successfully updated"
    click_on "Back"
  end

  test "should destroy Transport" do
    visit transport_url(@transport)
    click_on "Destroy this transport", match: :first

    assert_text "Transport was successfully destroyed"
  end
end
