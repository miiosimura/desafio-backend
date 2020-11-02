class Congressman < ApplicationRecord
  has_many :spends
  has_many :yearly_spends
end
