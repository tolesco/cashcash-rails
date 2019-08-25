json.extract! account, :id, :kind, :name, :initial_balance, :current_balance, :description, :data, :user_id, :created_at, :updated_at
json.url account_url(account, format: :json)
