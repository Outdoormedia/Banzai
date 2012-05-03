module NavigationHelper

  # called by layouts/_main_name to create links that are page-aware.
  # In HAML, hence: - nav_tab( 'Homes', root_url, content: current_tab )
  def xnav_tab(title, options={})
    options[:class] = (@page.slug).casecmp(title) == 0 ? 'active' : 'inactive'
    content_tag(:li, link_to(title, title), options )    
  end

  def nav_tab(title, url=title, options={})
    logger.info("***** #{@page.slug}, #{url}")
    options[:class] = (@page.slug).casecmp(url) == 0 ? 'active' : 'inactive'
    content_tag(:li, link_to(title, url), options )    
  end


  def currently_at(tab)
    render partial: 'layouts/main_nav', locals: { current_tab: tab}
  end

end

