require "application_system_test_case"

class MoneyTransactionsTest < ApplicationSystemTestCase
  setup do
    @money_transaction = money_transactions(:one)
  end

  test "visiting the index" do
    visit money_transactions_url
    assert_selector "h1", text: "Money Transactions"
  end

  test "creating a Money transaction" do
    visit money_transactions_url
    click_on "New Money Transaction"

    fill_in "Account", with: @money_transaction.account_id
    fill_in "Amount", with: @money_transaction.amount
    fill_in "Category", with: @money_transaction.category_id
    fill_in "Cfdi folio", with: @money_transaction.cfdi_folio
    fill_in "Cfdi issued by", with: @money_transaction.cfdi_issued_by
    fill_in "Cfdi issued rfc", with: @money_transaction.cfdi_issued_rfc
    fill_in "Cfdi payment method", with: @money_transaction.cfdi_payment_method
    fill_in "Data", with: @money_transaction.data
    fill_in "Description", with: @money_transaction.description
    fill_in "Done at", with: @money_transaction.done_at
    fill_in "Kind", with: @money_transaction.kind
    fill_in "Notes", with: @money_transaction.notes
    click_on "Create Money transaction"

    assert_text "Money transaction was successfully created"
    click_on "Back"
  end

  test "updating a Money transaction" do
    visit money_transactions_url
    click_on "Edit", match: :first

    fill_in "Account", with: @money_transaction.account_id
    fill_in "Amount", with: @money_transaction.amount
    fill_in "Category", with: @money_transaction.category_id
    fill_in "Cfdi folio", with: @money_transaction.cfdi_folio
    fill_in "Cfdi issued by", with: @money_transaction.cfdi_issued_by
    fill_in "Cfdi issued rfc", with: @money_transaction.cfdi_issued_rfc
    fill_in "Cfdi payment method", with: @money_transaction.cfdi_payment_method
    fill_in "Data", with: @money_transaction.data
    fill_in "Description", with: @money_transaction.description
    fill_in "Done at", with: @money_transaction.done_at
    fill_in "Kind", with: @money_transaction.kind
    fill_in "Notes", with: @money_transaction.notes
    click_on "Update Money transaction"

    assert_text "Money transaction was successfully updated"
    click_on "Back"
  end

  test "destroying a Money transaction" do
    visit money_transactions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Money transaction was successfully destroyed"
  end
end
