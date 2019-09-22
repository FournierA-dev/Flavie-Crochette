class Comment < ApplicationRecord

  validates :content, presence: true , length: { in: 20..1000 }

  belongs_to :commentable, polymorphic: true
  belongs_to :user

end
