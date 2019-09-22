class Attendance < ApplicationRecord
  after_create :new_attendance_send
  belongs_to :attendee, class_name: "User"
  belongs_to :attended_event, class_name:'Event'


  ################################## Private Methods
  private

  def new_attendance_send
    admin = User.find_by(email:$ADMIN)
    UserMailer.new_attendance_email(self).deliver_now 
  end

end
