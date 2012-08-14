class MenuCell < Cell::Rails
  helper MenuHelper

  # method is now misnamed and closely coupled to template names... Rob?  --JWM
  
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
end
