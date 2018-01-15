class RemindersController < ApplicationController
  
	def index
    @reminder = Reminder.new
  	@reminders = Reminder.all.order("reminder_at ASC").paginate(:page => params[:page], :per_page => 6)
  end

  def new
    @reminder = Reminder.new
  end

	def create
    binding.pry
    @reminder = current_admin.reminders.new(reminders_params)
    respond_to do |format| 
   	  if @reminder.save
        format.html { redirect_to admin_reminders_path }
        format.js  
        flash[:notice] = "Successfully set reminder." 
	    else
        format.html { render :new }
        format.json { render json: @reminder.errors, status: :unprocessable_entity }
        format.js 
      end   
	  end
  end


  def edit
  	@reminder = current_admin.reminders.find(params[:id])
    render :layout => false
  end

  def update
    binding.pry
  	@reminder = current_admin.reminders.find(params[:id])
    respond_to do |format| 
      if @reminder.update_attributes(reminders_params)
        format.html { redirect_to admin_reminders_path }
        format.js   
        flash[:notice] = "Updated reminder" 
  	  else
  	    format.html { render :edit }
        format.json { render json: @reminder.errors, status: :unprocessable_entity }
        format.js 
  	  end
    end
  end

  def destroy
    @reminder = current_admin.reminders.find(params[:id])
    if @reminder.destroy
      flash[:notice] = "Successfully deleted reminder." 
      redirect_to admin_reminders_path
    else
      flash[:notice] = "Successfully not deleted reminders." 
    end
  end


  private

  def reminders_params
    params.require(:reminder).permit(:title, :message, :message_template_id, :reminder_at, :status, :employee_id, :admin_id)
  end

end
