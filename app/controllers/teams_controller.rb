class TeamsController < ApplicationController

	def index
    @team = Team.new
  	@teams = current_admin.teams
  end



	def create
    @team = current_admin.teams.new(teams_params)
    respond_to do |format| 
      if @team.save
        format.html { redirect_to teams_path }
        format.js  
        flash[:notice] = "Successfully created team." 
      else
        format.js 
      end   
    end
  end


  def edit
  	@team = current_admin.teams.find(params[:id])
    render :layout => false
  end

  def update
  	@team = current_admin.teams.find(params[:id])
    if @team.update_attributes(teams_params)  
      flash[:notice] = "Updated team" 
	    redirect_to teams_path
	  else
	    render :action => 'edit'
	  end
  end

  def destroy
    @team = current_admin.teams.find(params[:id])
    if @team.destroy
      flash[:notice] = "Successfully deleted team." 
      redirect_to teams_path
    else
      flash[:notice] = "Successfully not deleted team." 
    end
  end


  private

  def teams_params
    params.require(:team).permit(:name)
  end

end
