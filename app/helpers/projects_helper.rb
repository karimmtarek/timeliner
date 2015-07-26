module ProjectsHelper
  def print_client(project)
    if project.client_url.blank?
      content_tag(:strong, project.client)
    else
      content_tag(:strong, link_to(project.client, project.client_url, :target => '_blank'))
    end
  end
end
