module ApplicationHelper
  def markdown(text)
    options = {
      filter_html:     true,
      hard_wrap:       true,
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true,
      fenced_code_blocks: true
    }

    extensions = {
      autolink:           true,
      superscript:        true,
      disable_indented_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end

  def active_class?(controller, action, class_name='active')
    if controller_name == controller && action.any? {|action| action_name == action}
      class_name
    end
  end

  def image_for(project)
    if project.images.blank?
      image_tag('http://placehold.it/350x150', alt: 'Placeholder')
    else
      image_tag(project.images.first.image.url, alt: project.images.first.description)
    end
  end

  def format_date(date, format='%B %Y')
    date.strftime(format)
  end

  def put_content(tag, object)
    unless object.blank?
      content_tag(tag, object)
    end
  end
end
