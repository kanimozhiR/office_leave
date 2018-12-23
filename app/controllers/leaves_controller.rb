class LeavesController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

  before_action :set_leafe, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction


  # GET /leaves
  # GET /leaves.json
  def index
    @leaves = Leave.all
  end

  # GET /leaves/1
  # GET /leaves/1.json
  def show
  end

  # GET /leaves/new
  def new
    @leafe = Leave.new
  end

  # GET /leaves/1/edit
  def edit
  end

def apply_leave
    @leafe=Leave.new
  if params[:search]
          @leaves = Leave.search(params[:search]).order(sort_column + " " + sort_direction).order("created_at DESC").limit(10).page(params[:page])
  elsif params[:search]==""||nil||'NULL'
      @leaves = Leave.all.order(sort_column + " " + sort_direction).order('created_at DESC').limit(10).page(params[:page])
  else    
      @leaves = Leave.all.order(sort_column + " " + sort_direction).order('created_at DESC').limit(10).page(params[:page])
  end
    @l=Employee.where("email_id =?",current_user.email).pluck(:id).first
    @le = Leave.where("employee_id=?",@l).limit(3).page(params[:page]).order("created_at DESC")
end



def apply_leave_action
    @leafe=Leave.new(leafe_params)

    @employeeid=Employee.where("email_id =?",current_user.email).first
    @leafe.employee_id = @employeeid.id
    @leafe.action_date = DateTime.now
    @leafe.empid = @employeeid.empid
    @leafe.status = "Pending"
    @leafe.no_of_days = (@leafe.end_date-@leafe.start_date).to_i 
     @leafe.no_of_days = @leafe.no_of_days+1
    respond_to do |format|
      if @leafe.save
      format.html { redirect_to :controller => 'leaves', :action=> 'apply_leave', notice: 'Leave was successfully created.' }
        format.json { render :show, status: :created, location: @leafe }
      else
        format.html { render :apply_leave }
        format.json { render json: @leafe.errors, status: :unprocessable_entity }
      end
    end

end


   
  # POST /leaves
  # POST /leaves.json
  def create
    @leafe = Leave.new(leafe_params)

    respond_to do |format|
      if @leafe.save
        format.html { redirect_to @leafe, notice: 'Leave was successfully created.' }
        format.json { render :show, status: :created, location: @leafe }
      else
        format.html { render :new }
        format.json { render json: @leafe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leaves/1
  # PATCH/PUT /leaves/1.json
  def update
    respond_to do |format|
      if @leafe.update(leafe_params)
        format.html { redirect_to apply_leave_path, notice: 'Leave was successfully updated.' }
        format.json { render :show, status: :ok, location: @leafe }
      else
        format.html { render :edit }
        format.json { render json: @leafe.errors, status: :unprocessable_entity }
      end
    end
  end

def status_edit

end
  # DELETE /leaves/1
  # DELETE /leaves/1.json
  def destroy
    @leafe.destroy
    respond_to do |format|
      format.html { redirect_to apply_leave_path, notice: 'Leave was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leafe
      @leafe = Leave.find(params[:id])
    end

  def sort_column
    Leave.column_names.include?(params[:sort]) ? params[:sort] : "empid"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def leafe_params
      params.require(:leafe).permit(:empid,  :start_date, :end_date, :no_of_days, :leave_type, :action_date, :request_remarks, :action_remarks, :status,:admin_status)
    end
end
