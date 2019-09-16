class Member < ApplicationRecord
  has_many :leaders, dependent: :destroy

  validates_presence_of :name, :contacts, :residence, :join_date, :born_again, :spirit_filled, :departments
end
