class ReminderEmailJob < ApplicationJob
  queue_as :default

  def perform(*args)
    EmployeeNotifierMailer.send_reminder_email
  end
end
