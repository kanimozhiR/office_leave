require 'test_helper'

class LeavesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @leafe = leaves(:one)
  end

  test "should get index" do
    get leaves_url
    assert_response :success
  end

  test "should get new" do
    get new_leafe_url
    assert_response :success
  end

  test "should create leafe" do
    assert_difference('Leave.count') do
      post leaves_url, params: { leafe: { action_date: @leafe.action_date, action_remarks: @leafe.action_remarks, empid: @leafe.empid, end_date: @leafe.end_date, leave_type: @leafe.leave_type, no_of_days: @leafe.no_of_days, request_remarks: @leafe.request_remarks, requester_emp_id: @leafe.requester_emp_id, start_date: @leafe.start_date, status: @leafe.status } }
    end

    assert_redirected_to leafe_url(Leave.last)
  end

  test "should show leafe" do
    get leafe_url(@leafe)
    assert_response :success
  end

  test "should get edit" do
    get edit_leafe_url(@leafe)
    assert_response :success
  end

  test "should update leafe" do
    patch leafe_url(@leafe), params: { leafe: { action_date: @leafe.action_date, action_remarks: @leafe.action_remarks, empid: @leafe.empid, end_date: @leafe.end_date, leave_type: @leafe.leave_type, no_of_days: @leafe.no_of_days, request_remarks: @leafe.request_remarks, requester_emp_id: @leafe.requester_emp_id, start_date: @leafe.start_date, status: @leafe.status } }
    assert_redirected_to leafe_url(@leafe)
  end

  test "should destroy leafe" do
    assert_difference('Leave.count', -1) do
      delete leafe_url(@leafe)
    end

    assert_redirected_to leaves_url
  end
end
