require 'open-uri'

namespace :import do 
  desc "Task callled by Heroku scheduler add-on"
  task update_bracket: :environment do
    @conferences = Conference.all
    first_four = ["NC Central", "N. Dak. St.", "F. Dickinson", "Prairie View", "Belmont", "Temple", "Arizona St.", "St. John's"]
    
    io = open('http://sports.cbsimg.net/images/collegebasketball/ncaa-tournament/brackets/printable/cbs-sports-2019.pdf'.to_s)
    reader = PDF::Reader.new(io)
    
    string = reader.pages[0].text
    array = string.gsub!(/(\d+)|([ ]{2,})|(\n)/, ',').split(',').map(&:strip).reject { |string| string.empty? }
    # Turn all integers, spaces (more than 2), and new lines into commas. Split on commas. Remove extra spaces around strings and remove all empty strings from array.
    scorecard_hash = array.each_with_object(Hash.new(0)) { |team,count| count[team] += 1 }
    
    p scorecard_hash
    @conferences.each do |conference|
      conference.teams.each do |team|
        if first_four.include?(team.college_name)
          scorecard_hash[team.college_name] = (scorecard_hash[team.college_name]) - 1
          team.update(first_four: true)
        end

        if scorecard_hash[team.college_name] >=1
          team.update(first_round: true)
        end

        if scorecard_hash[team.college_name] >=2
          team.update(second_round: true)
        end

        if scorecard_hash[team.college_name] >=3
          team.update(regional_semifinals: true)
        end

        if scorecard_hash[team.college_name] >=4
          team.update(regional_finals: true)
        end

        if scorecard_hash[team.college_name] >=5
          team.update(final_four: true)
        end

        if scorecard_hash[team.college_name] >=6
          team.update(national_championship: true)
        end

        if scorecard_hash[team.college_name] >=7
          team.update(winner: true)
        end
      end
    end
  end
end
