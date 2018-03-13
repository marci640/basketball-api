require 'csv'

namespace :import do 
  desc "Import data from csv"
  task teams: :environment do 
    filename = File.join Rails.root, "teams.csv"
    CSV.foreach(filename, headers: true) do |row|
      Team.create({
    conference_id: row[0],
    seed: row[1],
    college_name: row[2],
    first_four: false,
    first_round: false,
    second_round: false,
    regional_semifinals: false,
    regional_finals: false,
    final_four: false,
    national_championship: false,
    winner: false
      })
    end
  end 
end 

