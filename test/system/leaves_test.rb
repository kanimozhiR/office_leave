require "application_system_test_case"

class LeavesTest < ApplicationSystemTestCase
  setup do
    @leafe = leaves(:one)
  end

  test "visiting the index" do
    visit leaves_url
    assert_selector "h1", text: "Leaves"
  end

  test "creating a Leave" do
    visit leaves_url
    click_on "New Leave"

    fill_in "Action date", with: @leafe.action_date
    fill_in "Action remarks", with: @leafe.action_remarks
    fill_in "Empid", with: @leafe.empid
    fill_in "End date", with: @leafe.end_date
    fill_in "Leave type", with: @leafe.leave_type
    fill_in "No of days", with: @leafe.no_of_days
    fill_in "Request remarks", with: @leafe.request_remarks
    fill_in "Requester emp", with: @leafe.requester_emp_id
    fill_in "Start date", with: @leafe.start_date
    fill_in "Status", with: @leafe.status
    click_on "Create Leave"

    assert_text "Leave was successfully created"
    click_on "Back"
  end

  test "updating a Leave" do
    visit leaves_url
    click_on "Edit", match: :first

    fill_in "Action date", with: @leafe.action_date
    fill_in "Action remarks", with: @leafe.action_remarks
    fill_in "Empid", with: @leafe.empid
    fill_in "End date", with: @leafe.end_date
    fill_in "Leave type", with: @leafe.leave_type
    fill_in "No of days", with: @leafe.no_of_days
    fill_in "Request remarks", with: @leafe.request_remarks
    fill_in "Requester emp", with: @leafe.requester_emp_id
    fill_in "Start date", with: @leafe.start_date
    fill_in "Status", with: @leafe.status
    click_on "Update Leave"

    assert_text "Leave was successfully updated"
    click_on "Back"
  end

  test "destroying a Leave" do
    visit leaves_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Leave was successfully destroyed"
  end
end
