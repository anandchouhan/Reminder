class EmployeesController < ApplicationController


	def index
  	@employees = current_admin.employees.paginate(:page => params[:page], :per_page => 5)
  end


	def new
    @employee = current_admin.employees.new
	end


	def create
    binding.pry
    @employee = current_admin.employees.new(employee_params)
	  if @employee.save
	    redirect_to admin_employees_path
      flash[:notice] = "Successfully created employee." 
	  else
	    render 'new'
	  end
  end


  def edit
  	@employee = current_admin.employees.find(params[:id])
  end

  def update
  	@employee = current_admin.employees.find(params[:id])
    if @employee.update_attributes(employee_params)  
      flash[:notice] = "Updated employee detail" 
	    redirect_to admin_employees_path
	  else
	    render :action => 'edit'
	  end
  end

  def destroy
    @employee = current_admin.employees.find(params[:id])
    if @employee.destroy
      flash[:notice] = "Successfully deleted employee." 
      redirect_to admin_employees_path
    else
      flash[:notice] = "Successfully not deleted employee." 
    end
  end


  private

  def employee_params
    params.require(:employee).permit(:name, :email, :contact_no, :avatar, :date_of_birth)
  end

end
