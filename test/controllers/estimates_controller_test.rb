require 'test_helper'

class EstimatesControllerTest < ActionController::TestCase
  setup do
    @estimate = estimates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:estimates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create estimate" do
    assert_difference('Estimate.count') do
      post :create, estimate: { date: @estimate.date, due_on: @estimate.due_on, estimate_notes: @estimate.estimate_notes, estimate_number: @estimate.estimate_number, from: @estimate.from, number: @estimate.number, summary: @estimate.summary, to: @estimate.to }
    end

    assert_redirected_to estimate_path(assigns(:estimate))
  end

  test "should show estimate" do
    get :show, id: @estimate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @estimate
    assert_response :success
  end

  test "should update estimate" do
    patch :update, id: @estimate, estimate: { date: @estimate.date, due_on: @estimate.due_on, estimate_notes: @estimate.estimate_notes, estimate_number: @estimate.estimate_number, from: @estimate.from, number: @estimate.number, summary: @estimate.summary, to: @estimate.to }
    assert_redirected_to estimate_path(assigns(:estimate))
  end

  test "should destroy estimate" do
    assert_difference('Estimate.count', -1) do
      delete :destroy, id: @estimate
    end

    assert_redirected_to estimates_path
  end
end
