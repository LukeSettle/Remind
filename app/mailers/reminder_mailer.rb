class ReminderMailer < ApplicationMailer
  default from: 'reminderApp@no-reply'

  def remind(reminder_id)
    @reminder = Reminder.find(reminder_id)
    mail(to: @reminder.email, subject: 'Reminding you')
  end
end
