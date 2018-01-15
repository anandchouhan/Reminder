class TeamMembersController < ApplicationController


  def index
    @teams = current_admin.teams
  end

  def new
    @team = Team.find(params["team_id"])
  end

	def create
    custom_params = team_member_params
    custom_params["employee_id"].reject!(&:empty?)
    @team = Team.find(params["team_id"])
    existing_employee_ids = @team.team_members.where('employee_id in(?)', custom_params['employee_id']).pluck(:employee_id)
    mark_deleted_employee_ids = @team.team_members.where('employee_id not in(?)', custom_params['employee_id']).pluck(:id)
    custom_params["employee_id"].reject!{|e| existing_employee_ids.include? e.to_i}
    custom_params["employee_id"].each do |emp_id|
      @team.team_members.build(admin_id: current_admin.id, employee_id: emp_id)
    end

    delete_tm_arr = mark_deleted_employee_ids.map{|delete_id| {id: delete_id, _destroy: 'true'}}

    if @team.update({team_members_attributes: delete_tm_arr})
      redirect_to team_members_path
    else
      render 'new'
    end  
  end

  def destroy
    @member = current_admin.team_members.find(params[:id])
    if @member.destroy
      flash[:notice] = "Successfully deleted team's member." 
      redirect_to admin_team_members_path
    else
      flash[:notice] = "Successfully not team's member." 
    end
  end

  private

  def team_member_params
    params.require(:team_member).permit(:team_id, employee_id: [])
  end

end
