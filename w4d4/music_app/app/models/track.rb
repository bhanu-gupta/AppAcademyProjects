# == Schema Information
#
# Table name: tracks
#
#  id         :bigint           not null, primary key
#  album_id   :integer          not null
#  title      :string           not null
#  ord        :integer          not null
#  lyrics     :text
#  track_type :string           default("regular"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ApplicationRecord
    TRACK_TYPES = ['regular', 'bonus']
    validates :album_id, :title, :ord, :track_type, presence: true
    validates :track_type, inclusion: {in: Track::TRACK_TYPES}

    belongs_to :album
end
