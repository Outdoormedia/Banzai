module NavigationHelper

  # called by layouts/_main_name to create links that are page-aware.
  # In HAML, hence: - nav_tab( 'Homes', root_url, content: current_tab )
  def nav_tab(title, options={})
    options[:class] = (@page.slug).casecmp(title) == 0 ? 'active' : 'inactive'
    content_tag(:li, link_to(title, title), options )    
  end

  def currently_at(tab)
    render partial: 'layouts/main_nav', locals: { current_tab: tab}
  end

end

