class Department < ApplicationRecord
  validates_presence_of :name, :code, :total_members
end
