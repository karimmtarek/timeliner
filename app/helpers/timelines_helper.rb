module TimelinesHelper
  def format_time_period(milestone)
    if milestone.present
      "#{milestone.date_start.strftime('%b, %Y')} - Present"
    else
      "#{milestone.date_start.strftime('%b, %Y')} - #{milestone.date_end.strftime('%b, %Y')}"
    end
  end
end
