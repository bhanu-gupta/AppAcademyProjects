# PHASE 2

require_relative "myerrors"
def convert_to_int(str)
  begin
    Integer(str)
  rescue ArgumentError => exception
    return nil
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else 
    raise WrongFruitError.new(maybe_fruit)
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  begin
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)  
  rescue WrongFruitError => e
    if e.message == 'coffee'
      puts 'Try again!'
      retry
    end
    puts "Entered fruit doesn't exist"
  end
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    if name.length == 0 || fav_pastime.length == 0
      raise MinimumLengthError.new("Your friend must have a name and/or a favorite pastime")
    else
      @name = name
      @fav_pastime = fav_pastime
    end

    if yrs_known < 5
      raise BestFriendYearError.new("You can't be a bestfriend if you haven't known each other for 5 years at least!!!")
    else
      @yrs_known = yrs_known
    end

  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


