Deface::Override.new(:virtual_path => "layouts/admin",
                     :name => "home_resource_admin_tab",
                     :insert_bottom => "[data-hook='admin_tabs']",
                     :text => "<%= tab(:home_resources) %>",
                     :disabled => false)