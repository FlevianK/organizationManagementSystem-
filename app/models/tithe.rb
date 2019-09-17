class Tithe < ApplicationRecord

  validates_inclusion_of :member, in: [true, false]
  validates_presence_of :name, :amount, :tithe_date, :contacts
end
