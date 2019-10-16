class MemberSerializer < ActiveModel::Serializer
  attributes :id, :name, :contacts, :residence, :join_date, :born_again, :spirit_filled, :departments, :created_at, :updated_at

  has_many :leaders
end
