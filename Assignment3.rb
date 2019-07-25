input_array = ["Team B;Team C;win",
"Team A;Team D;draw",
"Team A;Team B;win",
"Team D;Team C;loss",
"Team C;Team A;loss",
"Team B;Team D;win"]

def get_event(result, team1, team2)
  team1[:MP] += 1
  team2[:MP] += 1
  case result
  when "win"
    team1[:P] += 3
    team1[:W] += 1
    team2[:L] += 1
  when "draw"
    team1[:P] += 1
    team2[:P] += 1
    team1[:D] += 1
    team2[:D] += 1
  else
    team1[:L] += 1
    team1[:W] += 1
    team2[:P] += 3
  end
end

def find_team(teams, name)
  teams.select{|team| team[:name] == name}
end

def calculate(array)
  teams = []
  array.each do |match|
    result = match.split(";")
    final_result = result.last
    result.pop
    result.each do |name|
      obj = {
        name: name,
        MP: 0,
        W: 0,
        D: 0,
        L: 0,
        P: 0
      }
      unless find_team(teams, name).any?
        teams << obj
      end
    end
    team1 = teams.select{|team| p team[:name] == result.first}.first
    team2 = teams.select{|team| p team[:name] == result.last}.first
    get_event(final_result, team1, team2)
  end
  return teams.sort_by{|team| team[:name]}
end

calculate(input_array)
