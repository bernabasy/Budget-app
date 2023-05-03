class GroupEntity < ApplicationRecord
  belongs_to :group
  belongs_to :entity

  after_create :total_entities_group
  
  def total_entities_group
    group.increment!(:total_entities, entity.amount)
  end
end
