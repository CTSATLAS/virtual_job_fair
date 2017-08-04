class Event < ApplicationRecord
  before_save :convert_timestamps

  validates_presence_of :title, :specialty, :visible_start, :visible_end, :starts_at, :ends_at

  private

  def convert_timestamps
    [:visible_start,
     :visible_end,
     :starts_at,
     :ends_at].each { |field| self.field = DateTime.parse(field) }
  end
end
