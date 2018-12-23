class EmployeesController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all.order('created_at DESC').limit(10).page(params[:page])
  
  end

  # GET /employees/1
  # GET /employees/1.json
  def show

  end


  def emp_leave_status
  @employee =Employee.where("email_id =?", current_user.email).first

  end
  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
   
    @employee = Employee.new(employee_params)

    respond_to do |format|

      if @employee.save 
    @user=User.new
     @user.email=@employee.email_id
     @user.password="password"
     @user.password_confirmation="password"
     @user.employee_id= @employee.id
     @user.save
        format.html { redirect_to employees_path, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:employee_id,:user_id,:name, :empid, :age, :gender, :dob, :doj, :designation, :role, :phone, :email_id, :encashed_days, :separation_date, :manager_name)
    end
end
