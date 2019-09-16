class Leader < ApplicationRecord
  belongs_to :member

  validates_presence_of :title, :department
end
