class User < ApplicationRecord


 # after_create :welcome_send

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable #,:confirmable
        

  has_address :address #gem specific

  validates :email, presence: true, null: false
  validates :encrypted_password, null: false
  validates :first_name, presence: false, length: { minimum: 2 }, allow_blank: true
  validates :last_name, presence: false, length: { minimum: 2 }, allow_blank: true
  validates :alias, uniqueness: true, length: { minimum: 2 }
  validates :description, presence: false, length: { maximum: 500 }, allow_blank: true
  validates :age, presence: true, numericality: { greater_than_or_equal_to: 5, less_than: 150 }

  has_many :attendances, foreign_key: 'attendee_id', dependent: :destroy
  has_many :attended_events, class_name: "Event", through: :attendances
  has_many :proposed_events, foreign_key: 'owner_id', class_name: "Event", dependent: :destroy
  has_many :comments

  ################################## Instance Methods

  def already_pay?(event)
    true if self.attended_events.find_by(id: event.id)
  end

  ################################## Private Methods
  private

  def welcome_send
    UserMailer.welcome_email(self).deliver_now if self.confirmed_at_changed?
  end

end
