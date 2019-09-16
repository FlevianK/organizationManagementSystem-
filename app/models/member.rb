class Member < ApplicationRecord
  has_many :leaders, dependent: :destroy

  validates_inclusion_of :born_again, in: [true, false]
  validates_inclusion_of :spirit_filled, in: [true, false]
  validates_presence_of :name, :contacts, :residence, :join_date, :departments
end
