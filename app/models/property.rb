class Property < ApplicationRecord
  validates :name, presence: true
  validates :headline, presence: true
  validates :description, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :country, presence: true
end

t.string "name"
    t.string "headline"
    t.text "description"
    t.string "city"
    t.string "state"
    t.string "country"
