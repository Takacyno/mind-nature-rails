class Diary < ApplicationRecord
    belongs_to :addicdatum,class_name: 'Addicdatum'
    has_one :alcoholdiary,dependent: :destroy
    accepts_nested_attributes_for :alcoholdiary
end
