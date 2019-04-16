require_relative 'super_useful'

puts "'five' == #{convert_to_int('five')}"

feed_me_a_fruit
begin
    sam = BestFriend.new('Joosh', 5, 'Reading')
    sam.talk_about_friendship
    sam.do_friendstuff
    sam.give_friendship_bracelet
rescue BestFriendYearError => e
    puts e.message()
rescue MinimumLengthError => e
    puts e.message()
end


