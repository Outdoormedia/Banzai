class MenuCell < Cell::Rails
  helper MenuHelper

  # method is now misnamed and closely coupled to template names... Rob?  --JWM
  def know(args)
    case args[:page].slug
    when 'plan'
      @roots = Refinery::Page.in_plan_menu.order('lft ASC')
    else
      @roots = Refinery::Page.in_know_menu.order('lft ASC')
    end
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
