json.extract! money_transaction, :id, :description, :done_at, :kind, :amount, :notes, :cfdi_folio, :cfdi_issued_by, :cfdi_issued_rfc, :cfdi_payment_method, :data, :account_id, :category_id, :created_at, :updated_at
json.url money_transaction_url(money_transaction, format: :json)
