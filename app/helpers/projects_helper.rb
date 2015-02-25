module ProjectsHelper
  def image_for(project)
    if project.images.blank?
      image_tag('http://placehold.it/350x150', alt: 'Placeholder')
    else
      image_tag(project.images.first.image.url, alt: project.images.first.description)
    end
  end
end
