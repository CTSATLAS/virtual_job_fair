json.array! @events do |event|
  json.id event.id
  json.title event.title
  json.specialty event.specialty
  json.visible_start event.visible_start
  json.visible_end event.visible_end
  json.start event.starts_at
  json.end event.ends_at
  json.allow_late_registration event.allow_late_registration
  json.editable true
end
