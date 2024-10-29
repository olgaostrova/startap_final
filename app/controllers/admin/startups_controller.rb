class Admin::StartupsController < ApplicationController
  load_and_authorize_resource
  def index
    @startups = Startup.all
  end
end