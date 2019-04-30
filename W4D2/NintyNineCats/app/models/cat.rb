# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper

    COLORS = ['Black', 'Brown', 'White']
    SEX = ['M','F']
    
    validates :birth_date, :color, :name, :sex, :description, presence: true
    validates :color, inclusion: { in: COLORS}
    validates :sex, inclusion: { in: SEX}
    

    has_many :cat_rental_requests,
        primary_key: :id,
        foreign_key: :cat_id,
        class_name: :CatRentalRequest,
        dependent: :destroy

    def age
        distance_of_time_in_words(self.birth_date.to_time,Time.now) 
        #get current time
        #self.birth_date
        #some method to get the age
    end




end
