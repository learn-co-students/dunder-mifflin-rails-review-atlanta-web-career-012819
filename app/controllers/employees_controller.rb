class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
  end

  def create
    # binding.pry
    @employee = Employee.new(employee_params)

    if @employee.valid?
      @employee.save
      redirect_to @employee
    else
      render :edit
    end
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    # binding.pry
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      redirect_to @employee
    else
      render :edit
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to employees_path
  end

  private

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id)
  end
end
