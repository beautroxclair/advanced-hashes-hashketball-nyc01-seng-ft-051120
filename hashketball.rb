require "pry"
# Write your code below game_hash
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

def return_player_stats(name)
	data = game_hash
	stats = data.reduce({}) do |memo, (key, value)|
		if !memo[name]
			memo[name] = value.reduce(nil) do |memo0, (k0, val0)|
				if k0 == :players
					val0.each do |el|	
						if !memo0
							memo0 = el[:player_name] == name ? el : nil
						end	
					end
				end
				memo0
			end
		end
		memo
	end
end
      
      

def num_points_scored(name)
  stats = return_player_stats(name)
  points_scored = stats[name][:points]
end

def shoe_size(name)
  stats = return_player_stats(name)
  size = stats[name][:shoe]
end

def team_colors(team_name)
  colors = game_hash.reduce(nil) do |memo, (key, value)|
    if value[:team_name] == team_name && !memo
      memo = value[:colors]
    end
    memo
  end
  colors
end

def team_names
  names = game_hash.reduce([]) do |memo, (key, value)|
    memo.push(value[:team_name])
  end
end

def player_numbers(name)
  jerseys = game_hash.reduce([]) do |memo, (k, val)|
    if val[:team_name] == name
      val.reduce(nil) do |m0, (k0, val0)|
        if k0 == :players
          val0.map{|el| memo.push(el[:number])}
        end
        m0
      end
    end
    memo
  end
end

def player_stats(name)
  stats = return_player_stats(name)[name]
end

def big_shoe_rebounds
 	rebounds = game_hash.reduce(nil) do |memo, (key, value)|
	  	#keys are home and away value is {}
	    value.reduce(nil) do |m0, (k0, val0)|
	    	#k0 is :players
	     	if k0 == :players
	        	#look for biggest shoe
	        	biggest_shoe = 0
	        	val0.each do |el|
	        		if el[:shoe] > biggest_shoe
	        		  pp el[:shoe]
	        		  pp biggest_shoe
	        			biggest_shoe = el[:shoe]
	        			memo = el[:rebounds]
	        	  end
	        	end
	        end
	    end
	    memo
	end
end




