class RemindersController < ApplicationController
  def index
    @reminders = Reminder.all
  end

  def show
    @reminder = Reminder.find(params[:id])
  end

  def new
    @reminder = Reminder.new
  end

  def create
    @reminder = Reminder.new base_params
    if @reminder.save
      ReminderMailer.remind(@reminder.id).deliver_now
      flash[:success] = 'Reminder created'
      redirect_to :back
    else
      flash[:alert] = @reminder.errors
      redirect_to @reminder
    end
  end

  def update
    @reminder = Reminder.find(params[:id])
    @reminder.update base_params
    redirect_to reminders_path
  end

  protected

  def base_params
    params.require(:reminder).permit(:email, :phone_number, :message, :frequency, :completed)
  end
end
