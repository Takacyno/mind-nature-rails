class User < ApplicationRecord
  has_secure_password
  validates :name,presence: true
  validates :email,presence: true, uniqueness: true
  has_one :patient
  accepts_nested_attributes_for :patient
  has_one :counsellor
  accepts_nested_attributes_for :counsellor
end
