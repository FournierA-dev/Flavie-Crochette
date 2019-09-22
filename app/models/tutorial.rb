class Tutorial < ApplicationRecord

  validates :name, presence: true , uniqueness:true, length: { in: 2..20 }
  validates :description, presence:true, length: { in: 2..1000}
  validates :creation_date, presence:true
  validate :creation_date_specific_validation

  has_many :comments, as: :commentable
  has_many :tags, as: :tagable

  ##################################### PRIVATE METHOD
  private 

  def creation_date_specific_validation
    if !creation_date.nil? 
      errors.add(:creation_date,:not_in_the_futur, {message: 'ne peux pas être une date dans le futur'}) if creation_date > Date.today
    end
  end

end


