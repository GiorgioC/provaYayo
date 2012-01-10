
Deface::Override.new(:virtual_path => "layouts/admin",
                     :name => "post_admin_tab",
                     :insert_bottom => "[data-hook='admin_tabs']",
                     :text => "<%= tab(:posts) %>",
                     :disabled => false)

#Deface::Override.new(:virtual_path => "layouts/admin",
#                     :name => "pages_admin_tab",
#                     :insert_bottom => "[data-hook='admin_tabs']",
#                     :text => "<%= tab(:pages) %>",
#                     :disabled => false)




  #insert_after :admin_user_form_fields, "admin/users/display_name"