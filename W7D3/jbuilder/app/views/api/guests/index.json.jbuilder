json.array! @guests do |guest|
    if guest.age < 50 && guest.age > 40
        json.partial! 'api/guests/guest', guest: guest
    end
end