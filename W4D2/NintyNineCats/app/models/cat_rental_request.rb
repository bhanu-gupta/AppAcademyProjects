# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint           not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord
    STATUS = ['PENDING', 'APPROVED', 'DENIED']
    validates :cat_id, :start_date, :end_date, presence: true
    validates :status, inclusion: {in: STATUS}
    validate :does_not_overlap_approved_request

    belongs_to :cat,
        primary_key: :id,
        foreign_key: :cat_id,
        class_name: :Cat

    def approve!
        transaction do 
            self.update(status: 'APPROVED')
            overlapping_pending_requests.update_all(status: 'DENIED')
        end
    end


    private 


    def overlapping_requests
        CatRentalRequest.where(' cat_id = ?  AND  
            (start_date BETWEEN ? AND ? OR
            end_date BETWEEN ? AND ?) ', self.cat_id, self.start_date, self.end_date, self.start_date, self.end_date)
    end

    def overlapping_approved_requests
        overlapping_requests.where("status = 'APPROVED'")
    end
    
    def does_not_overlap_approved_request
       if overlapping_approved_requests.exists?
            errors.add(:request_overlapped, "overlapping requests")
       end
    end

    def overlapping_pending_requests
        overlapping_requests.where("status = 'PENDING'")
    end

end
