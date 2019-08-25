require 'test_helper'

class MoneyTransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @money_transaction = money_transactions(:one)
  end

  test "should get index" do
    get money_transactions_url
    assert_response :success
  end

  test "should get new" do
    get new_money_transaction_url
    assert_response :success
  end

  test "should create money_transaction" do
    assert_difference('MoneyTransaction.count') do
      post money_transactions_url, params: { money_transaction: { account_id: @money_transaction.account_id, amount: @money_transaction.amount, category_id: @money_transaction.category_id, cfdi_folio: @money_transaction.cfdi_folio, cfdi_issued_by: @money_transaction.cfdi_issued_by, cfdi_issued_rfc: @money_transaction.cfdi_issued_rfc, cfdi_payment_method: @money_transaction.cfdi_payment_method, data: @money_transaction.data, description: @money_transaction.description, done_at: @money_transaction.done_at, kind: @money_transaction.kind, notes: @money_transaction.notes } }
    end

    assert_redirected_to money_transaction_url(MoneyTransaction.last)
  end

  test "should show money_transaction" do
    get money_transaction_url(@money_transaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_money_transaction_url(@money_transaction)
    assert_response :success
  end

  test "should update money_transaction" do
    patch money_transaction_url(@money_transaction), params: { money_transaction: { account_id: @money_transaction.account_id, amount: @money_transaction.amount, category_id: @money_transaction.category_id, cfdi_folio: @money_transaction.cfdi_folio, cfdi_issued_by: @money_transaction.cfdi_issued_by, cfdi_issued_rfc: @money_transaction.cfdi_issued_rfc, cfdi_payment_method: @money_transaction.cfdi_payment_method, data: @money_transaction.data, description: @money_transaction.description, done_at: @money_transaction.done_at, kind: @money_transaction.kind, notes: @money_transaction.notes } }
    assert_redirected_to money_transaction_url(@money_transaction)
  end

  test "should destroy money_transaction" do
    assert_difference('MoneyTransaction.count', -1) do
      delete money_transaction_url(@money_transaction)
    end

    assert_redirected_to money_transactions_url
  end
end
