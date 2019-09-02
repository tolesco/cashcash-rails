# require 'faker'
# income_category  = Category.where(name: 'Uncategorized income').first
# expense_category = Category.where(name: 'Uncategorized expense').first

## Set example income transactions
# for i in 0..100 do
#   MoneyTransaction.create(
#     description: Faker::Commerce.product_name,
#     done_at: Faker::Date.backward(days: 90),
#     kind: 'deposit',
#     amount: Faker::Commerce.price,
#     account: Account.first,
#     category: income_category,
#   )
# end

## Set example expenses transactions
# for i in 0..100 do
#   MoneyTransaction.create(
#     description: Faker::Commerce.product_name,
#     done_at: Faker::Date.backward(days: 90),
#     kind: 'withdrawal',
#     amount: Faker::Commerce.price,
#     account: Account.first,
#     category: expense_category,
#   )
# end