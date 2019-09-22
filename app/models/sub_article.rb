class SubArticle < ApplicationRecord

  validates :sub_article_type, presence:true, length: { in: 2..20 }
  validates :creation_date, presence:true
  validate :creation_date_specific_validation
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 0.5}

  belongs_to :article
  has_many :comments, as: :commentable

  ##################################### PRIVATE METHOD
  private 

  def creation_date_specific_validation
    if !creation_date.nil? 
      errors.add(:creation_date,:not_in_the_futur, {message: 'doit être une date passée'}) if creation_date > Date.today
    end
  end

end
