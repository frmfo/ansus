require "test_helper"

class WeighingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @weighing = weighings(:one)
  end

  test "should get index" do
    get weighings_url
    assert_response :success
  end

  test "should get new" do
    get new_weighing_url
    assert_response :success
  end

  test "should create weighing" do
    assert_difference("Weighing.count") do
      post weighings_url, params: { weighing: { branch_id: @weighing.branch_id, costcenter_id: @weighing.costcenter_id, destino: @weighing.destino, dia: @weighing.dia, employee_id: @weighing.employee_id, hora: @weighing.hora, user_id: @weighing.user_id, vehicle_id: @weighing.vehicle_id, weight_in: @weighing.weight_in, weight_out: @weighing.weight_out } }
    end

    assert_redirected_to weighing_url(Weighing.last)
  end

  test "should show weighing" do
    get weighing_url(@weighing)
    assert_response :success
  end

  test "should get edit" do
    get edit_weighing_url(@weighing)
    assert_response :success
  end

  test "should update weighing" do
    patch weighing_url(@weighing), params: { weighing: { branch_id: @weighing.branch_id, costcenter_id: @weighing.costcenter_id, destino: @weighing.destino, dia: @weighing.dia, employee_id: @weighing.employee_id, hora: @weighing.hora, user_id: @weighing.user_id, vehicle_id: @weighing.vehicle_id, weight_in: @weighing.weight_in, weight_out: @weighing.weight_out } }
    assert_redirected_to weighing_url(@weighing)
  end

  test "should destroy weighing" do
    assert_difference("Weighing.count", -1) do
      delete weighing_url(@weighing)
    end

    assert_redirected_to weighings_url
  end
end
