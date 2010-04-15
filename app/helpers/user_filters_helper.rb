module UserFiltersHelper
  
  #----------------------------------------------------------------------------
  def link_to_confirm(user_filter)
    link_to_remote(t(:delete) + "?", :method => :get, :url => confirm_user_filter_path(user_filter))
  end

  #----------------------------------------------------------------------------
  def link_to_delete(user_filter)
    link_to_remote(t(:yes_button),
      :method => :delete,
      :url => user_filter_path(user_filter),
      :before => visual_effect(:highlight, dom_id(user_filter), :startcolor => "#ffe4e1")
    )
  end

end