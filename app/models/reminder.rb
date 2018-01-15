class Reminder < ApplicationRecord
	belongs_to :admin
	belongs_to :employee
  validates  :title, :status, :employee_id, :presence => true
  belongs_to :message_template
	enum status: {"pending": "pending", "sent": "sent", "stop": "stop"}

	before_save :message_content 

  def message_content
  	employee_details = Employee.find(self.employee_id)
  	template_format = MessageTemplate.find(self.message_template_id)
  	template_content = Mustache.render(template_format.description, name: "#{employee_details.name}", email: "#{employee_details.email}")
    self.message = template_content
  end
end
