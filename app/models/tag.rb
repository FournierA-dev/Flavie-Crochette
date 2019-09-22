class Tag < ApplicationRecord

  validates :content, presence: true , uniqueness:true, length: { in: 2..10 }

  belongs_to :tagable, polymorphic: true

end
