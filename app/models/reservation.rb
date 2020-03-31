class Reservation < ApplicationRecord
  validates :name, :phonenumber, :partysize, :date, :time, presence: true
  validate :date_not_in_past
  validate :phone_number_format

  def date_not_in_past
    if self.date && self.date < Date.current
      errors.add(:date, "Date can't be in the past")
    end
  end

  def phone_number_format
    if self.phonenumber
      numberLength = self.phonenumber.count "0123456789"
      dashLength = self.phonenumber.count "-"
      if numberLength != 10 && dashLength != 2
        errors.add(:phonenumber, "Incorrect Phonenumber Length and Format (XXX-XXX-XXXX)")
      elsif numberLength != 10
        errors.add(:phonenumber, "Incorrect Phonenumber Length")
      elsif dashLength != 2
        errors.add(:phonenumber, "Incorrect Phonenumber Format (XXX-XXX-XXXX)")
      end
    end
  end




end
