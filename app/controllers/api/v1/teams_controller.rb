class Api::V1::TeamsController < ApplicationController
  
  def index
    @teams = Team.all
    render 'index.json.jbuilder'
  end 
end
