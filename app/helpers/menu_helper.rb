module MenuHelper
  def css_for_item(index, has_children = false, page = nil, current_page = nil)
    css = []
    css << Refinery::Core.menu_css[:first] if index == 0 unless Refinery::Core.menu_css[:first].nil?
    css << Refinery::Core.menu_css[:last] if (index + 1) == @roots_count unless Refinery::Core.menu_css[:last].nil?
    css << 'current' if page.present? && page.id == current_page.id
    css << 'submenu' if has_children

    css
  end
end
