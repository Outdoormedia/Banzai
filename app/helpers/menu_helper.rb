module MenuHelper
  def css_for_item(index, has_children = false, page = nil, current_page = nil)
    css = []
    css << Refinery::Core.menu_css[:first] if index == 0 unless Refinery::Core.menu_css[:first].nil?
    css << Refinery::Core.menu_css[:last] if (index + 1) == @roots_count unless Refinery::Core.menu_css[:last].nil?
    css << 'current' if page.present? && current_page.present? && page[:id] == current_page.id
    css << 'submenu' if has_children

    css
  end

  
  # This gives grid-specific classes instead of just first/last.
  def grid_css_for_item(index, has_children = false, page = nil, current_page = nil)
    css = []
    css << 'alpha' if index == 0
    # Only spit out omega if the grouping is satisfied (else we'll manually insert it)
    css << 'omega' if (index + 1) == @roots_count && @roots_count == @grouping
    css << 'current' if page.present? && current_page.present? && page[:id] == current_page.id
    css << 'submenu' if has_children

    css
  end

  # Sometimes, we just need alpha/omega classes (we can't rely on @roots_count being set, eg.)
  def simple_grid_css_for_item(index, item_count)
    css = []
    css << 'alpha' if index == 0
    css << 'omega' if (index + 1) == item_count

    css
  end
end
