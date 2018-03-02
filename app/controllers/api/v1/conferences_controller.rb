class Api::V1::ConferencesController < ApplicationController
  
  def index
    @conferences = Conference.all
    first_four = ["Mt St Mary's", "New Orleans", "Providence", "USC", "N.C. Central", "UC Davis", "Kansas St.", "Wake Forest"]

    require 'open-uri'
    io = open('http://sports.cbsimg.net/images/collegebasketball/ncaa-tournament/brackets/printable/cbs-sports-2017.pdf'.to_s)
    reader = PDF::Reader.new(io)
    reader.pages.each do |page|
      string = page.text
      
      @conferences.each do |conference|
        conference.teams.each do |team|

          if first_four.include?(team.college_name)
            team.update(first_four: true)
          end

          if team.update_first_round(string) == true
            team.update( first_round: true)
          end 

          if team.update_second_round(string) == true
            team.update(second_round: true)
          end 

          if team.update_regional_semifinals(string) == true
            team.update(regional_semifinals: true)
          end

          if team.update_regional_finals(string) == true
            team.update(regional_finals: true)
          end

          if team.update_final_four(string) == true
            team.update(final_four: true)
          end

          if team.update_national_championship(string) == true
            team.update(national_championship: true)
          end

          if team.update_winner(string) == true
            team.update(winner: true)
          end

        end 
      end

    end
    render 'index.json.jbuilder'
  end 

end
