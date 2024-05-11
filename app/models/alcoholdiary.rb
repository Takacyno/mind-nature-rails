class Alcoholdiary < ApplicationRecord
    belongs_to :diary,class_name: 'Diary'
end
