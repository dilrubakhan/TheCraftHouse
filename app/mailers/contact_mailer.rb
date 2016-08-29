# app/mailers/user_mailer.rb
class ContactMailer < ApplicationMailer
  default from: 'rubatanisa@gmail.com'
  layout 'contact_email'
  def contact_email(name, email, phone, question)
    @name = name
    @email = email
    @phone = phone
    @question = question
    mail(to: 'rubatanisa@gmail.com', subject: "Contact by #{@name}" ).deliver
  end
end
