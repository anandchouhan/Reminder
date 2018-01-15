class EmployeeNotifierMailer < ApplicationMailer
	default :from => 'gemsessence.com'

  def send_reminder_email
    @employee = Employee.first
    mail( :to => @employee.email,
    :subject => 'Thanks for signing up for our amazing app' )
  end

	def send_register(@user_info)
		binding.pry
  end  
end
