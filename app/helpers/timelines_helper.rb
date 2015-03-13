module TimelinesHelper
  def format_time_period(milestone, format='%B %Y')
    if milestone.present
      (format_date(milestone.date_start, format) + ' &mdash; ' + "Present").html_safe unless milestone.date_start.nil?
    else
      (format_date(milestone.date_start, format) + ' &mdash; ' + format_date(milestone.date_end, format)).html_safe unless milestone.date_start.nil? || milestone.date_end.nil?
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
