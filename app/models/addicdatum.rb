class Addicdatum < ApplicationRecord
    belongs_to :patient,class_name: 'Patient'
    has_many :diaries
    has_many :essayreads
    has_many :imaginations
    has_many :pseudoacts
    has_many :imaginationtexts
    has_many :controlstimulus
end
