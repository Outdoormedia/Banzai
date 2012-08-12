class MenuCell < Cell::Rails
  helper MenuHelper

  def know(args)
    @roots = Refinery::Page.in_know_menu.order('lft ASC')
    @roots_count = @roots.count
    @page = args[:page]

    render
  end

  def menu_branch(args)
    @collection = args[:collection]
    @roots_count = @collection.count
    @page = args[:active_page]

    render
  end
end
