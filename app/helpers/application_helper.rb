module ApplicationHelper
  def render_menu(template, args = {})
    render_cell :menu, template.to_sym, {:menu => refinery_menu_pages, :page => @page}.merge(args)
  end
end
