class Event < ApplicationRecord
  validates_presence_of :title, :specialty, :visible_start, :visible_end, :starts_at, :ends_at
end
