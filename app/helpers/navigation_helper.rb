module NavigationHelper

  # called by layouts/_main_name to create links that are page-aware.
  # not used now because we didn't know the urls.  
  # In HAML, hence: - nav_tab( 'Homes', root_url, content: current_tab )
  def xnav_tab(title, url, options = {})
    current_tab = options.delete(:current)
    options[:class] = (current_tab == title) ? 'active' : 'inactive'
    content_tag(:li, link_to(title, url), options )

    logger.info("***** options: " + options.to_s )  
    logger.info("***** :current : " + :current.to_s )  
    logger.info("***** current_tab: " + current_tab.to_s )  
    logger.info("***** " + options[:class] + " ....")  
    logger.info("***** " + content_tag(:li, link_to(title, url), options ) + " ....")       
  end
  
  def nav_tab(title, page, options={})
    current_tab = options.delete(title)
    options[:class] = (current_tab == title) ? 'active' : 'inactive'
    content_tag(:li, link_to(title, title), options )    
  end

  def currently_at(tab)
    logger.info( "***** currently_at: " + tab + " *****")
    render partial: 'layouts/main_nav', locals: { current_tab: tab}
  end

end

