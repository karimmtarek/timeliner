module MilestonesHelper
  def print_location(milestone)
    "#{milestone.location}, " unless milestone.location.blank?
  end

  def print_company(milestone)
    if milestone.company_url.blank?
      content_tag(:strong, milestone.company)
    else
      content_tag(:strong, link_to(milestone.company, milestone.company_url, :target => '_blank'))
    end
  end
end
