class EntitiesGroup < ApplicationRecord
    belongs_to :group
    belongs_to :entity

    after_create :total_purchases_group
  def total_purchases_group
    group.increment!(:total_purchases, purchase.amount)
  end
  end