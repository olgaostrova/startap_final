class StartupsController < ApplicationController
  load_and_authorize_resource


  def index
    def index
      if current_user && current_user.admin?
        @startups = Startup.all 
      elsif current_user 
        @startups = Startup.where(public: true)
      end
    end
  end
   
  def my
    if current_user
     @startups = current_user.startups
    end
   end

   # GET /startups/1 or /startups/1.json
   def show
    @startup = Startup.find(params[:id])
   end


end