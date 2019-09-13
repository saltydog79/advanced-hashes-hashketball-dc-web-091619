require "pry"


def game_hash
  game_hash = {
    :home => {
        :team_name => "Brooklyn Nets",
        :colors => ["Black", "White"],
        :players => [
            {name: "Alan Anderson", number: 0, shoe:  16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
            {name: "Reggie Evans", number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
            {name: "Brook Lopez", number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
            {name: "Mason Plumlee", number: 1, shoe: 19, points: 26, rebounds: 11, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
            {name: "Jason Terry", number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
            ]
    },

  :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
          {name: "Jeff Adrien", number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
          {name: "Bismack Biyombo", number: 0, shoe:  16, points: 12, rebounds: 4, assists: 7, steals: 22, blocks: 15, slam_dunks: 10},
          {name: "DeSagna Diop", number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
          {name: "Ben Gordon", number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
          {name: "Kemba Walker", number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals:7, blocks: 5, slam_dunks: 12}
          ]
  }
}
end


def num_points_scored(player)
  game_hash.each do | location, attributes |
     attributes[:players].each do | person |
return person[:points] if person[:name] == player
    end
  end
end


def shoe_size(player_name)
  game_hash.each do | location, attributes |
     attributes[:players].each do | person |
  return person[:shoe] if person[:name] == player_name
    end
  end
  end


def team_colors(team_name)
game_hash.each do | location, attributes |
if attributes[:team_name] == team_name
  return attributes[:colors].map
end
end
end


def team_names
game_hash.map do | location, team |
 team[:team_name]
end
end


def player_numbers(team_name)
game_hash.each do | location, team_data |
    if team_data[:team_name] == team_name
      return team_data[:players].map do | player | player[:number]
        end
      end
    end
end


def player_stats(player_name)
game_hash.each do | location, team_data |
  team_data[:players].each do | player |
  if player[:name] == player_name
    return player.tap { | person | person.delete(:name) }
      end
    end
  end
end


def big_shoe_rebounds
  shoe_size = 0
  rebounds = 0

  game_hash.each do | location, team_data |
    team_data[:players].each do | stats |
      if stats[:shoe] > shoe_size
        shoe_size = stats[:shoe]
        rebounds = stats[:rebounds]
      end
    end
  end
  rebounds
end

########## BONUS############

def most_points_scored
  most_points = 0
  super_star = ' '

  game_hash.each do | location, team_data |
    team_data[:players].each do | player |
      points = player[:points]
      if points > most_points
        most_points = points
        super_star = player[:name]
      end
    end
  end
  super_star
end


def winning_team
  total_points = 0
  top_team = ' '

  game_hash.each do | location, team_data |
    team_points = 0
    team_name = game_hash[location][:team_name]
    team_data[:players].each do | player |
      points = player[:points]
      team_points += points
    end
    top_team, total_points = team_name, team_points if team_points > total_points
  end
  return top_team
end


def player_with_longest_name
  longest = ' '
  longest_length = 0
  game_hash.each do | location, team_data |
    team_data[:players].each do | player |
      name_length = player[:name].length
      longest, longest_length = player[:name], name_length if name_length > longest_length
    end
  end
  return longest
end


#############SUPER_BONUS################

def long_name_steals_a_ton?

most_steals = 0
player_most_steals = ' '

game_hash.each do | location, team_data |
  team_data[:players].each do | player |
player_most_steals, most_steals = player[:name], player[:steals] if player[:steals] > most_steals
end
end
return  true if player_most_steals == player_with_longest_name
end
