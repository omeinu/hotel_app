class Reservation < ApplicationRecord
    
    validates :start_date, {presence: true}
    validates :end_date, {presence: true}
    validates :people, {numericality: true}
    
    validate :start_end_check
    validate :today_start_check

  def start_end_check
    if self.start_date && self.end_date
    errors.add(:end_date, "は開始日より前の日付は登録できません。") unless
    self.start_date < self.end_date 
    end
  end
  
  def today_start_check
    if self.start_date
    errors.add(:start_date, "は開始日より前の日付は登録できません。") unless
    Date.current < self.start_date 
    end
  end
    
end
