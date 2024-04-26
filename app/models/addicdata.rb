class Addicdatum < ApplicationRecord
    belongs_to :patient,class_name: 'Patient'
end
