# This is a Guessing Game
# Created by Lazaro CachorroDoido Castro
# Date: 07/07/2017

def wellcome
  puts
  puts "   ____                     _                ____                              "
  puts "  / ___|_   _  ___  ___ ___(_)_ __   __ _   / ___| __ _ _ __ ___   ___         "
  puts " | |  _| | | |/ _ \\/ __/ __| | '_ \\ / _` | | |  _ / _` | '_ ` _ \\ / _ \\    "
  puts " | |_| | |_| |  __/\\__ \\__ \\ | | | | (_| | | |_| | (_| | | | | | |  __/     "
  puts "  \\____|\\__,_|\\___||___/___/_|_| |_|\\__, |  \\____|\\__,_|_| |_| |_|\\___| "
  puts "                                    |___/                                      "
  puts
  #puts
  #puts "        P  /_\\  P       "
  #puts "       /_\\_|_|_/_\\     "
  #puts "   n_n | ||. .|| | n_n   "
  #puts "   |_|_|nnnn nnnn|_|_|   "
  #puts "  |' '  |  |_|  |'  ' |  "
  #puts "  |_____| ' _ ' |_____|  "
  #puts "        \\__|_|__/       "
  #puts

  puts "Welcome to the Guessing Game"
  print "Whats your name? "
  name = gets.strip
  puts "\n\n\n\n"
  puts "We'll start The Guessing Game for you, #{name}."
  name
end

def choose_level
  puts "We have 5 levels of difficulty."
  print "What level of difficulty do you choose? "
  level = gets.to_i # This method is better becouse is more comprehensive
  # gets.to_i <-- This is another way to get the number of user
end

def number_chosen(level)
  case level
  when 1
    max = 10
  when 2
    max = 60
  when 3
    max = 100
  when 4
    max = 150
  else
    max = 200
  end

  puts "We choosing a secret number beetwen 1 and #{max}..."
  chosen = rand(max) + 1
  puts "Chosen... How about to guess our secret number today? "
  chosen
end

def call_number(hunchs, attempt, attempt_limit)
  puts "\n\n\n\n"
  puts "Hunch #{attempt} of #{attempt_limit}"
  puts "Hunchs so far: #{hunchs}"
  print "Type a number: "
  hunch = gets.strip
  puts "Are you right? Your hunch is #{hunch}"
  hunch.to_i
end

def check_if_ok(secret_number, hunch)
  hit = secret_number == hunch
  if hit
    puts "You're Goddamn Right! :-)"
    you_won
    return true
  end
  # puts "You're Wrong! :-("
  greater = secret_number > hunch
  if greater
    puts "The secret number is > (greater) then your hunch!"
  else
    puts "The secret number is < (less) then your hunch!"
  end
  return false
end

def you_won
  puts
  puts "             OOOOOOOOOOO               "
  puts "         OOOOOOOOOOOOOOOOOOO           "
  puts "      OOOOO    OOOOOOO    OOOOO        "
  puts "    OOOOOO      OOOOO      OOOOOO      "
  puts "  OOOOOOOO      OOOOO      OOOOOOOO    "
  puts " OOOOOOOOOO    OOOOOOO    OOOOOOOOOO   "
  puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
  puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
  puts "OOOO  OOOOOOOOOOOOOOOOOOOOOOOOO  OOOO  "
  puts " OOOO  OOOOOOOOOOOOOOOOOOOOOOO  OOOO   "
  puts "  OOOO   OOOOOOOOOOOOOOOOOOOO  OOOO    "
  puts "    OOOOO   OOOOOOOOOOOOOOO   OOOO     "
  puts "      OOOOOO   OOOOOOOOO   OOOOOO      "
  puts "         OOOOOO         OOOOOO         "
  puts "             OOOOOOOOOOOO              "
  puts
  puts
end

def you_lose
  puts "            YOU LOSE!!!      "
  puts "          \\|/ ____ \\|/  "
  puts "           @~/ ,. \\~@     "
  puts "          /_( \\__/ )_\\  "
  puts "             \\__U_/      "
end

def last_chance(secret_number)
  puts "This is your last chance to hit the Secret Number"
  puts "Type a last number: "
  number = gets.strip
  hit = number.to_i == secret_number
  if hit
    puts "You're Goddamn Right! :-)"
    you_won
    return true
  else
    you_lose
  end
end

def play(name, level)
  secret_number = number_chosen level# Function with parameter "level"
  attempt_limit = 5
  hunchs = []
  score_so_far = 1000
  # total_hunchs = 0
  for attempt in 1..attempt_limit
    hunch = call_number hunchs, attempt, attempt_limit

    hunchs << hunch # Type 3 - This is a simple type to write inside the array
    # hunchs[hunchs.size] = hunch  # Type 2
    # hunchs[total_hunchs] = hunch # Type 1
    # total_hunchs += 1            # Type 1
    if name.upcase == "LAZARO"
      puts "You're Goddamn Right! ;-)"
      won
      break
    end

    score_to_lose = (hunch - secret_number).abs / 2.0
    score_so_far = score_so_far - score_to_lose

    if attempt == attempt_limit
      if (hunch - secret_number).abs == 1
        last_chance(secret_number)
      end
    end

    break if check_if_ok secret_number, hunch
    # if check_if_ok secret_number, hunch
    #   break
    # end
  end

  puts "Your score was #{score_so_far}"
end

def want_to_play?
  puts "Do you want to play again? (Y/N)"
  want_to_play = gets.strip
  dont_want_to_play = want_to_play.upcase == "N"
end

# Call functions
name = wellcome # Function
level = choose_level #Function

# Obsolete code
# while want_to_play
#  play name, level
# end
loop do
  play name, level
  break if want_to_play?
end


