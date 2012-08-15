class MenuCell < Cell::Rails
  helper MenuHelper
  
  def side_menu(args)
    @roots = Refinery::Page.send("in_#{args[:menu_name]}_menu").order('lft ASC')
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

  def main(args)
    @roots = args[:menu]
    render
  end

  def main_left(args)
    @roots = args[:menu].roots.select {|p| p[:menu_location] == 'main_left' }
    @roots_count = @roots.count
    @page = args[:page]
    @grouping = 8

    render :view => :grid_group
  end

  def main_right(args)
    @roots = args[:menu].roots.select {|p| p[:menu_location] == 'main_right' }
    @roots_count = @roots.count
    @page = args[:page]
    @grouping = 4

    render :view => :grid_group
  end
end
