module ApplicationHelper
  def render_menu(template)
    render_cell :menu, template.to_sym, :menu => refinery_menu_pages, :page => @page
  end
end
