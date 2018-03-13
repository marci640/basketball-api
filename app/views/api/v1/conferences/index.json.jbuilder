json.array! @conferences.each do |conference| 
  json.id conference.id 
  json.region conference.region
  json.teams conference.teams.each do |team|
    json.id team.id 
    json.conference_id team.conference_id 
    json.college_name team.college_name
    json.seed team.seed
    json.first_four team.first_four
    json.first_round team.first_round
    json.second_round team.second_round
    json.regional_semifinals team.regional_semifinals
    json.regional_finals team.regional_finals
    json.final_four team.final_four
    json.national_championship team.national_championship
    json.winner team.winner
  end
end