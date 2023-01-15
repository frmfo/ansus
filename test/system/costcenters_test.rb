require "application_system_test_case"

class CostcentersTest < ApplicationSystemTestCase
  setup do
    @costcenter = costcenters(:one)
  end

  test "visiting the index" do
    visit costcenters_url
    assert_selector "h1", text: "Costcenters"
  end

  test "should create costcenter" do
    visit costcenters_url
    click_on "New costcenter"

    fill_in "Branch", with: @costcenter.branch_id
    fill_in "Name", with: @costcenter.name
    fill_in "Service", with: @costcenter.service_id
    check "Status" if @costcenter.status
    click_on "Create Costcenter"

    assert_text "Costcenter was successfully created"
    click_on "Back"
  end

  test "should update Costcenter" do
    visit costcenter_url(@costcenter)
    click_on "Edit this costcenter", match: :first

    fill_in "Branch", with: @costcenter.branch_id
    fill_in "Name", with: @costcenter.name
    fill_in "Service", with: @costcenter.service_id
    check "Status" if @costcenter.status
    click_on "Update Costcenter"

    assert_text "Costcenter was successfully updated"
    click_on "Back"
  end

  test "should destroy Costcenter" do
    visit costcenter_url(@costcenter)
    click_on "Destroy this costcenter", match: :first

    assert_text "Costcenter was successfully destroyed"
  end
end
