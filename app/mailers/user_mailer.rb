class UserMailer < ApplicationMailer
  default from: 'no-reply@flaviecrochette.com'

  def welcome_email(user)
    @user = user
    @url  = 'https://flavie-crochette.herokuapp.com/users/sign_in' 
    @recipient = user
   # mail(to: @recipient, subject: 'Bienvenue chez Flavie Crochette !')
    @recipient = $ADMIN
   # mail(to: @recipient, subject: 'Nouvel inscription sur le site crochette') 
  end

  def new_attendance_email(attendance)
    @attendance = attendance 
    @recipient = attendance.attendee.email
   # mail(to: @recipient, subject: "Confirmation d'inscription à un événement chez Flavie Crochette")
    @recipient = $ADMIN
   # mail(to: @recipient, subject: "Nouvelle participation d'un inscrit à un événement") 
  end


end
