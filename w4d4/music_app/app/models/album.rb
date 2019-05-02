# == Schema Information
#
# Table name: albums
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  year       :integer          not null
#  band_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  album_type :string           default("studio")
#

class Album < ApplicationRecord
    ALBUM_TYPES = ['live', 'studio']

    validates :title, :year, :album_type, :band_id, presence: true
    validates :album_type, inclusion: {in: Album::ALBUM_TYPES}   

    belongs_to :band
    
    has_many :tracks,
        dependent: :destroy
end
