class Tithe < ApplicationRecord
  validates_presence_of :name, :amount, :tithe_date, :member, :contacts
end
