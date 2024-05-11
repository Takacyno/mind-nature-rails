class Funeventabstract < ApplicationRecord
    belongs_to :patient
    has_one :funeventconcrete
    has_many :funeventreads
end
