class Gossip < ApplicationRecord
    validates :title, presence: true , length: {maximum: 15}
    validates :content, presence: true
    
    belongs_to :user
    has_many :comments
    has_many :likes
end
