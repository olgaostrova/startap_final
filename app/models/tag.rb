class Tag < ApplicationRecord
  belongs_to :tag_type
  belongs_to :user
  belongs_to :startup
  belongs_to :post
end
