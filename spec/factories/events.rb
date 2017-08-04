FactoryGirl.define do
  factory :event do
    title "MyString"
    specialty "MyString"
    visible_start "2017-08-03 13:33:25"
    visible_end "2017-08-03 13:33:25"
    starts_at "2017-08-03 13:33:25"
    ends_at "2017-08-03 13:33:25"
    allow_late_registration false
  end
end
