FactoryGirl.define do
  factory :past_event, class: Event do
    title "I'm in the past"
    specialty 'We need to go back... to the future'
    visible_start "2016-11-13 00:00:00"
    visible_end "2016-11-17 00:00:00"
    starts_at "2016-11-13 00:00:00"
    ends_at "2016-11-17 00:00:00"
    allow_late_registration false
  end

  factory :current_event, class: Event do
    title "I'm a current event"
    specialty ':burp: M-m-m-morty'
    visible_start "2017-11-13 00:00:00"
    visible_end "2017-11-17 00:00:00"
    starts_at "2017-11-13 00:00:00"
    ends_at "2017-11-17 00:00:00"
    allow_late_registration false
  end

  factory :first_future_event, class: Event do
    title "I'm the first future event"
    specialty "Where we're going... we don't need roads"
    visible_start "2018-11-13 00:00:00"
    visible_end "2018-11-17 00:00:00"
    starts_at "2018-11-13 00:00:00"
    ends_at "2018-11-17 00:00:00"
    allow_late_registration false
  end

  factory :second_future_event, class: Event do
    title "I'm the second future event"
    specialty "Gazorpazorpfield"
    visible_start "2019-11-13 00:00:00"
    visible_end "2019-11-17 00:00:00"
    starts_at "2019-11-13 00:00:00"
    ends_at "2019-11-17 00:00:00"
    allow_late_registration false
  end
end
