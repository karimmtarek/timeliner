module TimelinesHelper
  def format_time_period(milestone)
    if milestone.present
      "#{milestone.date_start.strftime('%b, %Y')} - Present"
    else
      "#{milestone.date_start.strftime('%b, %Y')} - #{milestone.date_end.strftime('%b, %Y')}"
    end
  end

  def pluralize_without_count(count, singular, plural = nil)
    word = if (count == 1 || count =~ /^1(\.0+)?$/)
      singular
    else
      plural || singular.pluralize
    end

    "#{word}"
  end
end
