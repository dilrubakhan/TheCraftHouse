class PagesController < ApplicationController
  def about
  end

  def contact
  	@submited = params["commit"]
  	@form_error = false
  	@name = params["name"]
  	@email = params["email"]
    @phone = params["phone"]
  	@question = params["question"]
    @error_msg_name = ""
    @error_msg_email = ""
    @error_msg_phone = ""
    @error_msg_question = ""
    if @submited.present?
       if @name == ""
                 @error_msg_name = "Must enter your name!"
                 @form_error = true
       end
       if @email == ""
                 @error_msg_email = "Must enter your email!"
                 @form_error = true
       end
       if @phone == ""
                 @error_msg_phone = "Must enter your Telephone number!"
                 @form_error = true
       end
       if @question == ""
                 @error_msg_question = "Must enter your question!"
                 @form_error = true
       end
       if !@form_error
         ContactMailer.contact_email(@name, @email, @phone, @question).deliver_now
       end
     end
  end
end
