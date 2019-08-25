require 'test_helper'

class ReconciliationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reconciliation = reconciliations(:one)
  end

  test "should get index" do
    get reconciliations_url
    assert_response :success
  end

  test "should get new" do
    get new_reconciliation_url
    assert_response :success
  end

  test "should create reconciliation" do
    assert_difference('Reconciliation.count') do
      post reconciliations_url, params: { reconciliation: { account_id: @reconciliation.account_id, amount: @reconciliation.amount, data: @reconciliation.data, new_balance: @reconciliation.new_balance, notes: @reconciliation.notes, past_balance: @reconciliation.past_balance } }
    end

    assert_redirected_to reconciliation_url(Reconciliation.last)
  end

  test "should show reconciliation" do
    get reconciliation_url(@reconciliation)
    assert_response :success
  end

  test "should get edit" do
    get edit_reconciliation_url(@reconciliation)
    assert_response :success
  end

  test "should update reconciliation" do
    patch reconciliation_url(@reconciliation), params: { reconciliation: { account_id: @reconciliation.account_id, amount: @reconciliation.amount, data: @reconciliation.data, new_balance: @reconciliation.new_balance, notes: @reconciliation.notes, past_balance: @reconciliation.past_balance } }
    assert_redirected_to reconciliation_url(@reconciliation)
  end

  test "should destroy reconciliation" do
    assert_difference('Reconciliation.count', -1) do
      delete reconciliation_url(@reconciliation)
    end

    assert_redirected_to reconciliations_url
  end
end
