# == Schema Information
#
# Table name: benches
#
#  id          :bigint           not null, primary key
#  description :string           not null
#  lat         :float            not null
#  lng         :float            not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Bench < ApplicationRecord
    validates :description, :lat, :lng, presence: true

    def self.in_bounds(bounds) 
        # bounds = {lng: [long_start, long_end], lat: [lat_start,lat_end]}
        if bounds
            Bench.where('lng BETWEEN ? AND ?', bounds[:lng][0], bounds[:lng][1])
            .where('lat BETWEEN ? AND ?', bounds[:lat][0], bounds[:lat][1])
        else 
            Bench.all
        end
    end
end
