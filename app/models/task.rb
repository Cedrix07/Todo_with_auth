class Task < ApplicationRecord

  #validation
  validates :name, presence: true, length: {minimum:3, maximum:100}
  validates :description, presence: true, length: {maximum:255}
  validates :due_date, presence: true 
  validate :due_date_cannot_be_in_the_past


  private
    def due_date_cannot_be_in_the_past
      if due_date.present? && due_date < Date.today
        errors.add(:due_date, "Date must be a future date only")
      end
    end
end