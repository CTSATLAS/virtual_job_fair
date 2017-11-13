class Event < ApplicationRecord
  validates_presence_of :title, :specialty, :visible_start, :visible_end, :starts_at, :ends_at

  scope :find_current_or_next, -> do
    where("starts_at <= ? AND ends_at > ?", DateTime.now, DateTime.now)
      .or(where("starts_at > ? AND ends_at > ?", DateTime.now, DateTime.now))
      .limit(1)
  end
end
