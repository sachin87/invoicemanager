require 'test_helper'

class BillsControllerTest < ActionController::TestCase
  setup do
    @bill = bills(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bills)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bill" do
    assert_difference('Bill.count') do
      post :create, bill: { bill_from: @bill.bill_from, bill_number: @bill.bill_number, bill_to: @bill.bill_to, date: @bill.date, due_on: @bill.due_on, invoice_notes: @bill.invoice_notes, purchase_order_number: @bill.purchase_order_number, summary: @bill.summary }
    end

    assert_redirected_to bill_path(assigns(:bill))
  end

  test "should show bill" do
    get :show, id: @bill
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bill
    assert_response :success
  end

  test "should update bill" do
    patch :update, id: @bill, bill: { bill_from: @bill.bill_from, bill_number: @bill.bill_number, bill_to: @bill.bill_to, date: @bill.date, due_on: @bill.due_on, invoice_notes: @bill.invoice_notes, purchase_order_number: @bill.purchase_order_number, summary: @bill.summary }
    assert_redirected_to bill_path(assigns(:bill))
  end

  test "should destroy bill" do
    assert_difference('Bill.count', -1) do
      delete :destroy, id: @bill
    end

    assert_redirected_to bills_path
  end
end
