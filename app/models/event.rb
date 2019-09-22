class Event < ApplicationRecord

  #Validations
  validates :start_date, presence: true
  validates :duration, presence: true
  validate :event_specific_validation
  validates :title, presence: true, length: {in: 5..140}
  validates :description, presence: true, length: {in: 20..1000}
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than: 1000 }
  validates :location, presence: true

  #DB structure and links
  belongs_to :owner, class_name: "User"
  has_many :attendances, foreign_key: 'attended_event_id', dependent: :destroy
  has_many :attendees, class_name: 'User', through: :attendances
  has_many :comments, as: :commentable


  
  def end_date
    return self.start_date + self.duration * 60
  end

  ##################################### PRIVATE METHOD
  private 


  def event_specific_validation
    #on duration value
    if !duration.nil? 
      errors.add(:duration,:not_multiple_of_5, {message: 'doit être un multiple de 5'}) if  duration % 5 != 0
      errors.add(:duration,:not_positif, {message: 'doit être un nombre positif'}) if duration < 0
    end
  
    #on start_date value  
    if !duration.nil? 
      errors.add(:start_date,:not_in_the_past, {message: 'doit être une date future'}) if start_date < Date.today
    end
  end

end