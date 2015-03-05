
json.milestone do
  json.title @milestone.title
  if @milestone.company_url.blank?
    json.company @milestone.company
  else
    json.company "\<a href=#{@milestone.company_url} target='_blank'\>#{@milestone.company}\<\/a\>"
  end
  json.location @milestone.location
  json.time_period "#{@milestone.date_start.strftime('%b, %Y')} - #{@milestone.date_end.strftime('%b, %Y')}"
  json.description markdown(@milestone.description)
end