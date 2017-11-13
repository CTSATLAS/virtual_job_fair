require 'rails_helper'

RSpec.describe Event, type: :model do
  describe '.find_current_or_next' do
    before do
      Timecop.freeze(2017, 11, 15, 1, 10, 5, 0)
    end

    it 'finds the current event if one exists' do
      create :past_event
      current_event = create :current_event
      create :first_future_event

      result = Event.find_current_or_next

      expect(result.count).to eq 1
      expect(result).to eq [current_event]
    end

    it 'find the next event if there is no current event' do
      create :past_event
      first_future_event = create :first_future_event
      create :second_future_event

      result = Event.find_current_or_next

      expect(result.count).to eq 1
      expect(result).to eq [first_future_event]
    end
  end
end
