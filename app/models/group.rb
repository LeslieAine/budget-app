class Group < ApplicationRecord
    validates :name, :icon, presence: true
  
    belongs_to :user
    has_and_belongs_to_many :operations
  end