class Friend < ApplicationRecord
    has_one_attached :document
    belongs_to :user
end
