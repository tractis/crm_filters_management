require "fat_free_crm"

FatFreeCRM::Plugin.register(:crm_filters_management, initializer) do
          name "Fat Free CRM Filters Management"
       authors "Tractis - Jose Luis Gordo Romero"
       version "0.1"
   description "Adds management for filters to Fat Free CRM"
  dependencies :haml, :will_paginate
           tab :text => "filters", :url => { :controller => "user_filters" }
end
