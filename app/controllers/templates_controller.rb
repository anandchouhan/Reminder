class TemplatesController < ApplicationController


  def index
  	
  end



	def new
    @message_template = MessageTemplate.new
	end

	def create
		@message_template = MessageTemplate.new(template_params)
	  if @message_template.save
	    redirect_to admins_path
      flash[:notice] = "Successfully template created." 
	  else
	    render 'new'
	  end
	end
  
	private
  def template_params
    params.require(:message_template).permit(:title, :description)
  end

end
