class Post < ApplicationRecord
  belongs_to :user
  belongs_to :startup, optional: true
  has_many :comments, dependent: :destroy
  #validates :name, presence: true
end
