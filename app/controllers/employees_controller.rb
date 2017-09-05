class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new
    @employee.name = params[:employee][:name]

    if @employee.save
      flash[:notice] = "#{@employee.name} has been added!"
      redirect_to employees_path
    else
      flash.now[:alert] = "There was an error creating the Employee. Please try again."
      render :new
    end
  end

  def destroy
    @employee = Employee.find(params[:id])

    if @employee.destroy
      flash[:notice] = "\"#{@employee.name}\" was deleted successfully."
      redirect_to employees_path
    else
      flash.now[:alert] = "There was an error deleting the employee."
      render employees_path
    end
  end
end
