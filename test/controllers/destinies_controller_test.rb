require "test_helper"

class DestiniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @destiny = destinies(:one)
  end

  test "should get index" do
    get destinies_url
    assert_response :success
  end

  test "should get new" do
    get new_destiny_url
    assert_response :success
  end

  test "should create destiny" do
    assert_difference("Destiny.count") do
      post destinies_url, params: { destiny: { branch_id: @destiny.branch_id, name: @destiny.name, status: @destiny.status } }
    end

    assert_redirected_to destiny_url(Destiny.last)
  end

  test "should show destiny" do
    get destiny_url(@destiny)
    assert_response :success
  end

  test "should get edit" do
    get edit_destiny_url(@destiny)
    assert_response :success
  end

  test "should update destiny" do
    patch destiny_url(@destiny), params: { destiny: { branch_id: @destiny.branch_id, name: @destiny.name, status: @destiny.status } }
    assert_redirected_to destiny_url(@destiny)
  end

  test "should destroy destiny" do
    assert_difference("Destiny.count", -1) do
      delete destiny_url(@destiny)
    end

    assert_redirected_to destinies_url
  end
end
