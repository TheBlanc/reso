class Reservation < ApplicationRecord
  validates :name, :phonenumber, :partysize, :date, :time, presence: true
  validate :date_not_in_past

  def date_not_in_past
    if self.date && self.date < Date.today
      errors.add(:date, "Date can't be in the past")
    end
  end

end
