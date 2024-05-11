class Patient < ApplicationRecord
    belongs_to :user
    has_many :addicdata
    has_many :funeventabstracts
end