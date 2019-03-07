class Api::V1::ConferencesController < ApplicationController

  def index
    @conferences = Conference.all
    render 'index.json.jbuilder'
  end

end
