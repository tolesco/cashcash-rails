class StaticPagesController < ApplicationController

  def dashboard
    @accounts   = current_user.accounts.kept
    @categories = current_user.categories
    @income_and_expenses_data = MoneyTransaction.group(:kind).group_by_month(:done_at, last: 12).sum(:amount)
    @expenses_breakdown_data  = MoneyTransaction.categories_and_percentages_to_hash(current_user, Time.zone.now.year)
  end
end
