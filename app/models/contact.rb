class Contact < ApplicationRecord
  belongs_to :user
  has_many :meetings, dependent: :destroy
  has_many :tasks, dependent: :destroy
end
